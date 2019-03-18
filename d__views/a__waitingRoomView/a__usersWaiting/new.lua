return function()
	-- body

	local group = display.newGroup()

	local bg = display.newRect(unpack(dpacks.BFWH))
	group:insert(bg)
	bg.anchorX,bg.anchorY = 0,0
	bg:setFillColor(1,1,0.5)

	local users = display.newGroup()
	group:insert(users)
	local userIcon_new = require_v("views.waitingRoomView.usersWaiting.userIcon.new")

	function group:receivePacket(received_waiters_by_username)
		
		local clicache_waiters_by_username = state.waiters_by_username

		if clicache_waiters_by_username.__updated ~= received_waiters_by_username.__updated then 

			users:removeSelf()
			users = display.newGroup()
			group:insert(users)

			local i = 0
			for k,v in pairs(received_waiters_by_username) do 
				if not k:match("^_.*") then 				
					local user = userIcon_new(k)
					user.x = 50+(i)%3*70
					user.y = 50+math.floor((i)/3)*70 
					users:insert(user)

					i = i + 1
				end
			end

		end

		state.waiting_room = received_waiting_room

	end

	group.x,group.y = dimensions.BFX0,dimensions.BFY0

	return group

end