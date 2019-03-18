getmetatable("").__call = function(s,i,j)
	
	if not j then 
		j = i
	end

	return s:sub(i,j)
end