return function()
	-- body

	local barColor111 = {1,0,0}
	local bgW = dimensions.BFW/3 
	local bgH = bgW/5
	local bgThickness = bgH/4
	local barW = bgW - bgThickness
	local barWhalf = barW/2
	local barH = bgH - bgThickness

	local group = display.newGroup()
	group.anchorChildren = true

	local bg = display.newRect(0,0,bgW,bgH)
	bg:setFillColor(0.7,0.5,0.5)
	group:insert(bg)
	group.bg = bg

	local bar = display.newRect(0,0,barW,barH)
	bar:setFillColor(unpack(barColor111))
	bar.anchorX = 0
	bar.x = -(barW/2)
	group:insert(bar)
	group.bar = bar

	function group:set(val)
		bar.width = (val/100)*barW 
	end

	return group
end