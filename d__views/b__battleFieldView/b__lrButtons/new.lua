


return function(group)
	-- body
	local buttons = {}

	local function updateLRState()
		-- body
		if not (buttons["left"].down and buttons['right'].down) then
			if buttons["left"].down then
				state.duel_input.lr_state = "left"
			elseif buttons["right"].down then
				state.duel_input.lr_state = "right"
			else
				state.duel_input.lr_state = nil
			end
		else
			state.duel_input.lr_state = nil
		end
	end

	local function touch(self,event)
		-- body
		if event.phase ~= "moved" then 
			if event.phase == "began" then
		        display.getCurrentStage():setFocus( event.target, event.id )
				
				self.down = true
				updateLRState()
			elseif event.phase == "ended" or event.phase == "cancelled" then
		        display.getCurrentStage():setFocus( event.target, nil )
				
				self.down = false
				updateLRState()
			end
		end

		return true
	end

	local btnH = dimensions.BFW/5*2
	local btnW = btnH/5*2
	local btnY = dimensions.B - btnH*0.7

	for i = 0,1 do 
		local button = display.newRect(0,0,btnW,btnH)
		buttons[({"left","right"})[i+1]] = button
		button:setFillColor(0.6,0.6,0.6)
		button.anchorX = i 
		button.anchorY = 1 
		button.alpha = 0.5
		button.x = ({dimensions.L,dimensions.R})[i+1]
		button.y = btnY

		button.touch = touch
		button:addEventListener("touch")
		group:insertUnbinded(button)
	end

	return buttons
end