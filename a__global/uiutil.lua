


uiutil = {}

uiutil.buttonTouch = function(self,event)
		-- body
	if event.phase == "began" then
		self.gainedFocus = true
	    display.getCurrentStage():setFocus( event.target, event.id )
	elseif event.phase ~= "moved" then
		display.getCurrentStage():setFocus( event.target, nil )
		if self.gainedFocus then
			self.gainedFocus = false
			self.func()
		end
	end

	return true
end