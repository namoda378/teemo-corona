local indents = {}
indents[0] = ""
for i = 1,10 do 
	indents[i] = indents[i-1] .. "   "
end



function dump_table(...)
	
	local args = {}

	for i,v in ipairs(arg) do
		local type_ = type(v)
		if type_ =="number" then
			if v <= 0 then
				type_ = "dep"
			end
		end
		args[type_] = v
	end

	if args['string'] then
		print(args['string'])
	end

	if not args['number'] then
		args['number'] = 1
	end

	if not args['dep'] then
		args['dep'] = -2
	end

	if args['dep'] == 0 then 
		return
	end

	local count = 0
	for k,v in pairs(args['table']) do
		count = count + 1
		print(indents[args['number']]..tostring(k).." : " .. tostring(v))
		if type(v) == 'table' then
			dump_table(v,args['number']+1,args['dep']+1)
		end
	end
	if count == 0 then print(indents[args['number']].."is empty") end
end
