local utils = ...
local S = utils.S



minetest.register_node ("lwcolorable:wood", {
	description = S("Colorable Wood"),
	tiles = {"lwcolorable_wood.png"},
	is_ground_content = false,
	groups = { node = 1, choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, wood = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wood",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wood",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:wood 4",
	recipe = {
		{ "group:wood", "group:wood"},
		{ "group:wood", "group:wood"},
	},
})





minetest.register_node ("lwcolorable:boards", {
	description = S("Colorable Boards"),
	tiles = {"lwcolorable_boards.png"},
	is_ground_content = false,
	groups = { node = 1, choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, wood = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:boards",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:boards",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:boards 4",
	recipe = {
		{ "lwcolorable:wood", "lwcolorable:wood"},
		{ "lwcolorable:wood", "lwcolorable:wood"},
	},
})





minetest.register_node ("lwcolorable:parquet", {
	description = S("Colorable Parquet"),
	tiles = {"lwcolorable_parquet.png"},
	is_ground_content = false,
	groups = { node = 1, choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, wood = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:parquet",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:parquet",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:parquet 4",
	recipe = {
		{ "lwcolorable:boards", "lwcolorable:wood"},
		{ "lwcolorable:wood", "lwcolorable:boards"},
	},
})





minetest.register_node ("lwcolorable:tree", {
	description = S("Colorable Tree"),
	tiles = {"lwcolorable_tree.png"},
	is_ground_content = false,
	groups = { node = 1, tree = 1, choppy = 2, oddly_breakable_by_hand = 1,
				  flammable = 2, ud_param2_colorable = 1 },
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tree",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tree",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tree 4",
	recipe = {
		{ "group:tree", "group:tree"},
		{ "group:tree", "group:tree"},
	},
})





minetest.register_node ("lwcolorable:plaster", {
	description = S("Colorable Plaster"),
	tiles = {"lwcolorable_plaster.png"},
	is_ground_content = false,
	groups = { node = 1, choppy = 3, oddly_breakable_by_hand = 1,
				  flammable = 2, ud_param2_colorable = 1 },
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:plaster",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:plaster",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:plaster 4",
	recipe = {
		{ "group:wood", "default:silver_sand"},
		{ "group:wood", "group:wood"},
	},
})





default.register_fence ("lwcolorable:fence_wood", {
	description = S("Colorable Wood Fence"),
	texture = "lwcolorable_wood.png",
	inventory_image = "default_fence_overlay.png^lwcolorable_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^lwcolorable_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "lwcolorable:wood",
	groups = { node = 1, choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, ud_param2_colorable = 1},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:fence_wood",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:fence_wood",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



default.register_fence_rail ("lwcolorable:fence_rail_wood", {
	description = S("Colorable Wood Fence Rail"),
	texture = "lwcolorable_fence_rail_wood.png",
	inventory_image = "default_fence_rail_overlay.png^lwcolorable_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^lwcolorable_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "lwcolorable:wood",
	groups = { node = 1, choppy = 2, oddly_breakable_by_hand = 2,
				  flammable = 2, ud_param2_colorable = 1},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:fence_rail_wood",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:fence_rail_wood",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})
