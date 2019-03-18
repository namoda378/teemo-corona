dimensions = {}

dimensions.W = display.safeActualContentWidth
dimensions.H = display.safeActualContentHeight
dimensions.CX = display.contentCenterX
dimensions.CY = display.contentCenterY
dimensions.L = display.safeScreenOriginX
dimensions.T = display.safeScreenOriginY
dimensions.R = display.safeScreenOriginX+display.safeActualContentWidth
dimensions.B = display.safeScreenOriginY+display.safeActualContentHeight
dimensions.Mult = dimensions.W/320

dump_table("dumping dimensions" , dimensions)

dimensions.GAME_WIDTH = 320
dimensions.GAME_HEIGHT = 480
dimensions.CHAMP_RADIUS = 30

if dimensions.H/dimensions.W < 1.6 then 
	dimensions.BFH = dimensions.H * 0.8
	dimensions.BFW = dimensions.BFH * (dimensions.GAME_WIDTH/dimensions.GAME_HEIGHT)
else
	dimensions.BFW = dimensions.W
	dimensions.BFH = dimensions.BFW * (dimensions.GAME_HEIGHT/dimensions.GAME_WIDTH)
end
dimensions.BFCR = dimensions.BFW * (dimensions.CHAMP_RADIUS/dimensions.GAME_WIDTH)
dimensions.BFX0 = dimensions.CX - dimensions.BFW/2 
dimensions.BFY0 = dimensions.CY - dimensions.BFH/2 
dimensions.GTOD = dimensions.BFW/dimensions.GAME_WIDTH 
dimensions.DTOG = dimensions.GAME_WIDTH/dimensions.BFW

dump_table("dumping dimensions" , dimensions)

local d = dimensions

dpacks = {}
dpacks.WHP = {0,0,dimensions.W+50,dimensions.H+50}
dpacks.BFWH = {0,0,dimensions.BFW,dimensions.BFH}
dpacks.CXY = {d.CX,d.CY}



dset = function(target,dobj)
	-- body
	if target == "CXY" then
		dobj.x,dobj.y = unpack(dpacks.CXY)		
	end

end