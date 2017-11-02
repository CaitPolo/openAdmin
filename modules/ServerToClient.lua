--
-- openAdmin
-- ServerToClient module
--

local ServerToClient = {};

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local events = ReplicatedStorage.openAdminEvents;

function ServerToClient.sysMsgSC(client,configTable)
	events.sysMsg:FireClient(client,configTable);
end

function ServerToClient.sysMsg(configTable)
	events.sysMsg:FireAllClients(configTable);
end

return ServerToClient