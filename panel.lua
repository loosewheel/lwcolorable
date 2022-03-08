local utils = ...
local S = utils.S



--
-- Wall registration helper
--
local fence_collision_extra = minetest.settings:get_bool("enable_fence_tall") and 3/8 or 0

local function register_panel (name, def)
	local material = def.material

	def.material = nil

	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = { -1/16, -1/2, -1/16, 1/16, 1/2, 1/16 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -1/16, -1/2, -1/2,  1/16, 1/2, -1/16 },
			connect_left =  { -1/2, -1/2, -1/16, -1/16, 1/2,  1/16 },
			connect_back =  { -1/16, -1/2,  1/16,  1/16, 1/2,  1/2 },
			connect_right = {  1/16, -1/2, -1/16,  1/2, 1/2,  1/16 }
		},
		collision_box = {
			type = "connected",
			fixed = { -1/8, -1/8, -1/4, 1/4, 1/2 + fence_collision_extra, 1/4 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -1/16, -1/2, -1/2,  1/16, 1/2 + fence_collision_extra, -1/16 },
			connect_left =  { -1/2, -1/2, -1/16, -1/16, 1/2 + fence_collision_extra,  1/16 },
			connect_back =  { -1/16, -1/2,  1/16,  1/16, 1/2 + fence_collision_extra,  1/2 },
			connect_right = {  1/16, -1/2, -1/16,  1/2, 1/2 + fence_collision_extra,  1/16 }
		},
		connects_to = { "group:stone", "group:tree", "group:wood", "group:glass" },
		sunlight_propagates = true,
		is_ground_content = false,
		groups = { },
	}

	for k, v in pairs (default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the wall group, even if no group provided
	def.groups.glass = 1

	minetest.register_node (name, def)

	minetest.register_craft({
		output = name .. " 16",
		recipe = {
			{ material, material },
		}
	})
end





register_panel ("lwcolorable:stained_glass_panel", {
	description = S("Colorable Stained Glass Panel"),
	tiles = { "lwcolorable_stained_glass_panel_top.png", "lwcolorable_stained_glass_panel_top.png",
				 "lwcolorable_stained_glass_panel.png", "lwcolorable_stained_glass_panel.png",
				 "lwcolorable_stained_glass_panel.png", "lwcolorable_stained_glass_panel.png" },
	material = "lwcolorable:stained_glass_framed",
	wield_image = "lwcolorable_stained_glass_panel_item.png",
	inventory_image = "lwcolorable_stained_glass_panel_item.png",
	groups = { node = 1, cracky = 3, oddly_breakable_by_hand = 3, ud_param2_colorable = 1 },
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults (),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:stained_glass_panel",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:stained_glass_panel",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_panel ("lwcolorable:glass_panel", {
	description = S("Colorable Glass Panel"),
	tiles = { "lwcolorable_glass_panel_top.png", "lwcolorable_glass_panel_top.png",
				 "lwcolorable_glass_panel.png", "lwcolorable_glass_panel.png",
				 "lwcolorable_glass_panel.png", "lwcolorable_glass_panel.png" },
	material = "lwcolorable:glass",
	wield_image = "lwcolorable_glass_panel_item.png",
	inventory_image = "lwcolorable_glass_panel_item.png",
	groups = { node = 1, cracky = 3, oddly_breakable_by_hand = 3, ud_param2_colorable = 1 },
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	sounds = default.node_sound_glass_defaults (),
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:glass_panel",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:glass_panel",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



--
