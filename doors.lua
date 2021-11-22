local utils = ...
local S = utils.S



local function can_place (pos, player)
	local above = { x = pos.x, y = pos.y + 1, z = pos.z }

	return utils.can_place (pos) and utils.can_place (above) and
			 not utils.is_protected (pos, player) and
			 not utils.is_protected (above, player)
end



local function is_door_to_left (pos, param2)
	local dir = minetest.facedir_to_dir ((param2 + 3) % 4)

	local lpos = { x = dir.x + pos.x,
						y = dir.y + pos.y,
						z = dir.z + pos.z }


	local node = minetest.get_node_or_nil (lpos)

	if node and node.name ~= "air" then
		local def = minetest.registered_nodes[node.name]

		if def and def.groups and def.groups.door then
			return true
		end
	end

	return false
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
		local closed_name = base.."_"..tostring (param2)
		local open_name = base.."_"..tostring ((param2 + 1) % 4)

		if is_door_to_left (pos, param2) then
			open_name = base.."_"..tostring ((param2 + 3) % 4)
		end

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

		if not utils.is_creative (player) then
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

			minetest.sound_play ("doors_door_open",
										{
											pos = pos,
											gain = 0.3,
											max_hear_distance = 10
										},
										true)
		else
			node.name = meta:get_string ("closed")
			meta:set_int ("is_open", 0)

			minetest.sound_play ("doors_door_close",
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



local function register_door (name, def)
	local boxes =
	{
		{ -0.5, -0.5, -0.5, 0.5, 1.5, -6 / 16 },
		{ -0.5, -0.5, -0.5, -6 / 16, 1.5, 0.5 },
		{ -0.5, -0.5, 6 / 16, 0.5, 1.5, 0.5 },
		{ 6 / 16, -0.5, -0.5, 0.5, 1.5, 0.5 },
	}

	local meshes =
	{
		"lwcolorable_door_0.obj",
		"lwcolorable_door_1.obj",
		"lwcolorable_door_2.obj",
		"lwcolorable_door_3.obj"
	}

	local item_groups = table.copy (def.groups or { })
	local node_groups = table.copy (def.groups or { })

	item_groups.node = 1
	item_groups.ud_param2_colorable = 1
	item_groups.door = 1

	node_groups.node = 1
	node_groups.ud_param2_colorable = 1
	node_groups.not_in_creative_inventory = 1
	node_groups.door = 1

	minetest.register_craftitem (name, {
		description = def.description or "Door",
		wield_image = def.wield_image or def.inventory_image,
		inventory_image = def.inventory_image or def.wield_image,
		groups = item_groups,
		sounds = def.sounds,
		paramtype2 = "color",
		palette = "unifieddyes_palette_extended.png",
		on_place = on_place,
	})

	for i = 0, 3 do
		minetest.register_node (name.."_"..tostring (i), {
			description = def.description or "Door",
			tiles = def.tiles,
			drawtype = "mesh",
			mesh = meshes[i + 1],
			selection_box = { type = "fixed", fixed = { boxes[i + 1] } },
			collision_box = { type = "fixed", fixed = { boxes[i + 1] } },
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





register_door ("lwcolorable:door", {
	description = S("Colorable Door"),
	tiles = { "lwcolorable_door.png" },
	wield_image = "lwcolorable_door_item.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	sounds = default.node_sound_wood_defaults ()
})



minetest.register_craft( {
	output = "lwcolorable:door",
	recipe = {
		{ "lwcolorable:wood", "lwcolorable:wood" },
		{ "lwcolorable:wood", "lwcolorable:wood" },
		{ "lwcolorable:wood", "lwcolorable:wood" },
	},
})





register_door ("lwcolorable:door_glass", {
	description = S("Colorable Glass Door"),
	tiles = { "lwcolorable_door_glass.png" },
	wield_image = "lwcolorable_door_glass_item.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	use_texture_alpha = "blend",
	sounds = default.node_sound_wood_defaults ()
})



minetest.register_craft( {
	output = "lwcolorable:door_glass",
	recipe = {
		{ "lwcolorable:wood", "default:glass" },
		{ "lwcolorable:wood", "default:glass" },
		{ "lwcolorable:wood", "lwcolorable:wood" },
	},
})



--
