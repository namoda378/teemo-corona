local function sendMessage()
  count = count + 1
  
	local str = "Current app time: " .. tostring( system.getTimer() )
  print( "Sending message (" .. tostring( count ) .. "): '" .. str .. "'")
  
	WebSocket:send( str )
end