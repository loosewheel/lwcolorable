local utils = ...



if minetest.get_translator and minetest.get_translator ("lwcolorable") then
	utils.S = minetest.get_translator ("lwcolorable")
elseif minetest.global_exists ("intllib") then
   if intllib.make_gettext_pair then
      utils.S = intllib.make_gettext_pair ()
   else
      utils.S = intllib.Getter ()
   end
else
   utils.S = function (s) return s end
end



function utils.is_creative (player)
	if minetest.settings:get_bool ("creative_mode") then
		return true
	end

	if player and player:is_player () then
		return minetest.is_creative_enabled (player:get_player_name ()) or
				 minetest.check_player_privs (placer, "creative")
	end

	return false
end



function utils.is_protected (pos, player)
	local name = (player and player:get_player_name ()) or ""

	return minetest.is_protected (pos, name)
end



function utils.get_on_rightclick (pos, player)
	local node = minetest.get_node_or_nil (pos)

	if node then
		local def = minetest.registered_nodes[node.name]

		if def and def.on_rightclick and
			not (player and player:is_player () and
				  player:get_player_control ().sneak) then

				return def.on_rightclick
		end
	end

	return nil
end



function utils.can_place (pos)
	local node = minetest.get_node_or_nil (pos)

	if node and node.name ~= "air" then
		local def = minetest.registered_nodes[node.name]

		if not def or not def.buildable_to then
			return false
		end
	end

	return true
end



function utils.put_in_player_inv (stack, player)
	if player and player:is_player () then
		local inv = player:get_inventory ()

		if inv then
			if utils.is_creative (player) then
				local copy = ItemStack (stack)

				if copy then
					copy:set_count (1)

					local slots = inv:get_size ("main")

					for i = 1, slots do
						local slot = inv:get_stack ("main", i)

						if slot and not slot:is_empty () then
							slot:set_count (1)

							if slot:to_string () == copy:to_string () then
								return true
							end
						end
					end
				end

				inv:add_item ("main", stack)

				return true
			elseif inv:room_for_item ("main", stack) then
				inv:add_item ("main", stack)

				return true
			end
		end
	end

	return false
end



function utils.wear_tool (node, player)
	if player and player:is_player () then
		local tool = player:get_wielded_item ()
		local node_def = minetest.registered_items[node and node.name or ""]

		if node_def and tool then
			local tool_def = minetest.registered_items[tool:get_name ()]

			if tool_def then
				dig_params =
					minetest.get_dig_params (node_def.groups,
													 tool_def.tool_capabilities)

				if dig_params.diggable then
					if (tool:get_wear () + dig_params.wear) >= 65535 then
						player:set_wielded_item (ItemStack ())
					else
						tool:set_wear (tool:get_wear () + dig_params.wear)
						player:set_wielded_item (tool)
					end

					return true
				end
			end
		end
	end

	return false
end



--
