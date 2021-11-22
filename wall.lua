local utils = ...
local S = utils.S



--
-- Wall registration helper
--
local fence_collision_extra = minetest.settings:get_bool("enable_fence_tall") and 3/8 or 0

local function register_wall (name, def)
	local texture = def.texture
	local material = def.material

	def.texture = nil
	def.material = nil

	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = { -1/4, -1/2, -1/4, 1/4, 1/2, 1/4 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -3/16, -1/2, -1/2,  3/16, 3/8, -3/16 },
			connect_left =  { -1/2, -1/2, -3/16, -3/16, 3/8,  3/16 },
			connect_back =  { -3/16, -1/2,  3/16,  3/16, 3/8,  1/2 },
			connect_right = {  3/16, -1/2, -3/16,  1/2, 3/8,  3/16 }
		},
		collision_box = {
			type = "connected",
			fixed = { -1/4, -1/2, -1/4, 1/4, 1/2 + fence_collision_extra, 1/4 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -3/16, -1/2, -1/2,  3/16, 1/2 + fence_collision_extra, -3/16 },
			connect_left =  { -1/2, -1/2, -3/16, -3/16, 1/2 + fence_collision_extra,  3/16 },
			connect_back =  { -3/16, -1/2,  3/16,  3/16, 1/2 + fence_collision_extra,  1/2 },
			connect_right = {  3/16, -1/2, -3/16,  1/2, 1/2 + fence_collision_extra,  3/16 }
		},
		connects_to = { "group:fence", "group:stone", "group:tree", "group:wall" },
		tiles = { texture },
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
	def.groups.wall = 1

	minetest.register_node (name, def)

	minetest.register_craft({
		output = name .. " 5",
		recipe = {
			{ material, '', material },
			{ material, material, material },
		}
	})

	local thin_def = table.copy (def)

	-- thin wall
	thin_def.node_box.fixed = { -3/16, -1/2, -3/16, 3/16, 3/8, 3/16 }
	thin_def.collision_box.fixed = { -3/16, -1/2, -3/16, 3/16, 1/2 + fence_collision_extra, 3/16 }

	thin_def.description = def.description.." Thin"

	minetest.register_node (name.."_thin", thin_def)

	minetest.register_craft({
		output = name .. "_thin 4",
		recipe = {
			{ material, "", material },
		}
	})
end





register_wall ("lwcolorable:wall_stone", {
	description = S("Colorable Stone Wall"),
	texture = "lwcolorable_stone.png",
	material = "lwcolorable:stone",
	groups = { node = 1, cracky = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wall_stone",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wall_stone",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wall_stone_thin",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wall_stone_thin",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_wall ("lwcolorable:wall_cobble", {
	description = S("Colorable Cobble Wall"),
	texture = "lwcolorable_cobble.png",
	material = "lwcolorable:cobble",
	groups = { node = 1, cracky = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wall_cobble",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wall_cobble",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wall_cobble_thin",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wall_cobble_thin",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



--
