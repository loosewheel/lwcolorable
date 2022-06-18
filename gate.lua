local utils = ...
local S = utils.S



local function can_place (pos, player)
	return utils.can_place (pos) and not utils.is_protected (pos, player)
end



local function on_place (itemstack, placer, pointed_thing)
	if pointed_thing and pointed_thing.type == "node" then
		local param2 = 0
		local pos = pointed_thing.under

		local on_rightclick = utils.get_on_rightclick (pos, placer)
		if on_rightclick then
			return on_rightclick (pos, minetest.get_node (pos), placer, itemstack, pointed_thing)
		end

		if not can_place (pos, placer) then
			pos = pointed_thing.above

			if not can_place (pos, placer) then
				return itemstack
			end
		end

		if placer and placer:is_player () then
			param2 = minetest.dir_to_facedir (placer:get_look_dir (), false)
		end

		local base = itemstack:get_name ()
		local closed_name = base.."_closed_"..tostring (math.floor (param2 % 2))
		local open_name = base.."_open_"..tostring (param2)

		local color = 240
		local itable = itemstack:to_table ()

		if itable and itable.meta and itable.meta.palette_index then
			color = tonumber (itable.meta.palette_index) or 240
		end

		minetest.set_node (pos, { name = closed_name, param1 = 0, param2 = color })

		local meta = minetest.get_meta (pos)
		if meta then
			meta:set_string ("open", open_name)
			meta:set_string ("closed", closed_name)
			meta:set_string ("base", base)
			meta:set_int ("is_open", 0)
		end

		if not utils.is_creative (placer) then
			itemstack:set_count (itemstack:get_count () - 1)
		end
	end

	return itemstack
end



local function on_rightclick (pos, node, clicker, itemstack, pointed_thing)
	local meta = minetest.get_meta (pos)

	if node and meta then
		if meta:get_int ("is_open") == 0 then
			node.name = meta:get_string ("open")
			meta:set_int ("is_open", 1)

			minetest.sound_play ("doors_fencegate_open",
										{
											pos = pos,
											gain = 0.3,
											max_hear_distance = 10
										},
										true)
		else
			node.name = meta:get_string ("closed")
			meta:set_int ("is_open", 0)

			minetest.sound_play ("doors_fencegate_close",
										{
											pos = pos,
											gain = 0.3,
											max_hear_distance = 10
										},
										true)
		end

		if node.name:len () > 0 then
			minetest.swap_node (pos, node)
		end
	end

	return itemstack
end



local function on_dig (pos, node, digger)
	if utils.is_protected  (pos, digger) then
		return false
	end

	local base = node.name
	local meta = minetest.get_meta (pos)

	if meta then
		base = meta:get_string ("base")
	end

	local stack = ItemStack ({ name = base,
										count = 1,
										meta = { palette_index = tostring (node.param2) } })

	if not utils.is_creative (digger) then
		utils.wear_tool (node, digger)
	end

	if not utils.put_in_player_inv (stack, digger) then
		minetest.item_drop (stack, digger, pos)
	end

	minetest.remove_node (pos)

	return true
end


local fence_collision_extra = minetest.settings:get_bool ("enable_fence_tall") and 3/8 or 0


local function register_gate (name, def)
	local open_boxes =
	{
		{
			{ -0.625, -0.5, -0.125, -0.375, 0.5, 0.125 }, -- NodeBox1
			{ 0.375, -0.5, -0.125, 0.625, 0.5, 0.125 }, -- NodeBox3
			{ 0.375, -0.4375, -0.5, 0.5, 0.4375, 0.125 }, -- NodeBox5
			{ -0.5, -0.4375, -0.5, -0.375, 0.4375, 0.125 }, -- NodeBox6
		},
		{
			{ -0.125, -0.5, 0.375, 0.125, 0.5, 0.625 }, -- NodeBox1
			{ -0.125, -0.5, -0.625, 0.125, 0.5, -0.375 }, -- NodeBox3
			{ -0.5, -0.4375, -0.5, 0.125, 0.4375, -0.375 }, -- NodeBox5
			{ -0.5, -0.4375, 0.375, 0.125, 0.4375, 0.5 }, -- NodeBox6
		},
		{
			{ 0.375, -0.5, -0.125, 0.625, 0.5, 0.125 }, -- NodeBox1
			{ -0.625, -0.5, -0.125, -0.375, 0.5, 0.125 }, -- NodeBox3
			{ -0.5, -0.4375, -0.125, -0.375, 0.4375, 0.5 }, -- NodeBox5
			{ 0.375, -0.4375, -0.125, 0.5, 0.4375, 0.5 }, -- NodeBox6
		},
		{
			{ -0.125, -0.5, -0.625, 0.125, 0.5, -0.375 }, -- NodeBox1
			{ -0.125, -0.5, 0.375, 0.125, 0.5, 0.625 }, -- NodeBox3
			{ -0.125, -0.4375, 0.375, 0.5, 0.4375, 0.5 }, -- NodeBox5
			{ -0.125, -0.4375, -0.5, 0.5, 0.4375, -0.375 }, -- NodeBox6
		}
	}

	local selection_boxes =
	{
		{
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125}, -- NodeBox1
		},
		{
			{-0.125, -0.5, -0.5, 0.125, 0.5, 0.5}, -- NodeBox1
		},
		{
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125}, -- NodeBox1
		},
		{
			{-0.125, -0.5, -0.5, 0.125, 0.5, 0.5}, -- NodeBox1
		}
	}



	local collision_open_boxes =
	{
		{
			{ 0.375, -0.5, -0.125, 0.625, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox1
			{ -0.625, -0.5, -0.125, -0.375, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox3
			{ -0.5, -0.4375, -0.125, -0.375, 0.5 + fence_collision_extra, 0.5 }, -- NodeBox5
			{ 0.375, -0.4375, -0.125, 0.5, 0.5 + fence_collision_extra, 0.5 }, -- NodeBox6
		},
		{
			{ -0.125, -0.5, -0.625, 0.125, 0.5 + fence_collision_extra, -0.375 }, -- NodeBox1
			{ -0.125, -0.5, 0.375, 0.125, 0.5 + fence_collision_extra, 0.625 }, -- NodeBox3
			{ -0.125, -0.4375, 0.375, 0.5, 0.5 + fence_collision_extra, 0.5 }, -- NodeBox5
			{ -0.125, -0.4375, -0.5, 0.5, 0.5 + fence_collision_extra, -0.375 }, -- NodeBox6
		},
		{
			{ -0.625, -0.5, -0.125, -0.375, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox1
			{ 0.375, -0.5, -0.125, 0.625, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox3
			{ 0.375, -0.4375, -0.5, 0.5, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox5
			{ -0.5, -0.4375, -0.5, -0.375, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox6
		},
		{
			{ -0.125, -0.5, 0.375, 0.125, 0.5 + fence_collision_extra, 0.625 }, -- NodeBox1
			{ -0.125, -0.5, -0.625, 0.125, 0.5 + fence_collision_extra, -0.375 }, -- NodeBox3
			{ -0.5, -0.4375, -0.5, 0.125, 0.5 + fence_collision_extra, -0.375 }, -- NodeBox5
			{ -0.5, -0.4375, 0.375, 0.125, 0.5 + fence_collision_extra, 0.5 }, -- NodeBox6
		}
	}


	local closed_boxes =
	{
		{
			{ -0.625, -0.5, -0.125, -0.375, 0.5, 0.125 }, -- NodeBox1
			{ 0.375, -0.5, -0.125, 0.625, 0.5, 0.125 }, -- NodeBox3
			{ -0.5, -0.4375, -0.0625, 0.5, 0.4375, 0.0625 }, -- NodeBox4
		},
		{
			{ -0.125, -0.5, 0.375, 0.125, 0.5, 0.625 }, -- NodeBox1
			{ -0.125, -0.5, -0.625, 0.125, 0.5, -0.375 }, -- NodeBox3
			{ -0.0625, -0.4375, -0.5, 0.0625, 0.4375, 0.5 }, -- NodeBox4
		}
	}


	local collision_closed_boxes =
	{
		{
			{ -0.5, -0.5, -0.125, -0.375, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox1
			{ 0.375, -0.5, -0.125, 0.5, 0.5 + fence_collision_extra, 0.125 }, -- NodeBox3
			{ -0.5, -0.4375, -0.0625, 0.5, 0.5 + fence_collision_extra, 0.0625 }, -- NodeBox4
		},
		{
			{ -0.125, -0.5, 0.375, 0.125, 0.5 + fence_collision_extra, 0.5 }, -- NodeBox1
			{ -0.125, -0.5, -0.5, 0.125, 0.5 + fence_collision_extra, -0.375 }, -- NodeBox3
			{ -0.0625, -0.4375, -0.5, 0.0625, 0.5 + fence_collision_extra, 0.5 }, -- NodeBox4
		}
	}

	local item_groups = table.copy (def.groups or { })
	local node_groups = table.copy (def.groups or { })

	item_groups.node = 1
	item_groups.ud_param2_colorable = 1
	item_groups.fence = 1

	node_groups.node = 1
	node_groups.ud_param2_colorable = 1
	node_groups.not_in_creative_inventory = 1
	node_groups.fence = 1

	minetest.register_craftitem (name, {
		description = def.description or "Gate",
		wield_image = def.wield_image or def.inventory_image,
		inventory_image = def.inventory_image or def.wield_image,
		groups = item_groups,
		sounds = def.sounds,
		paramtype2 = "color",
		palette = "unifieddyes_palette_extended.png",
		on_place = on_place,
	})

	for i = 0, 3 do
		minetest.register_node (name.."_open_"..tostring (i), {
			description = def.description or "Door",
			tiles = def.tiles,
			drawtype = "nodebox",
			node_box = { type = "fixed", fixed = open_boxes[i + 1] },
			selection_box = { type = "fixed", fixed = selection_boxes[i + 1] },
			collision_box = { type = "fixed", fixed = collision_open_boxes[i + 1] },
			use_texture_alpha = def.use_texture_alpha,
			is_ground_content = false,
			groups = node_groups,
			sounds = def.sounds,
			paramtype = "light",
			paramtype2 = "color",
			palette = "unifieddyes_palette_extended.png",
			on_dig = on_dig,
			on_rightclick = on_rightclick,
		})
	end

	for i = 0, 1 do
		minetest.register_node (name.."_closed_"..tostring (i), {
			description = def.description or "Door",
			tiles = def.tiles,
			drawtype = "nodebox",
			node_box = { type = "fixed", fixed = closed_boxes[i + 1] },
			selection_box = { type = "fixed", fixed = selection_boxes[i + 1] },
			collision_box = { type = "fixed", fixed = collision_closed_boxes[i + 1] },
			use_texture_alpha = def.use_texture_alpha,
			is_ground_content = false,
			groups = node_groups,
			sounds = def.sounds,
			paramtype = "light",
			paramtype2 = "color",
			palette = "unifieddyes_palette_extended.png",
			on_dig = on_dig,
			on_rightclick = on_rightclick,
		})
	end

	unifieddyes.register_color_craft ({
		output = name,
		palette = "extended",
		type = "shapeless",
		neutral_node = name,
		recipe = {
			"NEUTRAL_NODE",
			"MAIN_DYE"
		}
	})
end





register_gate ("lwcolorable:gate_wood", {
	description = S("Colorable Wood Gate"),
	tiles = { "lwcolorable_wood.png" },
	wield_image = "lwcolorable_gate_wood_item.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	sounds = default.node_sound_wood_defaults ()
})



minetest.register_craft( {
	output = "lwcolorable:gate_wood",
	recipe = {
		{ "default:stick", "lwcolorable:wood", "default:stick" },
		{ "default:stick", "lwcolorable:wood", "default:stick" }
	},
})





register_gate ("lwcolorable:gate_plain", {
	description = S("Colorable Plain Gate"),
	tiles = { "lwcolorable_white.png" },
	wield_image = "lwcolorable_gate_plain_item.png",
	groups = { cracky = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	sounds = default.node_sound_wood_defaults ()
})



minetest.register_craft( {
	output = "lwcolorable:gate_plain",
	recipe = {
		{ "default:stick", "lwcolorable:boards", "default:stick" },
		{ "default:stick", "lwcolorable:boards", "default:stick" }
	},
})





register_gate ("lwcolorable:gate_tree", {
	description = S("Colorable Tree Gate"),
	tiles = { "lwcolorable_tree.png" },
	wield_image = "lwcolorable_gate_tree_item.png",
	groups = { cracky = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	sounds = default.node_sound_wood_defaults ()
})



minetest.register_craft( {
	output = "lwcolorable:gate_tree",
	recipe = {
		{ "default:stick", "lwcolorable:tree", "default:stick" },
		{ "default:stick", "lwcolorable:tree", "default:stick" }
	},
})





register_gate ("lwcolorable:gate_stone", {
	description = S("Colorable Stone Gate"),
	tiles = { "lwcolorable_stone.png" },
	wield_image = "lwcolorable_gate_stone_item.png",
	groups = { cracky = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	sounds = default.node_sound_stone_defaults ()
})



minetest.register_craft( {
	output = "lwcolorable:gate_stone",
	recipe = {
		{ "default:stick", "lwcolorable:stone", "default:stick" },
		{ "default:stick", "lwcolorable:stone", "default:stick" }
	},
})



--
