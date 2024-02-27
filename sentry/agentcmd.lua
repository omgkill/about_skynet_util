local skynet = require "skynet"
local filelog = require "log.filelog"
local msghelper = require "agenthelper"
local timetool = require "time.timetool"
local filename = "agentcmd.lua"
local httpc = require "http.httpc"
local raven = require "raven.init"

-- http://pub:secret@127.0.0.1:8080/sentry/proj-id
local rvn = raven.new {
	-- multiple senders are available for different networking backends,
	-- doing a custom one is also very easy.
	sender = require("raven.senders.luasocket").new {
		dsn = "https://xxx@xxx.ingest.sentry.io/xxx",
	},
	tags = { foo = "bar" },
}


local AgentCMD = {}

function bad_func(n)
	return not_defined_func(n)
end

function AgentCMD.start(session_id, conf)
	local ok = rvn:call(bad_func, 1)

end

return AgentCMD