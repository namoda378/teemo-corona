return function(username)
	local group = display.newGroup()

	local box = display.newRect(0,0,300,400)
	box:setFillColor(1,1,1)
	group:insert(box)


	local text = display.newText("send request to "..username,0,0,200,100,native.systemFontBold, 20)
	text:setFillColor(0.2,0.2,0.4)
	group:insert(text)

	for i,v in ipairs{"yes","no"} do 
		local btn = display.newGroup()
		local rect = display.newRect(btn,0,0,50,30)
		rect:setFillColor(0.2,0.2,0.6)
		local text = display.newText(btn,v,0,0,native.systemFontBold, 20)
		group:insert(btn)
		btn.touch = function(self,event)
			if event.phase == "ended" then
				if v == "yes" then
					state._consumable.request_duel = {
						username = username
					}
				end
				group:removeSelf()
			end
		end
		btn.x = ({-1,1})[i]*30
		btn.y = 175
		btn:addEventListener("touch")
	end


	dset("CXY",group)

	


end