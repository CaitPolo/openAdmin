--
-- openAdmin
-- testhandler command
-- Author: stillunt1tled
--

-- this is a test command to check if your commandhandler is working

local command = {true};

function command.run(p,args)
	print("test")
	for _,v in pairs(args) do
		print(v);
	end
	return true, "if your reading this, your command handler is working!! ("..tostring(#args)..")";
end

return command;