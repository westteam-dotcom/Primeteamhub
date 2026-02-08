local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local HttpService   = game:GetService("HttpService")
local CoreGui       = game:GetService("CoreGui") 
local LocalPlayer   = Players.LocalPlayer

local function GetSafeGui()
    if gethui then return gethui() end
    if CoreGui then return CoreGui end
    return LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
end

local playerGui     = GetSafeGui() 

-- [[ LİNK AYARLARI ]] --
local DISCORD_LINK  = "https://discord.gg/primeteam"
-- SENİN GİTHUB LİNKİN:
local REMOTE_URL    = "https://raw.githubusercontent.com/westteam-dotcom/Primeteamhub/main/loo.lua"

local function runRemote()
    local success, err = pcall(function()
        local src = game:HttpGet(REMOTE_URL .. "?t=" .. os.time())
        loadstring(src)()
    end)
    if not success then
        warn("Hata: " .. tostring(err))
    end
end

runRemote()

-- [[ ARAYÜZ ]] --
local hubGui = Instance.new("ScreenGui")
hubGui.Name = "PrimeTeamHubUI"
hubGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(380, 228)
frame.Position = UDim2.new(0.5, 0, 0.34, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(16, 24, 39)
frame.Parent = hubGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 20)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "Prime Team Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.Parent = frame

local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.fromOffset(30, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function() hubGui:Destroy() end)

local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0, 200, 0, 50)
copyBtn.Position = UDim2.new(0.5, -100, 0.6, 0)
copyBtn.Text = "Discord Kopyala"
copyBtn.Parent = frame
copyBtn.MouseButton1Click:Connect(function()
    setclipboard(DISCORD_LINK)
    copyBtn.Text = "Kopyalandı!"
end)
