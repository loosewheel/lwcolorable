local utils = ...
local S = utils.S



minetest.register_node ("lwcolorable:tile_light", {
	description = S("Colorable Light Tiles"),
	tiles = {"lwcolorable_tile_light.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_light",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_light",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_light 2",
	recipe = {
		{ "lwcolorable:stone_block", ""},
		{ "", "lwcolorable:stone_block"},
	},
})



minetest.register_node ("lwcolorable:tile_dark", {
	description = S("Colorable Dark Tiles"),
	tiles = {"lwcolorable_tile_dark.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_dark",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_dark",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_dark 2",
	recipe = {
		{ "lwcolorable:tile_light", ""},
		{ "", "lwcolorable:tile_light"},
	},
})



minetest.register_node ("lwcolorable:tile_light_small", {
	description = S("Colorable Small Light Tiles"),
	tiles = {"lwcolorable_tile_light_small.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_light_small",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_light_small",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_light_small 4",
	recipe = {
		{ "lwcolorable:tile_light", "lwcolorable:tile_light"},
		{ "lwcolorable:tile_light", "lwcolorable:tile_light"},
	},
})



minetest.register_node ("lwcolorable:tile_dark_small", {
	description = S("Colorable Small Dark Tiles"),
	tiles = {"lwcolorable_tile_dark_small.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_dark_small",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_dark_small",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_dark_small 4",
	recipe = {
		{ "lwcolorable:tile_dark", "lwcolorable:tile_dark"},
		{ "lwcolorable:tile_dark", "lwcolorable:tile_dark"},
	},
})



minetest.register_node ("lwcolorable:tile_check", {
	description = S("Colorable Check Tiles"),
	tiles = {"lwcolorable_tile_check.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_check",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_check",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_check 4",
	recipe = {
		{ "lwcolorable:tile_light", "lwcolorable:tile_dark"},
		{ "lwcolorable:tile_dark", "lwcolorable:tile_light"},
	},
})



minetest.register_node ("lwcolorable:tile_cross", {
	description = S("Colorable Cross Tiles"),
	tiles = {"lwcolorable_tile_cross.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_cross",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_cross",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_cross 4",
	recipe = {
		{ "lwcolorable:tile_light", "lwcolorable:tile_dark"},
		{ "lwcolorable:tile_light", "lwcolorable:tile_dark"},
	},
})



minetest.register_node ("lwcolorable:tile_check_white", {
	description = S("Colorable Check Tiles White"),
	tiles = {"lwcolorable_tile_check.png"},
	overlay_tiles = { { name = "lwcolorable_tile_check_overlay.png", color = "white" } },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_check_white",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_check_white",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_check_white 2",
	recipe = {
		{ "lwcolorable:tile_check", "lwcolorable:tile_light_small"}
	},
})



minetest.register_node ("lwcolorable:tile_cross_white", {
	description = S("Colorable Cross Tiles White"),
	tiles = {"lwcolorable_tile_cross.png"},
	overlay_tiles = { { name = "lwcolorable_tile_cross_overlay.png", color = "white" } },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tile_cross_white",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tile_cross_white",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:tile_cross_white 2",
	recipe = {
		{ "lwcolorable:tile_cross", "lwcolorable:tile_light_small"}
	},
})



--
