return function(group)
	-- body

	local kii = display.newCircle(0,0,10)
	kii.alpha = 0.5
	kii:setFillColor(0,0,1)
	kii.anchorY = 1
	kii.yScale = 1.3		
	kii.isVisible = false

	group:insert(kii)

	function kii:setPoint(x,y)

		-- print(" y " .. y)
		-- print(" x " .. x)
		-- print(" y*dimensions.GTOD " .. y*dimensions.GTOD)
		-- print(" x*dimensions.GTOD " .. x*dimensions.GTOD)

		local xlen = self.y - y*dimensions.GTOD
		local ylen = self.x - x*dimensions.GTOD

		self.rotation = -math.deg(math.atan2(ylen,xlen))

	end

	return kii
end