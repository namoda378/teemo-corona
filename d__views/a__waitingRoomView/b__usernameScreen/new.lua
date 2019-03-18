return function ( ... )
	
	local group = display.newGroup()


	local bg = display.newRect(unpack(dpacks.WHP))
	group:insert(bg)
	bg:setFillColor(0.2,0.2,0.5)

	local options = 
	{
	    text = "pick a name",     
	    x = 0,
	    y = -dimensions.W*0.25,
	    width = dimensions.W*0.8,
	    font = native.systemFontBold,   
	    fontSize = dimensions.W*0.07,
	    align = "center"  -- Alignment parameter
	}
	 
	local text = display.newText( options )
	group:insert(text)

	local textField = native.newTextField(0,-dimensions.W*0.1,dimensions.W*0.6,dimensions.W*0.1)
	group:insert(textField)

	local button = display.newGroup()
	button.y = dimensions.W*0.1
	button.touch = uiutil.buttonTouch

	if true then
		local box = display.newRect(button,0,0,dimensions.W*0.3,dimensions.W*0.1)
		box:setFillColor(0.1,0.1,0.5)
		local text = display.newText(button,"GO",0,0,native.systemFontBold,dimensions.W*0.07)
		text:setFillColor(0.5,1,1)
	end
	
	button.func = function()
		state._consumable.enter = { username = textField.text }
	end
	group:insert(button)
	button:addEventListener("touch")

	group.x ,group.y = dimensions.CX , dimensions.CY

	views.waitingRoomView = {}

	function group:setMsg(msg)
		text.text = msg
	end

	return group

end