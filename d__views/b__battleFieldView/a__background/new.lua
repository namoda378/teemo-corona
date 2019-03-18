return function(group)
	-- body

	local bg = {}

	bg.back = display.newRect(0,0,dimensions.W+500,dimensions.H+500)
	bg.back:setFillColor(1,1,1)
	bg.back.x,bg.back.y = dimensions.CX,dimensions.CY


	bg.front = display.newRect(0,0,dimensions.BFW,dimensions.BFH)
	bg.front:setFillColor(0.8,0.8,1)

	bg.front.anchorX, bg.front.anchorY = 0             , 0
	bg.front.x,       bg.front.y       = 0 , 0


	local bg_front_half_width = bg.front.width/2
	local bg_front_half_height = bg.front.height/2

	bg.front.touch = function(self,event)
		-- body
		if event.phase == "began" or event.phase == "moved" then
			if event.phase == "began" then
		        display.getCurrentStage():setFocus( event.target, event.id )
			end
			local x, y = group:contentToLocal(event.x,event.y)
			local game_x,game_y = x*dimensions.DTOG , y*dimensions.DTOG
			state.duel_input.bg_touch = {x=game_x, y=game_y}
		else
			display.getCurrentStage():setFocus( event.target, nil )
			state.duel_input.bg_touch = nil 
		end

		return true
	end

	bg.front:addEventListener("touch")

	group:insert(bg.back)
	group:insert(bg.front)

	return 
end