--
-- openAdmin
-- ChatLogger module
--

local ChatLogger = {};

local log = {};

function ChatLogger.log(p,s)
	script.logAdded:Fire(p,s);
	local date = os.date("!*t",tick());
	local dates = date.year.."-"..date.month.."-"..date.day;
	log[#log+1] = {p,s,dates};
end

function ChatLogger.getLog()
	return log;
end

return function()
	Instance.new("BindableEvent",script).Name = "logAdded";
	return ChatLogger;
end