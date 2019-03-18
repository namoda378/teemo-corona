return function(group)
	-- body


	local color111_s ={
		me = {0,0.5,0.5},
		enemy = {0.5,0,0}
	}

	local posY_s  = {
		me = dimensions.BFH - dimensions.BFCR  ,
		enemy = dimensions.BFCR
	}


	local champs = {}

	for i,v in ipairs{"me","enemy"} do
		local champ = display.newCircle(0,0,dimensions.BFCR)
		champ:setFillColor(unpack(color111_s[v]))
		champ.y = posY_s[v]
		champ.x = dimensions.CX

		group:insert(champ)
		champs[v] = champ


		local HPbar = require_v("views.battleFieldView.champs.HPbar.new")()
		if v == "me" then

			HPbar.anchorX,HPbar.anchorY = 0,1
			HPbar.x,HPbar.y= dimensions.L,dimensions.B 

			local MPbar = require_v("views.battleFieldView.champs.MPbar.new")() 
			MPbar.anchorX,MPbar.anchorY = 0,1
			MPbar.x,MPbar.y= dimensions.L+ HPbar.bg.width ,dimensions.B 

			champ.MPbar = MPbar
			group:insertUnbinded(MPbar)			

		else
	
			HPbar.anchorX,HPbar.anchorY = 1,0
			HPbar.x,HPbar.y= dimensions.R,dimensions.T 

		end
		
		champ.HPbar = HPbar
		group:insertUnbinded(HPbar)
	end


	-- if true then
	-- 	local kii = 0
	-- 	local val = 100
	-- 	Runtime:addEventListener("enterFrame",function( ... )
	-- 		-- body
	-- 		val = val - 0.1
	-- 		if val < 30 then val = 100 end
			
	-- 		champs.me.MPbar:set(val)

	-- 		kii = kii + 0.1
	-- 		if kii > val then kii = 0 end
			
	-- 		champs.me.MPbar:setDelta(kii)


	-- 	end)
	-- end

	return champs
end