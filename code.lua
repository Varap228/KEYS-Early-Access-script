-- Butcher rbxassetid://12629402865
-- Bear rbxassetid://12629403201
-- Joker rbxassetid://12629403068
-- Rabbit rbxassetid://12629403353
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
local Window = Library.CreateLib("By Varap228", "RJTheme8")
local Tab_cred = Window:NewTab("Credits")
local Section_cred = Tab_cred:NewSection("Ctrl+click tp")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")
local Tab_E = Window:NewTab("Esp")
local Section_E = Tab_E:NewSection("Esp")
local Tab_D = Window:NewTab("Door")
local Section_D = Tab_D:NewSection("Door")
local Tab_S = Window:NewTab("Movements")
local Section_S = Tab_S:NewSection("Movements")
ESP:Toggle(true) 
ESP.Players = false 
Section:NewButton("Remov invis parts", "Some bug in the School", function()
	game:GetService("Workspace").Maps.School.InvisParts:destroy()
	game:GetService("Workspace").Maps.Castle.InvisParts:destroy()
	game:GetService("Workspace").Maps.MagicCube.InvisParts:destroy()
end)
Section:NewKeybind("remove gui", "hides the script on the button", Enum.KeyCode.B, function()
	Library:ToggleUI()
end)
Section_E:NewToggle("Esp (some bugs)", "There are mistakes", function(a)
    if a then
        _G.espp = true;
		ESP.Boxes = true
		ESP.Names = true
	while _G.espp == true do
	esp()
    wait(1.5)
	end
    else
        _G.espp = false;
		ESP.Boxes = false
		ESP.Names = false
    end
end)
Section_E:NewToggle("Esp wit photo (some bugs)", "There are mistakes", function(a)
    if a then
        _G.espp = true;
	while _G.espp == true do
	espDecal()
    wait(1.5)
	end
    else
        _G.espp = false;
		espDecalDell()
    end
end)
Section_E:NewToggle("Item Esp (some bugs)", "There are mistakes", function(a)
    if a then
        _G.espp = true;
	while _G.espp == true do
	Iesp()
    wait(1.5)
	end
    else
        _G.espp = false;
		IespDell()
    end
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
	local function checkVictoryDoor(itemHuntFolder, mapName, iconId)
    local victoryDoorFound = false
    for _, v in ipairs(itemHuntFolder:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
			if _G.TpD == true then
				local back = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				wait(1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, -50)
				wait(2.55)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
				victoryDoorFound = true
				wait(2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = back
				break
			else
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
            	victoryDoorFound = true
				break
			end
        end
    end

    if not victoryDoorFound then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "No win door",
            Text = "while there is no victory door " .. mapName,
            Icon = "rbxassetid://" .. iconId
        })
    end
	end
	checkVictoryDoor(game.Workspace.Maps.School.ItemHuntFolder.ItemPlace, "School", 12941506088)
	checkVictoryDoor(game.Workspace.Maps.MagicCube.ItemHuntFolder.ItemPlace, "Magic Cube", 13110717383)
	checkVictoryDoor(game.Workspace.Maps.Castle.ItemHuntFolder.ItemPlace, "Castle", 12941506203)

end)
Section_D:NewKeybind("Tp to key", "", Enum.KeyCode.X, function()
	tpkey()
end)
Section_D:NewKeybind("Tp to door", "", Enum.KeyCode.C, function()
	tpdoor()
end)
Section_S:NewButton("Tp to lobby", "", function()
	_G.tpback = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.BackLobbySpawnLocation.CFrame + Vector3.new(0,3,0)
end)
Section_S:NewButton("Tp to back", "", function()
	if _G.tpback == "nil" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Tp back nil",
		Text = "first tp in the lobby", 
		})
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.tpback
	end
end)
Section_S:NewSlider("JumpHeight", "", 200, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
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
	Title = "Change log 21.04.23",
	Text = "Add Tp to key, Tp to door, \n Tp lobby", 
	})	
end)
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
end
function tpkey()
	local maps = {"School", "Castle", "MagicCube"}

	for _, map in ipairs(maps) do
	for i,v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
		if v.Name == "Handle" and v.Parent.Parent.Parent.Name ~= "DrawerContainer" then
			local tp = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait()
			for i,b in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetDescendants()) do
				if b.Name == "ToolName" and b.Text == "Секретный Ключ" then
					game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "No",
					Text = "You already have a key", 
					Icon = "rbxassetid://12572688026"
					})
					break
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
					game:GetService("Workspace").Camera.CFrame = CFrame.new(22.0546761, 12.4027071, 13.0725975, -0.0610468015, 0.982970953, -0.173324943, 9.31322575e-10, 0.173648819, 0.98480773, 0.998134911, 0.0601193607, -0.0106007047)
					local virtualInputManager = game:GetService("VirtualInputManager")
					virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game) 
					wait()
					virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
					wait(0.22)
					virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game) 
					wait()
					virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
					wait(0.22)
					virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game) 
					wait()
					virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
					wait(0.22)
					virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game) 
					wait()
					virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tp
					break
				end	
			end
			break	
		end
	end
	end
end
function espDecalDell()
	for _, b in ipairs(game:GetService("Workspace").Game.GamePlayers:GetDescendants()) do
	if b:IsA("BillboardGui") then
		b.Enabled = false
	end
end

end
function espDecal()
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
	billboardGui.Enabled = true
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
	end
	if imageName then
		createBillboardGui(b, imageName)
	end
	end
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

	disableBillboardGuis(castleFolder)
	disableBillboardGuis(schoolFolder)
	disableBillboardGuis(magicCubeFolder)

end
function Iesp()
	local function createBillboardGui(parent)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    BillboardGui.Parent = parent
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1
    BillboardGui.Size = UDim2.new(0, 50, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Text = "Key"
    TextLabel.TextColor3 = Color3.new(1, 0, 0)
    TextLabel.TextScaled = true
	end

	local maps = {"Castle", "School", "MagicCube"}

	for _, map in ipairs(maps) do
    for i, v in pairs(game.Workspace.Maps[map].ItemHuntFolder.ItemSpawn:GetDescendants()) do
        if v.Parent.Name == "Handle" and not v.Parent:FindFirstChild("BillboardGui") then
            createBillboardGui(v.Parent)
   		end
	end
	end
end
function esp()
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
    Name = "Rabbit", 
    CustomName = "Rabbit",
    Color = Color3.fromRGB(255,105,180), 
    IsEnabled = "Rabbit1" 
	})
	ESP.Bear1 = true
	ESP.Butcher1 = true
	ESP.Joker1 = true
	ESP.Rabbit1 = true
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

end
