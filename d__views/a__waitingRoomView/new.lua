return function()
	-- body

	local o = {}
	--^ forin . 
	--> o['{{ eb-2b-1 -exo }}'] = require("{{ ei+1i+2  -rei |.*new\.lua| -iv }}{{ erb -sep |.| -xf -sk }}")()
	o['usersWaiting'] = require("d__views.a__waitingRoomView.a__usersWaiting.new")()
	o['usernameScreen'] = require("d__views.a__waitingRoomView.b__usernameScreen.new")()
	--$


	function o:remove(name)
		if self[name].removeSelf then
			self[name]:removeSelf()
		end
	end

	return o
end