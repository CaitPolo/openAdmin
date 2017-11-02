--
-- openAdmin
-- kick Command
-- Author: stillunt1tled
--

local command = {true};

function command.run(p,args)
	local target = args[2] or false;
	if target then
		target = game:GetService("Players"):FindFirstChild(target);
		if target then
			local msg = args[3] or "Kicked by openAdmin permitted user."
			target:Kick(msg);
			return true, "Target player kicked.";
		end
	else
		return false, "Target player does not exist/not defined.";
	end
end

return command;