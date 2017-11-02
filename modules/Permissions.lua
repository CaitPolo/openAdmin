--
-- openAdmin
-- Permissions module
--

local oaroot = _G.oaroot;

local Permissions = {};

local Players = game:GetService("Players");
local setting = require(oaroot.config.settings);

function Permissions.check(player)
	if (Players[player.Name] ~= nil) then -- check if the player didnt leave
		local isAdmin = false;
		for _,v in pairs(setting["Permitted Users"]) do
			if (v == player.Name) then
				isAdmin = true;
			end
		end
		if (player.UserId == game.CreatorId) then
			return true; -- return true always if the player is the owner
		end
		return isAdmin;
	else
		return false; -- return false if the player left
	end
end

return Permissions