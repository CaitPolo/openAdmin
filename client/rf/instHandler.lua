--
-- openAdmin
-- instHandler LocalScript
--

local events = game:GetService("ReplicatedStorage"):WaitForChild("openAdminEvents");
local sg = game:GetService("StarterGui")

local info = require(script.Parent.info);

print("##########################################\nopenAdmin v"..info.Version.."\n"..info.Branch.." branch\n##########################################");
sg:SetCore("ChatMakeSystemMessage", {
	Text = "openAdmin v"..info.Version.." ("..info.Branch.." branch)";
	Font = Enum.Font.SourceSans;
});

events.sysMsg.OnClientEvent:connect(function(config)
	print("sysMsg") --debug
	sg:SetCore("ChatMakeSystemMessage", config);
end)