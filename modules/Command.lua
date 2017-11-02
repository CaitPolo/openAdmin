--
-- openAdmin
-- Command class
--

local command = {};
command.__index = command;

command.name = "";
command.helpdesc = "";
command.source = nil;

function command:run(p,arg)
	return require(self.source).run(p,arg);
end

function command:getDesc()
	return self.helpdesc;
end

function new(name,helpdesc,source)
	local self = setmetatable(command,{});
	self.name = name;
	self.helpdesc = helpdesc;
	self.source = source;
	return self;
end

return new;