
local rbp_map = {}
--^ forin .. 
--> rbp_map["{{ erb -xf -sep |.| -exo }}"] = "{{ erb -xf -sep |.| }}"
rbp_map["state.init"] = "bb__state.init"
rbp_map["build"] = "build"
rbp_map["request.init"] = "cb__request.init"
rbp_map["config"] = "config"
rbp_map["global.require_v"] = "a__global.require_v"
rbp_map["global.exordinal_nametree"] = "a__global.c__exordinal_nametree"
rbp_map["global.dimensions"] = "a__global.dimensions"
rbp_map["global.make_string_callable"] = "a__global.b__make_string_callable"
rbp_map["global.dummy_func"] = "a__global.dummy_func"
rbp_map["global.activate_multitouch"] = "a__global.activate_multitouch"
rbp_map["global.dump_table"] = "a__global.a__dump_table"
rbp_map["global.uiutil"] = "a__global.uiutil"
rbp_map["handle.func"] = "ca__handle.func"
rbp_map["views.modals.requestDuel"] = "d__views.c__modals.requestDuel"
rbp_map["views.modals.receivedRequestDuel.new"] = "d__views.c__modals.receivedRequestDuel.new"
rbp_map["views.modals.ordinaryMsgBox.new"] = "d__views.c__modals.ordinaryMsgBox.new"
rbp_map["views.modals.confirmRequestDuel.new"] = "d__views.c__modals.confirmRequestDuel.new"
rbp_map["views.battleFieldView.ballSpawner.new"] = "d__views.b__battleFieldView.e__ballSpawner.new"
rbp_map["views.battleFieldView.new"] = "d__views.b__battleFieldView.z__new"
rbp_map["views.battleFieldView.champs.HPbar.new"] = "d__views.b__battleFieldView.c__champs.HPbar.new"
rbp_map["views.battleFieldView.champs.MPbar.new"] = "d__views.b__battleFieldView.c__champs.MPbar.new"
rbp_map["views.battleFieldView.champs.new"] = "d__views.b__battleFieldView.c__champs.new"
rbp_map["views.battleFieldView.lrButtons.new"] = "d__views.b__battleFieldView.b__lrButtons.new"
rbp_map["views.battleFieldView.background.new"] = "d__views.b__battleFieldView.a__background.new"
rbp_map["views.battleFieldView.kii.new"] = "d__views.b__battleFieldView.d__kii.new"
rbp_map["views.init"] = "d__views.init"
rbp_map["views.waitingRoomView.new"] = "d__views.a__waitingRoomView.new"
rbp_map["views.waitingRoomView.usernameScreen.new"] = "d__views.a__waitingRoomView.b__usernameScreen.new"
rbp_map["views.waitingRoomView.usersWaiting.userIcon.new"] = "d__views.a__waitingRoomView.a__usersWaiting.userIcon.new"
rbp_map["views.waitingRoomView.usersWaiting.new"] = "d__views.a__waitingRoomView.a__usersWaiting.new"
rbp_map["main"] = "main"
--$









require_v = function(rbp)
	return require(rbp_map[rbp])
end