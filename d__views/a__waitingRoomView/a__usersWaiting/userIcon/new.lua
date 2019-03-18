
local function userTouch(self,event)
	-- body
	if event.phase == "ended" then
		views.setNew("modals.confirmRequestDuel",self.username)
	end

end

return function(username)
	-- body
	local user = display.newGroup()
	user.username = username

	local circ = display.newCircle(0,0,40)
	circ:setFillColor(1,0.2,0.4)
	user:insert(circ)

	local text = display.newText(username, 0, 0, native.systemFontBold, 20)
	user:insert(text)

	user.touch = userTouch
	user:addEventListener("touch")

	return user
end