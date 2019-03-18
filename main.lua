--#############################################################################
--# Corona WebSockets Plugin Demo
--# (c)2018 C. Byerley (develephant)
--# Docs: https://develephant.github.io/websockets-plugin/
--#############################################################################


--^ forin a__global
--> require("{{ erb -sep |.| -xf -sk }}")
require("a__global.a__dump_table")
require("a__global.activate_multitouch")
require("a__global.b__make_string_callable")
require("a__global.c__exordinal_nametree")
require("a__global.dimensions")
require("a__global.dummy_func")
require("a__global.require_v")
require("a__global.uiutil")
--$

local bg = display.newRect(unpack(dpacks.WHP))
bg.x,bg.y = unpack(dpacks.CXY)
bg:setFillColor(1,1,1)

require_v("state.init")()
require_v("views.init")()

views.setNew("waitingRoomView")
-- views.setNew("battleFieldView")


-- local a = display.newRect(dimensions.CX,dimensions.CY,30,30)
-- a:setFillColor(1,0,0)
-- local dir = 1

-- Runtime:addEventListener("enterFrame",function( ... )
-- 	-- body
-- 	a.x = a.x + dir
-- 	if a.x > dimensions.W then
-- 		dir = -1
-- 	elseif a.x < dimensions.L then
-- 		dir = 1
-- 	end
-- end)

require_v("request.init")()

