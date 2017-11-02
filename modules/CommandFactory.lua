--
-- openAdmin
-- CommandFactory module
--

local commandFactory = {};
local oaroot = _G.oaroot;

local Command = require(oaroot.modules.Command);

local commands = {};

function commandFactory.createCommand(t)
	local name = t.name;
	local desc = t.desc;
	local src = t.src;
	local f = require(src);
	if not f[1] then
		return false;
	end
	local command = Command(name,desc,src);
	commands[name] = command;
	return true;
end

function commandFactory.getCommands()
	return commands;
end

function commandFactory.getCommand(name)
	return commands[name];
end

return commandFactory;