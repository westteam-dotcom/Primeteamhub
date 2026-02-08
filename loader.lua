local success, err = pcall(function()
    local url = "https://raw.githubusercontent.com/westteam-dotcom/Primeteamhub/main/loo.lua"
    loadstring(game:HttpGet(url .. "?t=" .. os.time()))()
end)

if not success then
    warn(tostring(err))
end
