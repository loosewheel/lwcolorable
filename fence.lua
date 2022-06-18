local utils = ...
local S = utils.S



--
-- Wall registration helper
--
local fence_collision_extra = minetest.settings:get_bool ("enable_fence_tall") and 3/8 or 0

local function register_paling_fence (name, def)
	local texture = def.texture
	local material = def.material
	local fence_texture = "lwcolorable_paling_overlay.png^" .. def.texture ..
			"^lwcolorable_paling_overlay.png^[makealpha:255,126,126"

	def.texture = nil
	def.material = nil

	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = { -0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625 },
			-- connect_top =
			-- connect_bottom =
			connect_front = {
									{ -0.0625, -0.5, -0.21875, 0.0625, 0.5, 0.0625 },
									{ -0.0625, -0.5, -0.5, 0.0625, 0.5, -0.28125 },
									{ -0.05, -0.125, -0.5, 0.05, 0.125, -0 },
								 },
			connect_left =  {
									{ -0.21875, -0.5, -0.0625, 0.0625, 0.5, 0.0625 },
									{ -0.5, -0.5, -0.0625, -0.28125, 0.5, 0.0625 },
									{ -0.5, -0.125, -0.05, -0, 0.125, 0.05 },
								 },
			connect_back =  {
									{ -0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.21875 },
									{ -0.0625, -0.5, 0.28125, 0.0625, 0.5, 0.5 },
									{ -0.05, -0.125, 0, 0.05, 0.125, 0.5 },
								 },
			connect_right = {
									{ -0.0625, -0.5, -0.0625, 0.21875, 0.5, 0.0625 },
									{ 0.28125, -0.5, -0.0625, 0.5, 0.5, 0.0625 },
									{ 0, -0.125, -0.05, 0.5, 0.125, 0.05 },
								 }
		},
		collision_box = {
			type = "connected",
			fixed = { -0.0625, -0.5, -0.0625, 0.0625, 0.5 + fence_collision_extra, 0.0625 },
			-- connect_top =
			-- connect_bottom =
			connect_front = {
									{ -0.0625, -0.5, -0.21875, 0.0625, 0.5 + fence_collision_extra, 0.0625 },
									{ -0.0625, -0.5, -0.5, 0.0625, 0.5 + fence_collision_extra, -0.28125 },
									{ -0.05, -0.125, -0.5, 0.05, 0.125, -0 },
								 },
			connect_left =  {
									{ -0.21875, -0.5, -0.0625, 0.0625, 0.5 + fence_collision_extra, 0.0625 },
									{ -0.5, -0.5, -0.0625, -0.28125, 0.5 + fence_collision_extra, 0.0625 },
									{ -0.5, -0.125, -0.05, -0, 0.125, 0.05 },
								 },
			connect_back =  {
									{ -0.0625, -0.5, -0.0625, 0.0625, 0.5 + fence_collision_extra, 0.21875 },
									{ -0.0625, -0.5, 0.28125, 0.0625, 0.5 + fence_collision_extra, 0.5 },
									{ -0.05, -0.125, 0, 0.05, 0.125, 0.5 },
								 },
			connect_right = {
									{ -0.0625, -0.5, -0.0625, 0.21875, 0.5 + fence_collision_extra, 0.0625 },
									{ 0.28125, -0.5, -0.0625, 0.5, 0.5 + fence_collision_extra, 0.0625 },
									{ 0, -0.125, -0.05, 0.5, 0.125, 0.05 },
								 }
		},
		connects_to = { "group:fence", "group:wood", "group:tree", "group:wall" },
		tiles = { texture },
		inventory_image = fence_texture,
		wield_image = fence_texture,
		sunlight_propagates = true,
		is_ground_content = false,
		groups = { },
	}

	for k, v in pairs (default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	minetest.register_node (name, def)

	minetest.register_craft({
		output = name .. " 8",
		recipe = {
			{ material, '', material },
			{ material, '', material },
		}
	})
end



local function register_picket_fence (name, def)
	local texture = def.texture
	local material = def.material
	local fence_texture = "lwcolorable_picket_overlay.png^" .. def.texture ..
			"^lwcolorable_picket_overlay.png^[makealpha:255,126,126"

	def.texture = nil
	def.material = nil

	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {
						{ -0.03,  0.2, -0.03, 0.03,  0.3, 0.03 },
						{ -0.03, -0.2, -0.03, 0.03, -0.3, 0.03 },
					  },
			-- connect_top =
			-- connect_bottom =
			connect_front = {
									{ -0.05, -0.5, -0.0357, 0.05, 0.4286, -0.2142 },
									{ -0.05, -0.5, -0.0714, 0.05, 0.4643, -0.1785 },
									{ -0.05, -0.5, -0.1071, 0.05, 0.5,    -0.1428 },
									{ -0.05, -0.5, -0.2856, 0.05, 0.4286, -0.4641 },
									{ -0.05, -0.5, -0.3213, 0.05, 0.4643, -0.4284 },
									{ -0.05, -0.5, -0.357, 0.05, 0.5,     -0.3927 },
									{ -0.03,  0.2, 0.0357, 0.03,  0.3, -0.5 },
									{ -0.03, -0.2, 0.0357, 0.03, -0.3, -0.5 },
								 },
			connect_left =  {
									{ -0.0357, -0.5, -0.05, -0.2142, 0.4286, 0.05 },
									{ -0.0714, -0.5, -0.05, -0.1785, 0.4643, 0.05 },
									{ -0.1071, -0.5, -0.05, -0.1428, 0.5,    0.05 },
									{ -0.2856, -0.5, -0.05, -0.4641, 0.4286, 0.05 },
									{ -0.3213, -0.5, -0.05, -0.4284, 0.4643, 0.05 },
									{ -0.357,  -0.5, -0.05, -0.3927, 0.5,    0.05 },
									{ 0.0357,  0.2, -0.03, -0.5,  0.3, 0.03 },
									{ 0.0357, -0.2, -0.03, -0.5, -0.3, 0.03 },
								 },
			connect_back =  {
									{ -0.05, -0.5, 0.0357, 0.05, 0.4286, 0.2142 },
									{ -0.05, -0.5, 0.0714, 0.05, 0.4643, 0.1785 },
									{ -0.05, -0.5, 0.1071, 0.05, 0.5,    0.1428 },
									{ -0.05, -0.5, 0.2856, 0.05, 0.4286, 0.4641 },
									{ -0.05, -0.5, 0.3213, 0.05, 0.4643, 0.4284 },
									{ -0.05,  -0.5, 0.357, 0.05, 0.5,    0.3927 },
									{ -0.03,  0.2, -0.0357, 0.03,  0.3, 0.5 },
									{ -0.03, -0.2, -0.0357, 0.03, -0.3, 0.5 },
								 },
			connect_right = {
									{ 0.0357, -0.5, -0.05, 0.2142, 0.4286, 0.05 },
									{ 0.0714, -0.5, -0.05, 0.1785, 0.4643, 0.05 },
									{ 0.1071, -0.5, -0.05, 0.1428, 0.5,    0.05 },
									{ 0.2856, -0.5, -0.05, 0.4641, 0.4286, 0.05 },
									{ 0.3213, -0.5, -0.05, 0.4284, 0.4643, 0.05 },
									{ 0.357,  -0.5, -0.05, 0.3927, 0.5,    0.05 },
									{ -0.0357,  0.2, -0.03, 0.5,  0.3, 0.03 },
									{ -0.0357, -0.2, -0.03, 0.5, -0.3, 0.03 },
								 }
		},
		selection_box = {
			type = "connected",
			fixed = { -0.03, -0.5, -0.03, 0.03, 0.5, 0.03 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -0.05, -0.5, 0.0357, 0.05, 0.5, -0.5 },
			connect_left =  { 0.0357, -0.5, -0.05, -0.5, 0.5, 0.05 },
			connect_back =  { -0.05, -0.5, -0.0357, 0.05, 0.5, 0.5 },
			connect_right = { -0.0357, -0.5, -0.05, 0.5, 0.5, 0.05 }
		},
		collision_box = {
			type = "connected",
			fixed = { -0.03, -0.5, -0.03, 0.03, 0.5, 0.03 },
			-- connect_top =
			-- connect_bottom =
			connect_front = { -0.05, -0.5, 0.0357, 0.05, 0.5, -0.5 },
			connect_left =  { 0.0357, -0.5, -0.05, -0.5, 0.5, 0.05 },
			connect_back =  { -0.05, -0.5, -0.0357, 0.05, 0.5, 0.5 },
			connect_right = { -0.0357, -0.5, -0.05, 0.5, 0.5, 0.05 }
		},
		connects_to = { "group:fence", "group:wood", "group:tree", "group:wall" },
		tiles = { texture },
		inventory_image = fence_texture,
		wield_image = fence_texture,
		sunlight_propagates = true,
		is_ground_content = false,
		groups = { },
	}

	for k, v in pairs (default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	minetest.register_node (name, def)

	minetest.register_craft({
		output = name .. " 8",
		recipe = {
			{ material, '', material },
		}
	})
end





register_paling_fence ("lwcolorable:wood_paling_fence", {
	description = S("Colorable Wood Paling Fence"),
	texture = "lwcolorable_wood_vertical.png",
	material = "lwcolorable:wood",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wood_paling_fence",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wood_paling_fence",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_paling_fence ("lwcolorable:tree_paling_fence", {
	description = S("Colorable Tree Paling Fence"),
	texture = "lwcolorable_tree.png",
	material = "lwcolorable:tree",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tree_paling_fence",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tree_paling_fence",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_paling_fence ("lwcolorable:plain_paling_fence", {
	description = S("Colorable Plain Paling Fence"),
	texture = "lwcolorable_white.png",
	material = "lwcolorable:boards",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:plain_paling_fence",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:plain_paling_fence",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_picket_fence ("lwcolorable:wood_picket_fence", {
	description = S("Colorable Wood Picket Fence"),
	texture = "lwcolorable_wood_vertical.png",
	material = "lwcolorable:wood",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:wood_picket_fence",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:wood_picket_fence",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_picket_fence ("lwcolorable:tree_picket_fence", {
	description = S("Colorable Tree Picket Fence"),
	texture = "lwcolorable_tree.png",
	material = "lwcolorable:tree",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:tree_picket_fence",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:tree_picket_fence",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})





register_picket_fence ("lwcolorable:plain_picket_fence", {
	description = S("Colorable Plain Picket Fence"),
	texture = "lwcolorable_white.png",
	material = "lwcolorable:boards",
	groups = { node = 1, choppy = 2, ud_param2_colorable = 1 },
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	on_construct = unifieddyes.on_construct,
	on_dig = unifieddyes.on_dig,
	sounds = default.node_sound_wood_defaults()
})



unifieddyes.register_color_craft ({
	output = "lwcolorable:plain_picket_fence",
	palette = "extended",
	type = "shapeless",
	neutral_node = "lwcolorable:plain_picket_fence",
	recipe = {
		"NEUTRAL_NODE",
		"MAIN_DYE"
	}
})



--
