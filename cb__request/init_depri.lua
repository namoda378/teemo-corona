return function(p,o,c)
	-- body

	local json = require("json")
	local handle = require_v("handle.func")

	local locprint = print


	local toSendBuf = {}
	local receivedBuf = {}
	local print_put = true
	local putInSB = function(s)
		-- body
		if not print_put then return end
		if not print_put then return end
		--print("putInSB called")
		table.insert(toSendBuf,s)
		if #toSendBuf > 10 then
			table.remove(toSendBuf,1)
		end
	end
	local putInRB = function(s)
		-- body
		if not print_put then return end
		--print("putInRB called")
		table.insert(receivedBuf,s)
		if #receivedBuf > 10 then
			table.remove(receivedBuf,1)
		end
	end

	local function initWebSocket()

		state.initWebSocket = true

		local WebSocket = require("plugin.websockets").new()


		local function WsHandler(event)

			local etype = event.type

			if etype == WebSocket.ONOPEN then
				print( 'Received event: ONOPEN' )
				state.WebSocket = WebSocket
				
			elseif etype == WebSocket.ONMESSAGE then
				local msg = event.data
				-- putInRB("received msg : " .. msg)
				-- locprint("received msg : " .. msg)
				local resobj = json.decode(msg)
				handle(resobj)

			elseif etype == WebSocket.ONCLOSE then
				state.WebSocket = nil
				state.initWebSocket = false
				print( "Received event: ONCLOSE" )
				print( 'code:reason', event.code, event.reason )
				print_put = false
				dump_table("toSend",toSendBuf,-3)
				dump_table("received",receivedBuf,-3)
				dump_table("event",event,-9)
			elseif etype == WebSocket.ONERROR then
				state.WebSocket = nil
				state.initWebSocket = false
				print( "Received event: ONERROR" )
				print( 'code:reason', event.code, event.reason )
			end

		end

		WebSocket:addEventListener(WebSocket.WSEVENT, WsHandler)
		-- WebSocket:connect('ws://192.168.43.46',8080)
		-- WebSocket:connect('ws://172.30.1.28',8080)
		-- WebSocket:connect('ws://127.0.0.1',8080)
		-- WebSocket:connect('ws://192.168.43.224',3002)
		-- WebSocket:connect('ws://192.168.43.224',8080)
		WebSocket:connect('ws://13.209.188.91',8080)
	end


	
	local function packAndSend()
		local WebSocket = state.WebSocket 	
		if not WebSocket then 
			if not state.initWebSocket then
				initWebSocket()
			end
			return 
		end
		-- body
		local reqobj = {}
		
		if state.duel_input then
			reqobj.duel_input = state.duel_input
		else
			reqobj.waiting = {}
			for k,v in pairs(state._consumable) do 
				reqobj[k] = v
			end
			state._consumable = {}
		end

		if state.username then
			reqobj.has_username = {username = state.username}
		end

		local tosend = json.encode(reqobj)
		print("sending msg " .. tosend)
		WebSocket:send(tosend)	
	end


	local count = state.sendRate
	Runtime:addEventListener("enterFrame",function() 
			count = count - 1
			if count == 0 then 
				packAndSend()
				count = state.sendRate
			end
		
		end)

end