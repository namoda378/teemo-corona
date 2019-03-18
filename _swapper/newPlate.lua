o.newPlate = function()

		
		local height = 650
		local width = 500
		local hidePosY = dimensions.B + height/2 + 20

		local group = display.newGroup()
		group.y = hidePosY 
		group.x = dimensions.CX

		local rect = display.newRoundedRect( group, 0, 0, width, height, 20)
		rect:setFillColor(unpack(u.hexColor("d8d2e1")))
		rect.touch = function()
			return true 
		end
		rect:addEventListener("touch")


		local xButton = display.newText(group,"X", 0, 0 , native.systemFontBold, dimensions.Mult*30)
		xButton.x = width/2 - dimensions.Mult*20
		xButton.y = -height/2 + dimensions.Mult*30
		xButton:setFillColor(0.2,0.2,0.2)
		xButton.touch = function(self,event)
			if(event.phase == "began")then
				self:func()
			end
		end
		xButton:addEventListener("touch")	
		group.xButton = xButton

		return group
	end
