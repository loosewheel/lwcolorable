local utils = ...
local S = utils.S



local light_large_box = {
	type = "wallmounted",
	wall_top = { -0.375, 0.4375, -0.375, 0.375, 0.5, 0.375 },
	wall_bottom = { -0.375, -0.5, -0.375, 0.375, -0.4375, 0.375 },
	wall_side = { -0.5, -0.375, -0.375, -0.4375, 0.375, 0.375 },
}



minetest.register_node("lwcolorable:light_large_on", {
	drawtype = "nodebox",
	tiles = { "lwcolorable_light_large_on.png" },
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	legacy_wallmounted = true,
	sunlight_propagates = true,
	walkable = true,
	light_source = minetest.LIGHT_MAX,
	node_box = light_large_box,
	selection_box = light_large_box,
	groups = { dig_immediate = 3, not_in_creative_inventory = 1 },
	drop = "lwcolorable:light_large_off 1",
	sounds = default.node_sound_glass_defaults(),
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
      minetest.swap_node(pos, { name = "lwcolorable:light_large_off", param2 = node.param2 })
   end
})



minetest.register_node("lwcolorable:light_large_off", {
	drawtype = "nodebox",
	tiles = { "lwcolorable_light_large_off.png" },
	inventory_image = "lwcolorable_light_large_inv.png",
	wield_image = "lwcolorable_light_large_item.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = true,
	node_box = light_large_box,
	selection_box = light_large_box,
	groups = { dig_immediate = 3 },
	description = S("Large Light"),
	sounds = default.node_sound_glass_defaults(),
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
      minetest.swap_node(pos, { name = "lwcolorable:light_large_on", param2 = node.param2 })
   end
})



minetest.register_craft({
	output = "lwcolorable:light_large_off 1",
	recipe = {
		{"", "default:glass", ""},
		{"default:steel_ingot", "default:coal_lump", "default:copper_ingot"},
	}
})



local light_medium_box = {
	type = "wallmounted",
	wall_top = { -0.25, 0.4375, -0.25, 0.25, 0.5, 0.25 },
	wall_bottom = { -0.25, -0.5, -0.25, 0.25, -0.4375, 0.25 },
	wall_side = { -0.5, -0.25, -0.25, -0.4375, 0.25, 0.25 },
}



minetest.register_node("lwcolorable:light_medium_on", {
	drawtype = "nodebox",
	tiles = { "lwcolorable_light_medium_on.png" },
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	legacy_wallmounted = true,
	sunlight_propagates = true,
	walkable = true,
	light_source = minetest.LIGHT_MAX,
	node_box = light_medium_box,
	selection_box = light_medium_box,
	groups = { dig_immediate = 3, not_in_creative_inventory = 1 },
	drop = "lwcolorable:light_medium_off 1",
	sounds = default.node_sound_glass_defaults(),
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
      minetest.swap_node(pos, { name = "lwcolorable:light_medium_off", param2 = node.param2 })
   end
})



minetest.register_node("lwcolorable:light_medium_off", {
	drawtype = "nodebox",
	tiles = { "lwcolorable_light_medium_off.png" },
	inventory_image = "lwcolorable_light_medium_inv.png",
	wield_image = "lwcolorable_light_medium_item.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = true,
	node_box = light_medium_box,
	selection_box = light_medium_box,
	groups = { dig_immediate = 3 },
	description = S("Medium Light"),
	sounds = default.node_sound_glass_defaults(),
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
      minetest.swap_node(pos, { name = "lwcolorable:light_medium_on", param2 = node.param2 })
   end
})



minetest.register_craft({
	output = "lwcolorable:light_medium_off 2",
	recipe = {
		{"default:glass", "", "default:glass"},
		{"default:steel_ingot", "default:coal_lump", "default:copper_ingot"},
	}
})



local light_small_box = {
	type = "wallmounted",
	wall_top = { -0.125, 0.4375, -0.125, 0.125, 0.5, 0.125 },
	wall_bottom = { -0.125, -0.5, -0.125, 0.125, -0.4375, 0.125 },
	wall_side = { -0.5, -0.125, -0.125, -0.4375, 0.125, 0.125 },
}



minetest.register_node("lwcolorable:light_small_on", {
	drawtype = "nodebox",
	tiles = { "lwcolorable_light_small_on.png" },
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	legacy_wallmounted = true,
	sunlight_propagates = true,
	walkable = true,
	light_source = minetest.LIGHT_MAX,
	node_box = light_small_box,
	selection_box = light_small_box,
	groups = { dig_immediate = 3, not_in_creative_inventory = 1 },
	drop = "lwcolorable:light_small_off 1",
	sounds = default.node_sound_glass_defaults(),
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
      minetest.swap_node(pos, { name = "lwcolorable:light_small_off", param2 = node.param2 })
   end
})



minetest.register_node("lwcolorable:light_small_off", {
	drawtype = "nodebox",
	tiles = { "lwcolorable_light_small_off.png" },
	inventory_image = "lwcolorable_light_small_inv.png",
	wield_image = "lwcolorable_light_small_item.png",
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = true,
	node_box = light_small_box,
	selection_box = light_small_box,
	groups = { dig_immediate = 3 },
	description = S("Small Light"),
	sounds = default.node_sound_glass_defaults(),
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
      minetest.swap_node(pos, { name = "lwcolorable:light_small_on", param2 = node.param2 })
   end
})



minetest.register_craft({
	output = "lwcolorable:light_small_off 3",
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"default:steel_ingot", "default:coal_lump", "default:copper_ingot"},
	}
})



--
