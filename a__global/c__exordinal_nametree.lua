

local rbp_s ={
--^ forin ..
--> "{{ erb -xf -sep |.|  -rei |[b-z0-9]+__.*\.lua|  -exo }}" {{ nl |,| }}
"state.init" ,
"request.init" ,
"views.modals.requestDuel" ,
"views.modals.receivedRequestDuel.new" ,
"views.modals.ordinaryMsgBox.new" ,
"views.modals.confirmRequestDuel.new" ,
"views.battleFieldView.ballSpawner.new" ,
"views.battleFieldView.new" ,
"views.battleFieldView.champs.HPbar.new" ,
"views.battleFieldView.champs.MPbar.new" ,
"views.battleFieldView.champs.new" ,
"views.battleFieldView.lrButtons.new" ,
"views.battleFieldView.background.new" ,
"views.battleFieldView.kii.new" ,
"views.init" ,
"views.waitingRoomView.new" ,
"views.waitingRoomView.usernameScreen.new" ,
"views.waitingRoomView.usersWaiting.userIcon.new" ,
"views.waitingRoomView.usersWaiting.new" 
--$ 
}

local root_namenode = {_={},__child_s={}}

local function treeify_namenodes()

	for i,rbp in ipairs(rbp_s) do 

		local namenode = root_namenode

		for name in rbp:gmatch("[^.]+") do
			
			local place = nil

			if name(1) == "_" then
				-- meta module
				name = name(2,#name)
				place = namenode._
			else
				place = namenode.__child_s
			end
			
			local match_res = {name:match("%w+__(%w+)")}
			local exoname = match_res[1] or name 


			if not place[exoname] then 
				place[exoname] = {_={},__child_s={}}
			end

			namenode = place[exoname]
		end

		namenode.path = rbp
	end
end

treeify_namenodes()

--dump_table(root_namenode,-6)