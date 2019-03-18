return function(msg)
	print(" ordinary msgbox setting start with msg ".. msg)
	local group = display.newGroup()

	local box = display.newRect(0,0,300,400)
	box:setFillColor(1,1,1)
	group:insert(box)


	local text = display.newText(msg,0,0,200,100,native.systemFontBold, 20)
	text:setFillColor(0.2,0.2,0.4)
	group:insert(text)

	for i,v in ipairs{"ok","ok"} do 
		local btn = display.newGroup()
		local rect = display.newRect(btn,0,0,50,30)
		rect:setFillColor(0.2,0.2,0.6)
		local text = display.newText(btn,v,0,0,native.systemFontBold, 20)
		group:insert(btn)
		btn.touch = function(self,event)
			if event.phase == "ended" then
				print("model {"..text.text.."} received ended event ")
				group:removeSelf()
			end
			return true
		end
		btn.x = ({-1,1})[i]*30
		btn.y = 175
		btn:addEventListener("touch")
	end


	dset("CXY",group)

	print(" ordinary msgbox set result ".. group.x .. " / " .. group.y)


end