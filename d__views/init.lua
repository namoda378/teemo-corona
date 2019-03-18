return function( ... )
	
	views = {}


	views.setNew = function(name,...)
		-- body
		print(" view.setNew " .. name)
		views[name] = require_v("views."..name..".new")(unpack(arg))
	end

end