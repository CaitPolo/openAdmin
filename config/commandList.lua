--
-- openAdmin
-- commandList configuration
--

local commands = _G.oaroot.commands;

return {
	{
		["name"] = "testhandler";
		["src"] = commands.testhandler;
	};
	{
		["name"] = "kick";
		["src"] = commands.kick;
	};
	{
		["name"] = "commands";
		["src"] = commands.commands;
	};
	{
		["name"] = "log";
		["src"] = commands.log;
	}
}