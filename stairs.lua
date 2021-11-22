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

		local dir = { x = pointed_thing.under.x - pointed_thing.above.x,
						  y = pointed_thing.under.y - pointed_thing.above.y,
						  z = pointed_thing.under.z - pointed_thing.above.z }

		if dir.y > 0 then
			param2 = param2 + 4
		end

		local base = itemstack:get_name ()
		local place_name = base

		if param2 > 0 then
			place_name = base.."_"..tostring (param2)
		end

		local color = 240
		local itable = itemstack:to_table ()

		if itable and itable.meta and itable.meta.palette_index then
			color = tonumber (itable.meta.palette_index) or 240
		end

		minetest.set_node (pos, { name = place_name, param1 = 0, param2 = color })

		local meta = minetest.get_meta (pos)
		if meta then
			meta:set_string ("base", base)
		end

		if not utils.is_creative (player) then
			itemstack:set_count (itemstack:get_count () - 1)
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



local function register_stairs (name, def)
	local material = def.material

	local boxes =
	{
		{
			{ -0.5, -0.5, -0.5, 0.5, 0, 0 }, -- NodeBox1
			{ -0.5, -0.5, 0, 0.5, 0.5, 0.5 }, -- NodeBox2
		},
		{
			{ -0.5, -0.5, -0.5, 0, 0, 0.5 }, -- NodeBox1
			{ 0, -0.5, -0.5, 0.5, 0.5, 0.5 }, -- NodeBox2
		},
		{
			{ -0.5, -0.5, -0, 0.5, 0, 0.5 }, -- NodeBox1
			{ -0.5, -0.5, -0.5, 0.5, 0.5, -0 }, -- NodeBox2
		},
		{
			{ -0, -0.5, -0.5, 0.5, 0, 0.5 }, -- NodeBox1
			{ -0.5, -0.5, -0.5, -0, 0.5, 0.5 }, -- NodeBox2
		},
		{
			{-0.5, 0, -0.5, 0.5, 0.5, 0}, -- NodeBox1
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}, -- NodeBox2
		},
		{
			{-0.5, 0, -0.5, 0, 0.5, 0.5}, -- NodeBox1
			{0, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox2
		},
		{
			{-0.5, 0, -0, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0}, -- NodeBox2
		},
		{
			{-0, 0, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0, 0.5, 0.5}, -- NodeBox2
		}
	}

	def.groups.node = 1
	def.groups.ud_param2_colorable = 1

	for i = 0, 7 do
		local node_name = name
		local node_groups = table.copy (def.groups or { })

		if i > 0 then
			node_groups.not_in_creative_inventory = 1
			node_name = name.."_"..tostring (i)
		end

		minetest.register_node (node_name, {
			description = def.description or "Stairs",
			tiles = def.tiles,
			overlay_tiles = def.overlay_tiles,
			drawtype = "nodebox",
			node_box = { type = "fixed", fixed = boxes[i + 1] },
			selection_box = { type = "fixed", fixed = boxes[i + 1] },
			collision_box = { type = "fixed", fixed = boxes[i + 1] },
			use_texture_alpha = def.use_texture_alpha,
			is_ground_content = false,
			groups = node_groups,
			sounds = def.sounds,
			paramtype = def.paramtype,
			param1 = def.param1,
			paramtype2 = "color",
			palette = "unifieddyes_palette_extended.png",
			on_place = on_place,
			on_dig = on_dig,
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

	minetest.register_craft( {
		output = name.." 8",
		recipe = {
			{ "", "", material },
			{ "", material, material },
			{ material, material, material }
		},
	})
end





register_stairs ("lwcolorable:wood_stairs", {
	description = S("Colorable Wood Stairs"),
	tiles = { "lwcolorable_wood.png" },
	material = "lwcolorable:wood",
	is_ground_content = false,
	groups = { choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, wood = 1 },
	sounds = default.node_sound_wood_defaults(),
})



register_stairs ("lwcolorable:boards_stairs", {
	description = S("Colorable Boards Stairs"),
	tiles = {"lwcolorable_boards.png"},
	material = "lwcolorable:boards",
	groups = { choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, wood = 1 },
	sounds = default.node_sound_wood_defaults(),
})



register_stairs ("lwcolorable:parquet_stairs", {
	description = S("Colorable Parquet Stairs"),
	tiles = {"lwcolorable_parquet.png"},
	material = "lwcolorable:parquet",
	groups = { choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, wood = 1 },
	sounds = default.node_sound_wood_defaults(),
})



register_stairs ("lwcolorable:tree_stairs", {
	description = S("Colorable Tree Stairs"),
	tiles = {"lwcolorable_tree.png"},
	material = "lwcolorable:tree",
	groups = { tree = 1, choppy = 2, oddly_breakable_by_hand = 1,
				  flammable = 2 },
	sounds = default.node_sound_wood_defaults(),
})



register_stairs ("lwcolorable:plaster_stairs", {
	description = S("Colorable Plaster Stairs"),
	tiles = {"lwcolorable_plaster.png"},
	material = "lwcolorable:plaster",
	groups = { choppy = 3, oddly_breakable_by_hand = 1,
				  flammable = 2 },
	sounds = default.node_sound_wood_defaults(),
})



register_stairs ("lwcolorable:stone_stairs", {
	description = S("Colorable Stone Stairs"),
	tiles = {"lwcolorable_stone.png"},
	material = "lwcolorable:stone",
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})



register_stairs ("lwcolorable:stone_block_stairs", {
	description = S("Colorable Stone Block Stairs"),
	tiles = {"lwcolorable_stone_block.png"},
	material = "lwcolorable:stone_block",
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})



register_stairs ("lwcolorable:stone_brick_stairs", {
	description = S("Colorable Stone Brick Stairs"),
	tiles = {"lwcolorable_stone_brick.png"},
	material = "lwcolorable:stone_brick",
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})



register_stairs ("lwcolorable:stone_tile_stairs", {
	description = S("Colorable Stone Tile Stairs"),
	tiles = {"lwcolorable_stone_tile.png"},
	material = "lwcolorable:stone_tile",
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})



register_stairs ("lwcolorable:cobble_stairs", {
	description = S("Colorable Cobble Stairs"),
	tiles = {"lwcolorable_cobble.png"},
	material = "lwcolorable:cobble",
	groups = { cracky = 3, stone = 2 },
	sounds = default.node_sound_stone_defaults(),
})



register_stairs ("lwcolorable:brick_stairs", {
	description = S("Colorable Brick Stairs"),
	tiles = { "lwcolorable_brick.png" },
	overlay_tiles = { { name = "lwcolorable_brick_mortar.png", color = "white" } },
	material = "lwcolorable:brick",
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})



register_stairs ("lwcolorable:brick_light_stairs", {
	description = S("Colorable Light Brick Stairs"),
	tiles = { "lwcolorable_brick_light.png" },
	overlay_tiles = { { name = "lwcolorable_brick_light_mortar.png", color = "white" } },
	material = "lwcolorable:brick_light",
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults(),
})



--
