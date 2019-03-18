return function(p,o,c)
	-- body

	local json = require("json")
	local handle = require_v("handle.func")
	local socket = require( "socket" ).tcp()
	socket:settimeout(30)

	local server = nil
	-- local ip,port = '192.168.43.46',8080
	-- local ip,port = '172.30.1.28',8080
	-- local ip,port = '192.168.43.224',3002
	-- local ip,port = '192.168.43.224',8080
	local ip,port = '13.209.188.91',3002
	-- local ip,port = '127.0.0.1',8080

	local connectToServerCoroutine = nil
	local connectToServerCoroutineIsNilCount = 18

	local function coroutineFunc()
		local beg_time = system.getTimer()
		local timeout, time_diff = 6000, 0
		local hasSucceeded = false
			
		print("coroutine is running " ..  beg_time)

		socket = require( "socket" ).tcp()
		socket:settimeout(30)
		local number = socket:connect( ip, port )
		
		if number == 1 then
			server = socket 
			server:settimeout( 0 )
			server:setoption( "tcp-nodelay", true )
			hasSucceeded = true
		end
	end



	local function packStuff( ... )

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

		return json.encode(reqobj)
	end

	local ttil_next_packAndSend = 0
	
	local function packAndSend()
		-- body
		if server then 

			ttil_next_packAndSend = ttil_next_packAndSend - 1;
			if ttil_next_packAndSend <= 0 then
				ttil_next_packAndSend = state.packAndSend_interval 
			else
				return
			end

			local package = packStuff()
			local res,err = server:send(package.."\n")
			
			if err == "closed" then 
				server = nil
				return
			end

			res = "{}"
			while res do
		        res, err = server:receive()
		        if res then
		        	--print(res)
		            local resobj = json.decode(res)
					if resobj then 
						handle(resobj)
					end
		        end
		        if ( err == "closed" ) then  --try again if connection closed
		    		server = nil
		        end
			end

		else

			if connectToServerCoroutine then

				-- local status = coroutine.status(connectToServerCoroutine)

				-- print("checking coroutine status" .. status)

				if coroutine.status(connectToServerCoroutine) ==  "suspended" then

					print(" resuming coroutineBoundObj ")
					coroutine.resume(connectToServerCoroutine)

				elseif coroutine.status(connectToServerCoroutine) == "dead" then
					print(" connectToServerCoroutine is dead ")
					connectToServerCoroutine = nil
				end

			else
				
				connectToServerCoroutineIsNilCount = connectToServerCoroutineIsNilCount + 1
				print(" remaking connectToServerCoroutine ")
				if connectToServerCoroutineIsNilCount > 40 then
					connectToServerCoroutineIsNilCount = 0
					connectToServerCoroutine =  coroutine.create(coroutineFunc)
				end
			end

		end
	end

	timer.performWithDelay(50,packAndSend,0)
end