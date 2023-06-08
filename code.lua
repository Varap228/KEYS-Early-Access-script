-- Butcher rbxassetid://12629402865 
-- Bear rbxassetid://12629403201
-- Joker rbxassetid://12629403068
-- Rabbit rbxassetid://12629403353
-- Yeti rbxassetid://13543099655
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
local Window = Library.CreateLib("By Varap#9620", "RJTheme8")
local Tab_cred = Window:NewTab("Credits")
local Section_cred = Tab_cred:NewSection("Ctrl+click tp")
local Tab = Window:NewTab("Main") 
local Section = Tab:NewSection("Main")
local Tab_E = Window:NewTab("Esp")
local Section_E = Tab_E:NewSection("Esp")
local Tab_Id = Window:NewTab("Max distance")
local Section_Kd = Tab_Id:NewSection("Dying players")
local Tab_D = Window:NewTab("Door")
local Section_D = Tab_D:NewSection("Door")
local Tab_S = Window:NewTab("Speed and Jump")
local Section_S = Tab_S:NewSection("Speed")
local Tab_M = Window:NewTab("Movements")
local Section_M = Tab_M:NewSection("Movements")
local Tab_V = Window:NewTab("Visuals")
local Section_V = Tab_V:NewSection("Visuals")
local Tab_Shop = Window:NewTab("Shop")
local Section_Shop = Tab_Shop:NewSection("Open the shops")
ESP:Toggle(true) 
ESP.Players = false 
_G.espMonster = false
_G.espD = false
_G.KeyEsp = false
_G.AutoDoor = false
_G.espPH = false
_G.maxDistnPH = false
_G.offInPards = false
_G.TimeEnd = false
_G.nameButtonUI = nil
_G.nameImageUI = nil
_G.TimeEndName = nil
_G.TimeEndNameText = nil
_G.valHold = 0
_G.Speed = 16

local maps = {"Castle", "School", "MagicCube", "Refuge", "IceCave", "Forest"} 
local localPlayer = game:GetService("Players").LocalPlayer
local animIds = {"rbxassetid://12015079000", "rbxassetid://12015055714"}
local function generateRandomName(length)
  local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()"
  local name = ""
  for i = 1, length do
    local randomIndex = math.random(1, #characters)
    local char = characters:sub(randomIndex, randomIndex)
    name = name .. char
  end

  return name
end
_G.nameButtonUI = generateRandomName(15)
_G.nameImageUI = generateRandomName(15)
_G.TimeEndName = generateRandomName(15)
_G.TimeEndNameText = generateRandomName(15)
for i, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
    if v:IsA("ImageButton")  and v.Parent:IsA("ScreenGui") and v.Image == "http://www.roblox.com/asset/?id=13511782360" then
        v.Parent:Destroy()
    end
end

for i, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
    if v:IsA("TextLabel") and v.Parent:IsA("ScreenGui") and v.TextColor3 == Color3.fromRGB(255, 87, 87) then
        if v.Parent then
            v.Parent:Destroy()
        end
    end
end

Section:NewToggle("Timer to end", "", function(timeendd)
    _G.TimeEnd = timeendd
    if timeendd then
        timeEnd()
    else
        game:GetService("CoreGui"):FindFirstChild(_G.TimeEndName ):Destroy()
    end
end)
Section:NewToggle("Off/On Invisible walls", "", function(offOninvPard)
    _G.offInPards = not offOninvPard
	delIPart()
end)
Section:NewToggle("Button hide ui", "", function(uii)
    if uii then
        hideUiButton()
    else
        game:GetService("CoreGui"):FindFirstChild(_G.nameButtonUI):Destroy()
    end
end)
Section:NewKeybind("remove gui", "hides the script on the button", Enum.KeyCode.B, function()
	Library:ToggleUI()
end)
Section_E:NewToggle("Esp (some bugs)", "There are mistakes", function(espVal)
	_G.espMonster = espVal
	ESP.Boxes = espVal
	ESP.Names = espVal
	if espVal then
		esp()
	end
end)

Section_E:NewToggle("Esp wit photo (some bugs)", "There are mistakes", function(espDecalV)
	_G.espD = espDecalV
	if espDecalV then
		espDecal()
	else
		espDecalDell()
	end
end)
Section_E:NewToggle("Key Esp (some bugs)", "There are mistakes", function(KeyEspV) 
	_G.KeyEsp = KeyEspV
	if KeyEspV then
		Kesp()
	else
		IespDell()
	end
end)
Section_E:NewToggle("Esp dying players", "", function(espPl)
    _G.espPH = espPl
    if not espPL then
        for i, player in pairs(workspace.Game.GamePlayers:GetChildren()) do
            if player:FindFirstChild("EspBox") and player:FindFirstChild("Help") then
                player:FindFirstChild("EspBox"):Destroy()
                player:FindFirstChild("Help"):Destroy()
            end
        end
    end
    espPlayerHelp()
    
end)
Section_Kd:NewToggle("Max lifting distance of a dying player", "", function(maxdistPH)
    _G.maxDistnPH = maxdistPH
    while _G.maxDistnPH do  
        if not _G.maxDistnPH then
            for i, v in pairs(workspace.Game.GamePlayers:GetDescendants()) do
                if v.Name == "InteractPrompt" and v.Parent.Name == "HumanoidRootPart" then
                    v.MaxActivationDistance = 8
                end
            end
            break
        end
    for i, v in pairs(workspace.Game.GamePlayers:GetDescendants()) do
        if v.Name == "InteractPrompt" and v.Parent.Name == "HumanoidRootPart" then
            v.MaxActivationDistance = math.huge
        end
    end
    wait(1)
    end
end)
Section_Kd:NewLabel("Key")
Section_Kd:NewButton("Key", "Allows you to take the key further and through walls", function()
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Parent.Name == "Handle" then
                local Ppt = v.Parent.Parent.Parent:FindFirstChild("InteractPrompt")
                if Ppt then
                    Ppt.RequiresLineOfSight = false
                    Ppt.MaxActivationDistance = 20
                end
            end
        end
    end
end)
Section_Kd:NewButton("Removes Key functions", "Removes the possibility of new keys", function()
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Parent.Name == "Handle" then
                local Pt = v.Parent.Parent.Parent:FindFirstChild("InteractPrompt")
                if Pt then
                    Pt.RequiresLineOfSight = true
                    Pt.MaxActivationDistance = 10
                end
            end
        end
    end
end)
Section_Kd:NewLabel("Door")
Section_Kd:NewSlider("Hold duration", "changes the possibility of how long to delay E", 4, 0, function(VaH)
    _G.valHold = VaH
end)
Section_Kd:NewButton("Door", "Allows you to take the key a little further and through walls", function()
    for _, map in ipairs(maps) do
        for i, r in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemPlace:GetDescendants()) do
            if r.Name == "InteractPrompt" and r.Parent.Name == "ControlPart" then
                r.HoldDuration = _G.valHold 
                r.MaxActivationDistance = 9
                r.RequiresLineOfSight = false
            end
        end
    end
end)
Section_Kd:NewButton("Removes Door functions", "Removes the possibility of new doors", function()
    for _, map in ipairs(maps) do
        for i, r in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemPlace:GetDescendants()) do
            if r.Name == "InteractPrompt" and r.Parent.Name == "ControlPart" then
                r.HoldDuration = 4
                r.MaxActivationDistance = 8
                r.RequiresLineOfSight = true
            end
        end
    end
end)
Section_Kd:NewLabel("Nightstandse")
Section_Kd:NewButton("Off Nightstandse", "Disables the ability to open nightstands", function()
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Name == "InteractPrompt" and v.Parent.Name == "ControlPart" then
                v.Enabled = false
            end
        end
    end
end)
Section_Kd:NewButton("On Nightstandse", "Includes the ability to open the nightstands", function()
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Name == "InteractPrompt" and v.Parent.Name == "ControlPart" then
                v.Enabled = true
            end
        end
    end
end)
Section_D:NewToggle("Auto farm door         BETA", "BETA", function(ft)
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Name == "InteractPrompt" and v.Parent.Name == "ControlPart" then
                v.Enabled = not ft
            end
        end
    end
    _G.AutoDoor = ft
    local success, errorCheckWinDoor = pcall(function()
        checkWinDoor()
    end)
end)
Section_D:NewToggle("Win door ", "Only already open", function(a)
    if a then
        _G.espp = true;
	while _G.espp == true do
		Door()
    	wait(2)
	end
    else
        _G.espp = false;
    end
end)
Section_D:NewToggle("Auto tp win door (This is the setting)", "Only already open", function(a)
    _G.dtp = a
end)
Section_D:NewKeybind("Win door check", "Only already open", Enum.KeyCode.Z, function()
    local function checkVictoryDoor(itemHuntFolder)
        local victoryDoorFound = false
        for _, v in ipairs(itemHuntFolder:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
					break
                end
            end
        return victoryDoorFound
    end

    local victoryDoorNotFound = true
    for _, itemHuntFolder in ipairs({
        game.Workspace.Maps.School.ItemHuntFolder.ItemPlace,
        game.Workspace.Maps.MagicCube.ItemHuntFolder.ItemPlace,
        game.Workspace.Maps.Castle.ItemHuntFolder.ItemPlace,
		game.Workspace.Maps.Refuge.ItemHuntFolder.ItemPlace,
		game.Workspace.Maps.IceCave.ItemHuntFolder.ItemPlace,
        game.Workspace.Maps.Forest.ItemHuntFolder.ItemPlace, 
    }) do
        if not checkVictoryDoor(itemHuntFolder) then
            victoryDoorNotFound = true
        end
    end
end)

Section_D:NewKeybind("Tp to key", "", Enum.KeyCode.X, function()
	tpkey()
end)
Section_D:NewKeybind("Tp to door", "", Enum.KeyCode.C, function()
	tpdoor()
end)

Section_S:NewSlider("Speed value", "", 80, 16, function(spe)
    _G.Speed = spe
end) 
Section_S:NewButton("Set Speed", "", function()
   game.Players.LocalPlayer.Character.Humanoid:SetAttribute("BaseSpeed", _G.Speed)
end)
Section_S:NewButton("Write maximum speed", "", function()
    game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Max speed",
    Text = tostring(game.Players.LocalPlayer.Character.Humanoid:GetAttribute("BaseSpeed")), 
    })
end)
Section_S:NewLabel("Jump")
Section_S:NewSlider("Jump Height", "", 80, 7, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
end)
Section_M:NewToggle("Panic default 5 seconds", "", function(a)
    if a then
        _G.espp = true;
	while _G.espp == true do
		panic()
    	wait()
	end
    else
        _G.espp = false;
    end
end)
Section_M:NewSlider("Panic seconds", "", 30, 0, function(s)
	_G.sec = s
end)
Section_M:NewButton("Tp to lobby", "", function()
	_G.tpback = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.BackLobbySpawnLocation.CFrame + Vector3.new(0,3,0)
end)
Section_M:NewButton("Tp to back", "", function()
	if _G.tpback == nil then
		game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Tp back nil",
		Text = "first tp in the lobby", 
		})
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.tpback
	end
end)
local effectNames = {
    ["Body Eyes"] = "FX_BodyEyes",
    ["Body Smoke"] = "FX_BodySmoke",
    ["Body Mosaic"] = "FX_BodyMosaic",
    ["Unbeatable"] = "FX_Unbeatable",
    ["Body Lightning"] = "FX_Body_Lightning",
    ["CoinX3"] = "FX_CoinX3",
    ["Trail Speed Doors"] = "FX_Trail_Speed_Doors",
    ["Trail Speed"] = "FX_Trail_Speed"
}
local function AttachFXToCharacter(effectName)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local humanoidRootPart = character.HumanoidRootPart
    local fx = humanoidRootPart:FindFirstChild(effectName)
    if not fx then
        local fxClone = game:GetService("ReplicatedStorage").Resources.FX[effectName]:Clone()
        fxClone.Anchored = true
        fxClone.Parent = humanoidRootPart
        game:GetService("RunService").Heartbeat:Connect(function()
            local fx = humanoidRootPart:FindFirstChild(effectName)
            if fx then
                fx.CFrame = humanoidRootPart.CFrame
            end
        end)
    end
end
Section_V:NewDropdown("Visuals", "", {"Body Eyes", "Body Smoke", "Body Mosaic", "Unbeatable", "Body Lightning", "CoinX3", "Trail Speed Doors", "Trail Speed"}, function(effectType)
    local effectName = effectNames[effectType]
    if effectName then
        AttachFXToCharacter(effectName)
    end
end)
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
    for _, effectName in pairs(effectNames) do
        AttachFXToCharacter(effectName)
    end
end)
Section_V:NewButton("Dell visuals", "", function()
	local function RemoveFXFromCharacter(effectName)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local humanoidRootPart = character.HumanoidRootPart
    local fx = humanoidRootPart:FindFirstChild(effectName)
    if fx then
        fx:Destroy()
    end
	end
	RemoveFXFromCharacter("FX_BodyEyes")
	RemoveFXFromCharacter("FX_BodySmoke")
	RemoveFXFromCharacter("FX_BodyMosaic") 
    RemoveFXFromCharacter("FX_Unbeatable")
    RemoveFXFromCharacter("FX_Body_Lightning")
    RemoveFXFromCharacter("FX_CoinX3") 
    RemoveFXFromCharacter("FX_Trail_Speed_Doors")
    RemoveFXFromCharacter("FX_Trail_Speed") 
end)

Section_Shop:NewButton("Open item shop", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.ScreenItemShop.Enabled = true
end)
Section_Shop:NewButton("Open custom shop", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.ScreenCustomShop.Enabled = true
end)
Section_Shop:NewButton("Open avatar shop", "", function()
game:GetService("Players").LocalPlayer.PlayerGui.ScreenAvatar.Enabled = true
end)
Section_Shop:NewButton("Open battale pass", "", function()
game:GetService("Players").LocalPlayer.PlayerGui.ScreenBattlePass.Enabled = true
end)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Plr.Character:MoveTo(Mouse.Hit.p)
end)
Section_cred:NewButton("copy my github", "", function()
	setclipboard("https://github.com/Varap228")
	game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Copy",
	Text = "My github copied to clipboard", 
	})
end)
Section_cred:NewButton("copy my pastebin", "", function()
	setclipboard("https://pastebin.com/u/Varap228")
	game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Copy",
	Text = "My pastebin copied to clipboard", 
	})
end)
Section_cred:NewButton("Change log", "", function()
	game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Change log 8.06.23",
	Text = "Update script for last update game", 
	})	
end)


function timeEnd()
    if not game:GetService("CoreGui"):FindFirstChild(_G.TimeEndName) then
        local Screenn = Instance.new("ScreenGui")
        Screenn.Parent = game:GetService("CoreGui")
        Screenn.Name = _G.TimeEndName

        local Tex = Instance.new("TextLabel")
        Tex.Parent = Screenn
        Tex.Name = _G.TimeEndNameText
        Tex.BackgroundTransparency = 1
        Tex.Position = UDim2.new(0, 760, 0, 40)
        Tex.Size = UDim2.new(0, 80, 0, 80)
        Tex.TextColor3 = Color3.fromRGB(255, 87, 87)
        Tex.TextStrokeTransparency = 0
        Tex.TextSize = 15
    end
    spawn(function()
        while _G.TimeEnd do
            if not _G.TimeEnd then
                break
            end
           -- if game:GetService("CoreGui"):FindFirstChild(_G.TimeEndName) then
                game:GetService("CoreGui")[_G.TimeEndName][_G.TimeEndNameText].Text = workspace.Lobby.LoobyRoom.Interaction.GameDoor.Message.SurfaceGui.Text.Text
         --  end
        wait(0.1)
        end
    end)
end
function espPlayerHelp()
    spawn(function()_G.ag = true
        while _G.espPH do
            if not _G.espPH then
                break
            end
            for i, player in pairs(workspace.Game.GamePlayers:GetChildren()) do
                local humanoid = player.Humanoid
                local isPlayingRequiredAnim = false

                if humanoid:GetPlayingAnimationTracks() then
                    local currentAnim = humanoid:GetPlayingAnimationTracks() 
                    for _, animTrack in ipairs(currentAnim) do
                        if table.find(animIds, animTrack.Animation.AnimationId) then
                            isPlayingRequiredAnim = true
                            if player:FindFirstChild("Humanoid") then
                                if not player:FindFirstChild("EspBox") then
                                    if player ~= game.Players.LocalPlayer.Character then
                                        local esp = Instance.new("BoxHandleAdornment",player)
                                        local BillboardGui = Instance.new("BillboardGui")
                                        local TextLabel = Instance.new("TextLabel")
                                        esp.Adornee = player
                                        esp.ZIndex = 0
                                        esp.Size = Vector3.new(3, 2, 3)
                                        esp.Transparency = 0.65
                                        esp.Color3 = Color3.fromRGB(255,48,48)
                                        esp.AlwaysOnTop = true
                                        esp.Name = "EspBox"

                                        BillboardGui.Parent = player
                                        BillboardGui.AlwaysOnTop = true
                                        BillboardGui.LightInfluence = 1
                                        BillboardGui.Size = UDim2.new(0, 40, 0, 40)
                                        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                                        BillboardGui.Name = "Help"

                                        TextLabel.Parent = BillboardGui
                                        TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                                        TextLabel.BackgroundTransparency = 1
                                        TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                        TextLabel.Text = "Help him"
                                        TextLabel.TextStrokeTransparency = 0
                                        TextLabel.TextWrapped = false
                                        TextLabel.TextColor3 = Color3.new(1, 0, 0)                               
                                    end
                                end
                            end
                        end
                    end
                end

                if not isPlayingRequiredAnim then
                    if player:FindFirstChild("EspBox") and player:FindFirstChild("Help") then
                        player:FindFirstChild("EspBox"):Destroy()
                        player:FindFirstChild("Help"):Destroy()
                    end
                end
            end
            for i, v in pairs(workspace.Game.DiedPlayers:GetChildren()) do 
                if v:FindFirstChild("EspBox") and v:FindFirstChild("Help") then
                    v:FindFirstChild("EspBox"):Destroy()
                    v:FindFirstChild("Help"):Destroy()
                end
            end
            wait(0.50)
        end
    end)
end
function hideUiButton()
    if not game:GetService("CoreGui"):FindFirstChild(_G.nameButtonUI) then
        local Screenn = Instance.new("ScreenGui")
        Screenn.Parent = game:GetService("CoreGui")
        Screenn.Name = _G.nameButtonUI

        local hide = Instance.new("ImageButton")
        hide.Name = _G.nameImageUI
        hide.Parent = Screenn
        hide.Position = UDim2.new(0, 120, 0, -30)
        hide.Size = UDim2.new(0, 50, 0, 50)
        hide.BorderSizePixel = 1
        hide.ScaleType = Enum.ScaleType.Crop
        hide.Image = "http://www.roblox.com/asset/?id=13511782360"
        hide.MouseButton1Click:Connect(function()
            Library:ToggleUI()
        end)
        local UserInputService = game:GetService("UserInputService")
        local isDragging = false
        local dragStartPos
        local dragStartOffset
        hide.MouseButton1Down:Connect(function()
            isDragging = true
            dragStartPos = UserInputService:GetMouseLocation()
            dragStartOffset = hide.Position - UDim2.new(0, dragStartPos.X, 0, dragStartPos.Y)
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
                local currentPos = UserInputService:GetMouseLocation()
                hide.Position = UDim2.new(0, currentPos.X, 0, currentPos.Y) + dragStartOffset
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isDragging = false
            end
        end)
    end
end
function checkWinDoor()
    while _G.AutoDoor do
        if not _G.AutoDoor then
            break
        end
        for _, map in ipairs(maps) do
            local itemPlace = game.Workspace.Maps[map].ItemHuntFolder.ItemPlace
            if #itemPlace:GetChildren() > 0 then
                local descendants = itemPlace:GetDescendants()
                local ghostRootAvailable = false
                for i, b in ipairs(descendants) do 
                    if b.Name == "GhostRoot" and #b:GetDescendants() == 0 then
                        ghostRootAvailable = true
                        if not _G.AutoDoor then
                            break
                        end
                        CheckKeyDoor()
                        break
                    end
                end

                if not ghostRootAvailable then
                    for _, v in pairs(itemPlace:GetDescendants()) do
		                if v.Name == "TouchInterest" and v.Parent.Name == "ExitRoot" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                            break
                        end
                    end
                end
            end
        end
        wait()
    end
end
function CheckKeyDoor()
    if not _G.AutoDoor then
        return
    end
    if not localPlayer then
        return
    else
        local success, playerData = pcall(function()
            return workspace.Game.GamePlayers[localPlayer.Name]
        end)
        if not success or not playerData then
            return
        else
            local success, secretKey = pcall(function()
                return playerData.SecretKey
            end)
            if not success or not secretKey then
                local success, errorGetKey = pcall(function()
                    return getKey()
                end)
            else
                local success, errorGetDoor = pcall(function()
                    return getDoor()
                end)
            end
        end
    end
end
function getKey()
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Parent.Name == "Handle" then
                local proximityPrompt = v.Parent.Parent.Parent:FindFirstChild("InteractPrompt")
                if proximityPrompt then
                    proximityPrompt.RequiresLineOfSight = false
                    proximityPrompt.MaxActivationDistance = 20
                    if localPlayer.PlayerGui.ScreenChasedWarning.Enabled then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0, -9, 0)
                        wait(0.1)
                        fireproximityprompt(proximityPrompt, 1, true)
                        if not _G.AutoDoor then 
                            break
                        end         
                        local success, errorCheckKeyDoor = pcall(function()
                            CheckKeyDoor()
                        end)
                        break
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0, 3, 0)
                        wait(0.2)
                        fireproximityprompt(proximityPrompt, 1, true)
                        if not _G.AutoDoor then
                            break
                        end         
                        local success, errorCheckKeyDoor = pcall(function()
                            CheckKeyDoor()
                        end)
                        break
                    end
                end
            end
        end
    end
end
function getDoor()
    for _, map in ipairs(maps) do
        for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemPlace:GetDescendants()) do
            if v.Name == "InteractPrompt" and v.Parent.Name == "ControlPart" then
                v.HoldDuration = 0
                v.RequiresLineOfSight = false   
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                wait(1)
                fireproximityprompt(v, 1, true)
                wait(0.1)
                if _G.AutoDoor == false then
                    break
                end
                local success, errorCheckWinDoor = pcall(function()
                    checkWinDoor()
                end)
                break
            end
        end
    end
end
function delIPart()
    for _, map in ipairs(maps) do
        for _, v in ipairs(game.Workspace.Maps[map].InvisParts:GetDescendants()) do
            if v:IsA("Part") and v.Name ~= "base" then
                v.CanCollide = _G.offInPards
                v.CanQuery = true
                v.CanTouch = true
            end
        end
    end
    for _, forest in ipairs(workspace.Maps.Forest.Parts.Wall:GetDescendants()) do
        if forest:IsA("Part") and forest.Name == "collide" then
            forest.CanCollide = _G.offInPards
            forest.CanQuery = true
        end
    end
    for _, v in ipairs(game:GetService("Workspace").Maps.Refuge.Parts["3"]:GetDescendants()) do
        if v.Name == "collide" then
            v.CanCollide = _G.offInPards
            v.CanQuery = true
        end
    end
    for _, school in ipairs(workspace.Maps.School.InvisParts.Stairs:GetChildren()) do 
        school.CanCollide = true
        school.CanQuery = true
    end
    for _, school2 in ipairs(workspace.Maps.School.InvisParts.Walls.Parterre:GetChildren()) do
        school2.CanCollide = true
        school2.CanQuery = true
    end
    for _, school3 in ipairs(workspace.Maps.School.Parts.BUILD.build["1F"].BUILD.wall.zlwall:GetChildren()[2]:GetChildren()) do
        if school3:IsA("UnionOperation") then
            school3.CanCollide = true
            school3.CanQuery = true
        end
    end
end
function panic()
    if game:GetService("Players").LocalPlayer.PlayerGui.ScreenChasedWarning.Enabled then
        local back = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.BackLobbySpawnLocation.CFrame + Vector3.new(0, 3, 0)
        wait(_G.sec or 5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = back
    end
end
function tpdoor()
	local function teleportToGhostRoot(itemHuntFolder)
    for i, v in pairs(itemHuntFolder:GetDescendants()) do
        if v.Name == "GhostRoot" and #v:GetChildren() == 0 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            break
        end
    end
	end
	teleportToGhostRoot(game:GetService("Workspace").Maps.School.ItemHuntFolder.ItemPlace)
	teleportToGhostRoot(game:GetService("Workspace").Maps.Castle.ItemHuntFolder.ItemPlace)
	teleportToGhostRoot(game:GetService("Workspace").Maps.MagicCube.ItemHuntFolder.ItemPlace)
	teleportToGhostRoot(game:GetService("Workspace").Maps.Refuge.ItemHuntFolder.ItemPlace) 
	teleportToGhostRoot(game:GetService("Workspace").Maps.IceCave.ItemHuntFolder.ItemPlace)
    teleportToGhostRoot(game:GetService("Workspace").Maps.Forest.ItemHuntFolder.ItemPlace) 
end
function tpkey()
	for _, map in ipairs(maps) do
        for i,v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
            if v.Parent.Name == "Handle" then
                local proxiPrompt = v.Parent.Parent.Parent:FindFirstChild("InteractPrompt")
                if proxiPrompt then
                    local tp = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    proxiPrompt.RequiresLineOfSight = false
                    proxiPrompt.MaxActivationDistance = 20
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0, 2, 0)
                    wait(0.1)
                    fireproximityprompt(proxiPrompt, 1, true)
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tp
                    break
                end
            end
	    end
	end
end
function espDecalDell()
	for _, b in ipairs(game:GetService("Workspace").Game.GamePlayers:GetDescendants()) do
	if b:IsA("BillboardGui") then
		b:Destroy()
	end
end
end
function espDecal()
	spawn(function ()
		while _G.espD == true do
			local function createBillboardGui(b, imageId)
			local billboardGui = b:FindFirstChild("BillboardGui")
			if not billboardGui then
				billboardGui = Instance.new("BillboardGui")
				billboardGui.Adornee = b
				billboardGui.Size = UDim2.new(0, 55, 0, 55)
				billboardGui.AlwaysOnTop = true
				billboardGui.StudsOffset = Vector3.new(0, 3, 0)
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Parent = billboardGui
				imageLabel.BackgroundTransparency = 1
				imageLabel.Size = UDim2.new(1, 0, 1, 0)
				billboardGui.Parent = b
			end
			local imageLabel = billboardGui.ImageLabel
			imageLabel.Image = "rbxassetid://" .. tostring(imageId)
			end
			local gamePlayers = game:GetService("Workspace").Game.GamePlayers:GetChildren()
			for i = 1, #gamePlayers do
			local b = gamePlayers[i]
			local imageName
			if b.Name == "Butcher" then
				imageName = 12629402865
			elseif b.Name == "Bear" then
				imageName = 12629403201
			elseif b.Name == "Rabbit" then
				imageName = 12629403353
			elseif b.Name == "Joker" then
				imageName = 12629403068
            elseif b.Name == "Yeti" then
				imageName = 13543099655       
			end
			if imageName then
				createBillboardGui(b, imageName)
			end
			end
			wait(1.5)
		end
	end)
end
function IespDell()
	local function disableBillboardGuis(folder)
    for i, a in ipairs(folder:GetDescendants()) do
        if a.Name == "BillboardGui" then
            a:Destroy()
        end
    end
	end
	local castleFolder = game:GetService("Workspace").Maps.Castle.ItemHuntFolder.ItemSpawn
	local schoolFolder = game:GetService("Workspace").Maps.School.ItemHuntFolder.ItemSpawn
	local magicCubeFolder = game:GetService("Workspace").Maps.MagicCube.ItemHuntFolder.ItemSpawn
	local refugeFolder = game:GetService("Workspace").Maps.Refuge.ItemHuntFolder.ItemSpawn 
	local icecaveFolder = game:GetService("Workspace").Maps.IceCave.ItemHuntFolder.ItemSpawn
    local forestFolder = game:GetService("Workspace").Maps.Forest.ItemHuntFolder.ItemSpawn
	disableBillboardGuis(castleFolder)
	disableBillboardGuis(schoolFolder)
	disableBillboardGuis(magicCubeFolder)
	disableBillboardGuis(refugeFolder)
	disableBillboardGuis(icecaveFolder) 
    disableBillboardGuis(forestFolder) 
end
function Kesp()
	spawn(function ()
		while _G.KeyEsp do
			local function createBillboardGui(parent)
			local BillboardGui = Instance.new("BillboardGui")
			local TextLabel = Instance.new("TextLabel")
			BillboardGui.Parent = parent
			BillboardGui.AlwaysOnTop = true
			BillboardGui.LightInfluence = 1
			BillboardGui.Size = UDim2.new(0, 28, 0, 28)
			BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
			TextLabel.Parent = BillboardGui
			TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
            TextLabel.TextStrokeTransparency = 0
			TextLabel.Text = "Key"
			TextLabel.TextColor3 = Color3.new(1, 0, 0)
			TextLabel.TextScaled = true
			end 

			for _, map in ipairs(maps) do
				for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
					if v.Parent.Name == "Handle" and not v.Parent:FindFirstChild("BillboardGui") then
						createBillboardGui(v.Parent)
					end
				end
			end
			wait(1.5)
		end
	end)
end
function esp()
	spawn(function ()
		while _G.espMonster == true do
			ESP:AddObjectListener(Workspace.Game.GamePlayers, {
			Name = "Bear", 
			CustomName = "Bear",
			Color = Color3.fromRGB(0, 0, 238), 
			IsEnabled = "Bear1" 
			})
			ESP:AddObjectListener(Workspace.Game.GamePlayers, {
			Name = "Butcher", 
			CustomName = "Butcher",
			Color = Color3.fromRGB(238, 173, 14), 
			IsEnabled = "Butcher1" 
			})
			ESP:AddObjectListener(Workspace.Game.GamePlayers, {
			Name = "Joker", 
			CustomName = "Joker",
			Color = Color3.fromRGB(255, 0, 0), 
			IsEnabled = "Joker1" 
			})
			ESP:AddObjectListener(Workspace.Game.GamePlayers, {
			Name = "Yeti", 
			CustomName = "Yeti",
			Color = Color3.fromRGB(255, 250, 250), 
			IsEnabled = "Yeti1" 
			})
			ESP:AddObjectListener(Workspace.Game.GamePlayers, {
			Name = "Rabbit", 
			CustomName = "Rabbit",
			Color = Color3.fromRGB(255,105,180), 
			IsEnabled = "Rabbit1" 
			})
			ESP.Bear1 = true
			ESP.Butcher1 = true
			ESP.Joker1 = true
			ESP.Rabbit1 = true
            ESP.Yeti1 = true
			wait(1.5)
		end
	end)
end
function Door()
	local function sendNotification(title, text, icon)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title,
		Text = text,
		Icon = icon
	})
	end
	local function teleportToDoor(doorCFrame)
	if _G.dtp == true then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, -50)
		wait(5)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = doorCFrame
	end
	end
	local function searchForDoor(itemPlace, title, text, icon)
	for _, v in pairs(itemPlace:GetDescendants()) do
		if v.Name == "TouchInterest" then
			sendNotification(title, text, icon)
			teleportToDoor(v.Parent.CFrame)
		end
	end
	end 
	searchForDoor(game.Workspace.Maps.School.ItemHuntFolder.ItemPlace, "Win door", "found the victory door in the School", "rbxassetid://12941506088")
	searchForDoor(game.Workspace.Maps.Castle.ItemHuntFolder.ItemPlace, "Win door", "found the victory door in the Castle", "rbxassetid://12941506203")
	searchForDoor(game.Workspace.Maps.MagicCube.ItemHuntFolder.ItemPlace, "Win door", "found the victory door in the Magic Cube", "rbxassetid://13110717383")
	searchForDoor(game.Workspace.Maps.Refuge.ItemHuntFolder.ItemPlace, "Win door", "found the victory door in the Refuge", "rbxassetid://13256112532")
	searchForDoor(game.Workspace.Maps.IceCave.ItemHuntFolder.ItemPlace, "Win door", "found the victory door in the Ice Cave", "rbxassetid://13416355248")
    searchForDoor(game.Workspace.Maps.Forest.ItemHuntFolder.ItemPlace, "Win door", "found the victory door in the Forest", "rbxassetid://13685804074")
end
