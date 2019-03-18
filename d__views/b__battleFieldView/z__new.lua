return function()
	-- body
	local json = require('json')

	local group = display.newGroup()
	group.x = dimensions.BFX0 
	group.y = dimensions.BFY0

	local unbindedChilds = {}

	function group:insertUnbinded(dobj)

		table.insert(unbindedChilds,dobj)

	end



	--^ forin . 
	--> group['{{ eb-2b-1 -exo }}'] = require("{{ erb -sep |.| -xf -sk }}")(group) {{ ei+1i+2 -rei |.*new\.lua| -iv }}
	group['background'] = require("d__views.b__battleFieldView.a__background.new")(group) 
	group['lrButtons'] = require("d__views.b__battleFieldView.b__lrButtons.new")(group) 
	group['champs'] = require("d__views.b__battleFieldView.c__champs.new")(group) 
	group['kii'] = require("d__views.b__battleFieldView.d__kii.new")(group) 
	group['ballSpawner'] = require("d__views.b__battleFieldView.e__ballSpawner.new")(group) 
	--$

	local balls = {enemy = {},me = {}}
	local ballColor111 = {enemy = {1,0,0},me= {0,0,1}}
	local ball_base_x = {enemy = dimensions.GAME_WIDTH,me = 0}
	local ball_base_y = {enemy = 0,me = dimensions.GAME_HEIGHT}
	local ball_mult_x = {enemy = -1,me = 1}
	local ball_mult_y = {enemy = 1,me = -1}

	local tid = 0


	local champs = group.champs

	for k,v in pairs(champs) do
		v.targetX = v.x 
	end

	local function updateBalls()
		for k,v in pairs(champs) do
			v.x = (v.x + v.targetX) / 2 
		end
		for k,v in pairs(balls) do
			for k1,v1 in pairs(v) do
				v1.x = (v1.x + v1.targetX) / 2 
				v1.y = (v1.y + v1.targetY) / 2 
			end 
		end
	end

	Runtime:addEventListener("enterFrame",updateBalls)

	group.receive = function(packet)
		-- body
		--dump_table(" b__battleFieldView received packet ", packet)

		local champs = group.champs

		for k,user in pairs(packet.users) do 
			local eme = nil
			local champ = nil
			local champTargetX = nil
			local deviceX = user.x * (dimensions.BFW/dimensions.GAME_WIDTH) 
			
			if k == state.username then
				champ = group.champs.me
				eme = "me"

				champ.targetX = deviceX

				if user.kii > 0 then 
					-- print(" dcode-kiivisib ")
					group.kii.isVisible = true
					group.kii.x = champ.x
					group.kii.y = champ.y
					if(state.duel_input.bg_touch) then
						local bg_touch = state.duel_input.bg_touch
						group.kii:setPoint(bg_touch.x,bg_touch.y)
					end
					group.kii.yScale = 1+(user.kii/10)
				else
					-- print(" dcode-kiigone ")
					group.kii.isVisible = false
				end

				champ.MPbar:set(user.MP)
				champ.MPbar:setDelta(user.kii)
			else 
				champ = group.champs.enemy
				eme = "enemy"

				champ.targetX = dimensions.BFW - deviceX
			end

			-- transition.to(champ,{time=60,x=champTargetX,transition = easing.outCubic})
			
			local balls_not_updated = balls[eme]

			local balls_updated = {} 
			
			for i,ball_data in ipairs(user.balls) do 
				if balls_not_updated[ball_data.idx] then
					balls_updated[ball_data.idx] = balls_not_updated[ball_data.idx]
					balls_not_updated[ball_data.idx] = nil
				else
					balls_updated[ball_data.idx] = display.newCircle(group,0,0,10)
					local ball = balls_updated[ball_data.idx]
					ball.x = (ball_base_x[eme] + ball_data.x * ball_mult_x[eme])*(dimensions.BFW/dimensions.GAME_WIDTH) 
					ball.y = (ball_base_y[eme] + ball_data.y * ball_mult_y[eme])*(dimensions.BFW/dimensions.GAME_WIDTH) 
					ball.targetX = ball.x
					ball.targetY = ball.y
					ball:setFillColor(unpack(ballColor111[eme]))
				end
			end
			
			-- print(" dcode - h0akg0 ")
			-- print(json.encode(balls_updated))
			for k,ball in pairs( balls_not_updated ) do
				ball:removeSelf()
			end

			balls[eme] = balls_updated
			
			for i,ball_data in ipairs(user.balls) do 
				local ball = balls_updated[ball_data.idx]
				ball.targetX = (ball_base_x[eme] + ball_data.x * ball_mult_x[eme])*(dimensions.BFW/dimensions.GAME_WIDTH) 
				ball.targetY = (ball_base_y[eme] + ball_data.y * ball_mult_y[eme])*(dimensions.BFW/dimensions.GAME_WIDTH) 
			end

			champ.HPbar:set(user.HP)

		end

	end

	group.finished = function(self)
		-- body
		Runtime:removeEventListener("enterFrame",updateBalls)
		self:removeSelf()
		for i,v in ipairs(unbindedChilds) do
			v:removeSelf()
		end
	end

	return group

end