--
-- openAdmin
-- CommandHandler module
--

local oaroot = _G.oaroot;

local Permissions = require(oaroot.modules.Permissions);
local CommandFactory = require(oaroot.modules.CommandFactory);
local setting = require(oaroot.config.settings);
local ServerToClient = require(oaroot.modules.ServerToClient);

function parse(p,s)
	local prefix = setting.Prefix;
	if (string.sub(s,1,1) == prefix) then
		local command = {};
		for index in string.gmatch(string.sub(s,2), "%S+") do
    		table.insert(command, index);
		end
		local getcommand = CommandFactory.getCommand(command[1]);
		if getcommand ~= nil then
			local suc, msg = getcommand:run(p,command);
			if not suc then
				if msg == nil then msg = "Command failed, no return msg." end
				ServerToClient.sysMsgSC(p,{
					Text = "[openAdmin-"..getcommand.name.."]: "..msg;
					Color = Color3.new(1, 0, 0);
				});
			else
				if msg == nil then msg = "Command ran, no return msg." end
				ServerToClient.sysMsgSC(p,{
					Text = "[openAdmin-"..getcommand.name.."]: "..msg;
					Color = Color3.new(0, 1, 0);
				});
			end
		else
			ServerToClient.sysMsgSC(p,{
				Text = "[openAdmin]: That is not a defined command.";
				Color = Color3.new(1, 0, 0);
			})
			return;
		end
	end
end

return function()
	oaroot.modules.ChatLogger.logAdded.Event:connect(function(player,message)
		if Permissions.check(player) then
			parse(player, message);
		else
			ServerToClient.sysMsgSC(player,{
				Text = "[openAdmin]: You are not a defined permitted user.";
				Color = Color3.new(1, 0, 0);
			})
		end
	end)
end