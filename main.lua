--
-- openAdmin
-- server main script
--

local oaroot = script.Parent; _G.oaroot = oaroot; -- declare root

Instance.new("Folder",oaroot.client).Name = "openAdminEvents"; -- create events folder
for _,v in pairs(require(oaroot.config.events)) do
	local event = Instance.new("RemoteEvent") -- go through the event list
	event.Name = v;
	event.Parent = oaroot.client.openAdminEvents;
end

local info = oaroot.config.info;
info:Clone().Parent = oaroot.client.rf;
oaroot.client.openAdminEvents.Parent = game:GetService("ReplicatedStorage") -- setup client
oaroot.client.rf.Parent = game:GetService("ReplicatedFirst");

local CommandFactory = require(oaroot.modules.CommandFactory);
local CommandHandler = require(oaroot.modules.CommandHandler);
local ChatLogger = require(oaroot.modules.ChatLogger);
local Players = game:GetService("Players");
local ServerToClient = require(oaroot.modules.ServerToClient);
local info = require(info);

print("##########################################\nopenAdmin v"..info.Version.."\n"..info.Branch.." branch\n##########################################");

local commandList = require(oaroot.config.commandList);


for i,v in pairs(commandList) do
	print("LOAD:",v.name);
	if CommandFactory.createCommand(v) then
		print("	ADD:",v.name);
	else
		print("	FAIL:",v.name);
	end
end

print("FINISH:","server setup done.");

local ChatLogger = ChatLogger() -- initalize the chatlogger.
_G.oaChatLogger = ChatLogger

Players.PlayerAdded:connect(function(p)
	p.Chatted:connect(function(msg)
		ChatLogger.log(p,msg);
	end)
end)

CommandHandler(); -- start handler

print("FINISH:","handler and logger loaded.")