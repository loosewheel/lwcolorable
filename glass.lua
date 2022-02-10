local utils = ...
local S = utils.S



minetest.register_node("lwcolorable:glass", {
	description = S("Colorable Glass"),
	drawtype = "glasslike_framed",
	tiles = { "lwcolorable_glass_edge.png", "lwcolorable_glass.png" },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = { node = 1, cracky = 3, glass = 1, oddly_breakable_by_hand = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_glass_defaults (),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:glass",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:glass",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:glass 4",
	recipe = {
		{ "default:glass", "default:glass"},
		{ "default:glass", "default:glass"},
	},
})



minetest.register_node("lwcolorable:stained_glass", {
	description = S("Colorable Stained Glass"),
	drawtype = "glasslike",
	tiles = { "lwcolorable_stained_glass.png" },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	use_texture_alpha = "blend",
	inventory_image = minetest.inventorycube (
		"lwcolorable_stained_glass_item.png",
		"lwcolorable_stained_glass_item.png",
		"lwcolorable_stained_glass_item.png"
	),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = { node = 1, cracky = 3, glass = 1, oddly_breakable_by_hand = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_glass_defaults (),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stained_glass",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stained_glass",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stained_glass",
	recipe = {
		{ "lwcolorable:glass"},
	},
})



minetest.register_node("lwcolorable:stained_glass_framed", {
	description = S("Colorable Framed Stained Glass"),
	drawtype = "glasslike_framed",
	tiles = { "lwcolorable_stained_glass_edge.png", "lwcolorable_stained_glass.png" },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	use_texture_alpha = "blend",
	inventory_image = minetest.inventorycube (
		"lwcolorable_stained_glass_framed_item.png",
		"lwcolorable_stained_glass_framed_item.png",
		"lwcolorable_stained_glass_framed_item.png"
	),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = { node = 1, cracky = 3, glass = 1, oddly_breakable_by_hand = 3, ud_param2_colorable = 1 },
	sounds = default.node_sound_glass_defaults (),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stained_glass_framed",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stained_glass_framed",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stained_glass_framed",
	recipe = {
		{ "lwcolorable:stained_glass"},
	},
})



--
