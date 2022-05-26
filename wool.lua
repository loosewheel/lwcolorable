local utils = ...
local S = utils.S



minetest.register_node ("lwcolorable:carpet", {
	description = S("Colorable Carpet"),
	drawtype = "glasslike_framed",
	tiles = { "lwcolorable_carpet_edge.png", "lwcolorable_carpet.png" },
	is_ground_content = true,
	sunlight_propagates = false,
	walkable = true,
	pointable = true,
	diggable = true,
	climbable = false,
	buildable_to = false,
	floodable = false,
	liquidtype = "none",
	node_box = { type = "regular" },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
		},
	},
	groups = { node = 1, snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
				  flammable = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft({
	output = "lwcolorable:carpet",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:carpet",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft( {
	output = "lwcolorable:carpet 4",
	recipe = {
		{ "group:wool", "group:wool"},
		{ "group:wool", "group:wool"},
	},
})





minetest.register_node ("lwcolorable:carpet_cross", {
	description = S("Colorable Carpet Crossed"),
	drawtype = "glasslike_framed",
	tiles = { "lwcolorable_carpet_cross_edge.png", "lwcolorable_carpet_cross.png" },
	is_ground_content = true,
	sunlight_propagates = false,
	walkable = true,
	pointable = true,
	diggable = true,
	climbable = false,
	buildable_to = false,
	floodable = false,
	liquidtype = "none",
	node_box = { type = "regular" },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
		},
	},
	groups = { node = 1, snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
				  flammable = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft({
	output = "lwcolorable:carpet_cross",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:carpet_cross",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft( {
	output = "lwcolorable:carpet_cross 4",
	recipe = {
		{ "lwcolorable:carpet", "group:wool"},
		{ "group:wool", "lwcolorable:carpet"},
	},
})



--
