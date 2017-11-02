--
-- openAdmin
-- log Command
-- Author: stillunt1tled
--

local command = {true};

function command.run(p,args)
	local log = _G.oaChatLogger.getLog();
	local amount = args[2] or 15;
	local r = {};
	for c=1, amount do
		local v = log[c];
		if v ~= nil then
			r[#r+1] = v[1].Name.."@"..v[3]..": "..v[2];
		else
			r[#r+1] = "~"
		end
	end
	return true, "Last "..amount.." messages:\n"..table.concat(r,"\n")
end

return command;