--
-- openAdmin
-- commands Command
-- Author: stillunt1tled
--

local command = {true};

function command.run(p,args)
	local list = {};
	local cmds = require(_G.oaroot.modules.CommandFactory).getCommands();
	for i,_ in pairs(cmds) do
		list[#list+1] = i;
	end
	return true, "Command list:\n"..table.concat(list,"\n")
end

return command;