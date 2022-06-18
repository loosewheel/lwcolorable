local utils = ...
local S = utils.S



--
-- Railing registration helper
--
local fence_collision_extra = minetest.settings:get_bool ("enable_fence_tall") and 3/8 or 0

local function register_railing (name, def)
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
			fixed = { -1/8, -1/2, -1/8, 1/8, 1/2, 1/8 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -1/8, 1/4, -1/2,  1/8, 1/2, -1/8 },
			connect_left =  { -1/2, 1/4, -1/8, -1/8, 1/2,  1/8 },
			connect_back =  { -1/8, 1/4,  1/8,  1/8, 1/2,  1/2 },
			connect_right = {  1/8, 1/4, -1/8,  1/2, 1/2,  1/8 }
		},
		collision_box = {
			type = "connected",
			fixed = { -1/4, -1/2, -1/4, 1/4, 1/2 + fence_collision_extra, 1/4 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -1/8, 1/4, -1/2,  1/8, 1/2 + fence_collision_extra, -1/8 },
			connect_left =  { -1/2, 1/4, -1/8, -1/8, 1/2 + fence_collision_extra,  1/8 },
			connect_back =  { -1/8, 1/4,  1/8,  1/8, 1/2 + fence_collision_extra,  1/2 },
			connect_right = {  1/8, 1/4, -1/8,  1/2, 1/2 + fence_collision_extra,  1/8 }
		},
		connects_to = { "group:fence", "group:stone", "group:tree", "group:wall", "group:railing" },
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

	-- Always add to the railing group, even if no group provided
	def.groups.railing = 1

	minetest.register_node (name, def)

	minetest.register_craft({
		output = name .. " 5",
		recipe = {
			{ material, material, material },
			{ material, '', material },
		}
	})
end





register_railing ("lwcolorable:railing_stone", {
	description = S("Colorable Stone Railing"),
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
	output = "lwcolorable:railing_stone",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:railing_stone",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_railing ("lwcolorable:railing_wood", {
	description = S("Colorable Wood Railing"),
	texture = "lwcolorable_wood.png",
	material = "lwcolorable:wood",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:railing_wood",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:railing_wood",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



--
