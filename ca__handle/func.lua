return function(resobj)
		
	--print(" dcode-hd100 handle got ".. tostring(resobj))
	--dump_table(resobj)
	
	local handlers = {}

	handlers.enter = function(packet)
		-- body
		if packet.status:match("^suc.*") then

			views.waitingRoomView:remove("usernameScreen")
			state.username = packet.username

		else

			views.waitingRoomView.usernameScreen:setMsg(packet.status)

		end
	end

	local function handleOrdinaryMsg(packet)
		-- body
		print(" received ordinaryMsg 2 ")
		views.setNew("modals.ordinaryMsgBox",packet.status)
	end

	handlers.received_request_duel = function (packet)
		-- body
		views.setNew("modals.receivedRequestDuel",packet.username)
	end

	handlers.duel = function(packet)
		-- body
		if packet.state == "finished" then 
			if views.battleFieldView then 
				views.battleFieldView:finished()
				views.battleFieldView = nil
				state.duel = nil
				state.duel_input = nil
				state.packAndSend_interval = 20
			end
		else
			if not views.battleFieldView then 
				state.duel = nil
				state.duel_input = {}
				state.packAndSend_interval = 1
				views.setNew("battleFieldView")
			end
			views.battleFieldView.receive(packet)
		end
	end

	handlers.waiters = function(packet)
		-- body
		views.waitingRoomView.usersWaiting:receivePacket(packet)

	end

	if(type(resobj) == "table")then
		for k,v in pairs(resobj) do 

			if handlers[k] then 
				handlers[k](v) 
			else 
				print(" received ordinaryMsg ")
				handleOrdinaryMsg(v)
			end

		end
	else
		print(" a non table resobj type : " .. tostring(type(resobj)))
		print(" a non table resobj : " .. tostring(resobj))
	end

end