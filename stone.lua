local utils = ...
local S = utils.S



minetest.register_node ("lwcolorable:stone", {
	description = S("Colorable Stone"),
	tiles = {"lwcolorable_stone.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stone",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stone",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stone 2",
	recipe = {
		{ "default:stone", ""},
		{ "", "default:stone"},
	},
})





minetest.register_node ("lwcolorable:stone_block", {
	description = S("Colorable Stone Block"),
	tiles = {"lwcolorable_stone_block.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stone_block",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stone_block",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stone_block 4",
	recipe = {
		{ "default:stone_block", "default:stone_block"},
		{ "default:stone_block", "default:stone_block"},
	},
})





minetest.register_node ("lwcolorable:stone_beam", {
	description = S("Colorable Stone Beam"),
	tiles = {"lwcolorable_stone_beam.png", "lwcolorable_stone.png"},
	drawtype = "glasslike_framed",
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stone_beam",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stone_beam",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stone_beam 4",
	recipe = {
		{ "lwcolorable:stone_block", "lwcolorable:stone_block"},
		{ "lwcolorable:stone_block", "lwcolorable:stone_block"},
	},
})





minetest.register_node ("lwcolorable:stone_brick", {
	description = S("Colorable Stone Brick"),
	tiles = {"lwcolorable_stone_brick.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stone_brick",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stone_brick",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stone_brick 4",
	recipe = {
		{ "default:stonebrick", "default:stonebrick"},
		{ "default:stonebrick", "default:stonebrick"},
	},
})





minetest.register_node ("lwcolorable:stone_tile", {
	description = S("Colorable Stone Tile"),
	tiles = {"lwcolorable_stone_tile.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stone_tile",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stone_tile",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:stone_tile 4",
	recipe = {
		{ "lwcolorable:stone_brick", "lwcolorable:stone"},
		{ "lwcolorable:stone", "lwcolorable:stone_brick"},
	},
})





minetest.register_node ("lwcolorable:cobble", {
	description = S("Colorable Cobble"),
	tiles = {"lwcolorable_cobble.png"},
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 2, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:cobble",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:cobble",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:cobble 4",
	recipe = {
		{ "default:cobble", "default:cobble"},
		{ "default:cobble", "default:cobble"},
	},
})





minetest.register_node ("lwcolorable:column", {
	description = S("Colorable Column"),
	tiles = {"lwcolorable_stone_block.png", "lwcolorable_stone_block.png",
				"lwcolorable_column.png", "lwcolorable_column.png",
				"lwcolorable_column.png", "lwcolorable_column.png" },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft  ({
	output = "lwcolorable:column",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:column",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:column 4",
	recipe = {
		{ "default:stone", "default:stone"},
		{ "", ""},
		{ "default:stone", "default:stone"},
	},
})





minetest.register_node ("lwcolorable:column_top", {
	description = S("Colorable Column Top"),
	tiles = {"lwcolorable_stone_block.png", "lwcolorable_stone_block.png",
				"lwcolorable_column_top.png", "lwcolorable_column_top.png",
				"lwcolorable_column_top.png", "lwcolorable_column_top.png" },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:column_top",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:column_top",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:column_top 2",
	recipe = {
		{ "default:stone"},
		{ "lwcolorable:column"},
	},
})





minetest.register_node ("lwcolorable:column_bottom", {
	description = S("Colorable Column Bottom"),
	tiles = {"lwcolorable_stone_block.png", "lwcolorable_stone_block.png",
				"lwcolorable_column_bottom.png", "lwcolorable_column_bottom.png",
				"lwcolorable_column_bottom.png", "lwcolorable_column_bottom.png" },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:column_bottom",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:column_bottom",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:column_bottom 2",
	recipe = {
		{ "lwcolorable:column"},
		{ "default:stone"},
	},
})





default.register_fence ("lwcolorable:fence_stone", {
	description = S("Colorable Stone Fence"),
	texture = "lwcolorable_stone.png",
	inventory_image = "default_fence_overlay.png^lwcolorable_stone.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^lwcolorable_stone.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "lwcolorable:stone",
	groups = { node = 1, cracky = 2, ud_param2_colorable = 1 },
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_stone_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:fence_stone",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:fence_stone",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





default.register_fence_rail ("lwcolorable:fence_rail_stone", {
	description = S("Colorable Stone Fence Rail"),
	texture = "lwcolorable_stone.png",
	inventory_image = "default_fence_rail_overlay.png^lwcolorable_stone.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^lwcolorable_stone.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "lwcolorable:stone",
	groups = { node = 1, cracky = 2, ud_param2_colorable = 1 },
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_stone_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:fence_rail_stone",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:fence_rail_stone",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





minetest.register_node ("lwcolorable:brick", {
	description = S("Colorable Brick"),
	tiles = { "lwcolorable_brick.png" },
	overlay_tiles = { { name = "lwcolorable_brick_mortar.png", color = "white" } },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:brick",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:brick",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:brick 4",
	recipe = {
		{ "default:brick", "default:brick"},
		{ "default:brick", "default:brick"},
	},
})





minetest.register_node ("lwcolorable:brick_light", {
	description = S("Colorable Light Brick"),
	tiles = { "lwcolorable_brick_light.png" },
	overlay_tiles = { { name = "lwcolorable_brick_light_mortar.png", color = "white" } },
	is_ground_content = false,
	groups = { node = 1, cracky = 3, stone = 1, ud_param2_colorable = 1 },
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:brick_light",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:brick_light",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



minetest.register_craft ( {
	output = "lwcolorable:brick_light 4",
	recipe = {
		{ "lwcolorable:brick", "default:brick"},
		{ "default:brick", "lwcolorable:brick"},
	},
})



--
