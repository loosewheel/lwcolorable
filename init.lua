local version = "0.1.6"



lwcolorable = { }



function lwcolorable.version ()
	return version
end



local utils = { }
local modpath = minetest.get_modpath ("lwcolorable")

loadfile (modpath.."/utils.lua") (utils)
loadfile (modpath.."/wood.lua") (utils)
loadfile (modpath.."/stone.lua") (utils)
loadfile (modpath.."/tiles.lua") (utils)
loadfile (modpath.."/wool.lua") (utils)
loadfile (modpath.."/doors.lua") (utils)
loadfile (modpath.."/wall.lua") (utils)
loadfile (modpath.."/railing.lua") (utils)
loadfile (modpath.."/glass.lua") (utils)
loadfile (modpath.."/panel.lua") (utils)
loadfile (modpath.."/gate.lua") (utils)
loadfile (modpath.."/stairs.lua") (utils)
loadfile (modpath.."/slabs.lua") (utils)
loadfile (modpath.."/lights.lua") (utils)
loadfile (modpath.."/fence.lua") (utils)



--
