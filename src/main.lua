--#region // variables
local discordia = require("discordia")
local Client = discordia.Client()
local debug = print --// It's for the sake of tricking my mind into workmode!
local Settings = require("settings/settings.lua")
local Wordlist = require("settings/wordlist.lua").Wordlist
--#endregion

--#region // AddWord(word)
function AddWord(word)
	Client:on("messageCreate", function(message)
		if message.content == word then
			message.channel:send("SHUT UP!")
		end
	end)
end
--#endregion

--#region // Client Ready stuff
Client:on("ready", function()
	debug("Censorbot Started!")
	debug("Logged in as " .. Client.user.username)
end)
--#endregion

while wait(Settings.Timer) do
    for i,v in pairs(Wordlist) do
        debug("Added Index: " .. i .. "\n Word: " .. v)
        AddWord(v)
    end
end

Client:run(Settings.Token)
