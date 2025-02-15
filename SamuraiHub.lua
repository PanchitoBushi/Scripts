local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Translation table for English (only)
local t = {
    hubLoaded = "Samurai Hub loaded!",
    infiniteJump = "Infinite Jump (Toggle) 🦘",
    infiniteJumpActivated = "Infinite Jump activated!",
    walkSpeed = "WalkSpeed 🚶",
    jumpPower = "JumpPower 🦘",
    walkSpeedInput = "WalkSpeed Input",
    basicFunctions = "Basic Functions",
    jerkOff = "Squishy",  -- Changed from "Jerk Off" to "Squishy"
    aimbotScript = "Script (Aimbot) 🔫",
    universalAimbot = "Beanz Hub (Aimbot) 🔫",
    infiniteYield = "InfiniteYield (Universal Script) 💥",
    universalInvis = "Universal R6 Invisibility 😳",
    labelExample = "Label Example",
    paragraphExampleTitle = "Paragraph Example",
    paragraphExampleContent = "This is a sample paragraph to display information in the script.",
}

local Window = Rayfield:CreateWindow({
    Name = "Samurai Hub (武士)",
    LoadingTitle = "V2.3",
    LoadingSubtitle = "By .kysrn",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, -- Custom folder (optional)
        FileName = "SamuraiHub"
    },
    KeySystem = false, -- Set to true if you want to use the key system
    KeySettings = {
        Title = "Key | Discord Server",
        Subtitle = "Key System",
        Note = "Key In Discord Server",
        FileName = "Real",
        SaveKey = false,
        GrabKeyFromSite = true,
        Key = {"Samurai"}
    }
})

--------------------------------------------------
-- TAB: Home (Main Functions & Basic Options)
--------------------------------------------------
local HomeTab = Window:CreateTab("🏠 Home", nil)
local MainSection = HomeTab:CreateSection("Main")

Rayfield:Notify({
    Title = "Press K to togle",
    Content = t.hubLoaded,
    Duration = 5,
    Image = nil,
    Actions = {
        Ignore = {
            Name = "Okay",
            Callback = function()
                print("Notification acknowledged.")
            end,
        },
    },
})

-- Infinite Jump Button
local ButtonInfiniteJump = HomeTab:CreateButton({
    Name = t.infiniteJump,
    Callback = function()
        _G.infinjump = not _G.infinjump
        if _G.infinJumpStarted == nil then
            _G.infinJumpStarted = true
            game.StarterGui:SetCore("SendNotification", {
                Title = "Infinite Jump",
                Text = t.infiniteJumpActivated,
                Duration = 5,
            })
            local plr = game:GetService('Players').LocalPlayer
            local m = plr:GetMouse()
            m.KeyDown:connect(function(k)
                if _G.infinjump and k:byte() == 32 then
                    local humanoid = plr.Character:FindFirstChildOfClass('Humanoid')
                    if humanoid then
                        humanoid:ChangeState('Jumping')
                        wait()
                        humanoid:ChangeState('Seated')
                    end
                end
            end)
        end
    end,
})

-- WalkSpeed Slider
local SliderWS = HomeTab:CreateSlider({
    Name = t.walkSpeed,
    Range = {1, 350},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "sliderws",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

-- JumpPower Slider
local SliderJP = HomeTab:CreateSlider({
    Name = t.jumpPower,
    Range = {1, 350},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "sliderjp",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

-- WalkSpeed Input
local InputWS = HomeTab:CreateInput({
    Name = t.walkSpeedInput,
    PlaceholderText = "Enter speed (1-500)",
    RemoveTextAfterFocusLost = true,
    Flag = "inputws",
    Callback = function(Text)
        local speed = tonumber(Text) or 16
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end,
})

-- Basic Functions Section (only "Squishy" remains)
local BasicSection = HomeTab:CreateSection(t.basicFunctions)

-- Squishy Button: executes the provided script
local JerkOffButton = HomeTab:CreateButton({
    Name = t.jerkOff,
    Callback = function()
        local scriptURL = "https://raw.githubusercontent.com/PanchitoBushi/Scripts/refs/heads/main/Jerkoff.lua"
        local scriptContent = game:HttpGet(scriptURL)
        loadstring(scriptContent)()
    end,
})

--------------------------------------------------
-- TAB: Scripts
--------------------------------------------------
local ScriptsTab = Window:CreateTab("🎮 Scripts", nil)

local AimbotButton = ScriptsTab:CreateButton({
    Name = t.aimbotScript,
    Callback = function()
        local scriptURL = "https://raw.githubusercontent.com/PanchitoBushi/Scripts/refs/heads/main/Aimbot%20V2%20GUI.lua"
        local scriptContent = game:HttpGet(scriptURL)
        game.StarterGui:SetCore("SendNotification", {
            Title = t.aimbotScript,
            Text = "Loading Aimbot script...",
            Duration = 5,
        })
        loadstring(scriptContent)()
    end,
})

local UniversalAimbotButton = ScriptsTab:CreateButton({
    Name = t.universalAimbot,
    Callback = function()
        local scriptURL = "https://raw.githubusercontent.com/pid4k/scripts/main/universalaimbot.lua"
        local scriptContent = game:HttpGet(scriptURL)
        game.StarterGui:SetCore("SendNotification", {
            Title = t.universalAimbot,
            Text = "By Beanz",
            Duration = 5,
        })
        loadstring(scriptContent)()
    end,
})

local InfiniteYieldButton = ScriptsTab:CreateButton({
    Name = t.infiniteYield,
    Callback = function()
        local scriptURL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
        local scriptContent = game:HttpGet(scriptURL)
        game.StarterGui:SetCore("SendNotification", {
            Title = t.infiniteYield,
            Text = "Loading Infinite Yield script...",
            Duration = 5,
        })
        loadstring(scriptContent)()
    end,
})

local UniversalInvisButton = ScriptsTab:CreateButton({
    Name = t.universalInvis,
    Callback = function()
        local scriptURL = "https://raw.githubusercontent.com/Sakupenny/Universal-R6-Invis/refs/heads/main/Main.lua"
        local scriptContent = game:HttpGet(scriptURL)
        game.StarterGui:SetCore("SendNotification", {
            Title = t.universalInvis,
            Text = "Press T to toggle invisibility",
            Duration = 10,
        })
        loadstring(scriptContent)()
    end,
})

--------------------------------------------------
-- TAB: Créditos
--------------------------------------------------
local CreditsTab = Window:CreateTab("📜 Credits", nil)
local CreditsSection = CreditsTab:CreateSection("Credits")

-- Crédito 1: @.kysrn
local CreditLabel1 = CreditsTab:CreateLabel("Contact me on Discord @.kysrn", "star", Color3.fromRGB(255, 255, 0), false)

-- Crédito 2: Made by ジェローム | Not all scripts are mine
local CreditLabel2 = CreditsTab:CreateLabel("Made by ジェローム\nNot all scripts are mine", "award", Color3.fromRGB(255, 255, 255), false)

