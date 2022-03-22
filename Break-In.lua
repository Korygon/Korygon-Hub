--[[--------------------------------------------------------

████████████████████████████▀███████████████████████████████
█▄─█─▄█─▄▄─█▄─▄▄▀█▄─█─▄█─▄▄▄▄█─▄▄─█▄─▀█▄─▄█─█─█▄─██─▄█▄─▄─▀█
██─▄▀██─██─██─▄─▄██▄─▄██─██▄─█─██─██─█▄▀─██─▄─██─██─███─▄─▀█
▀▄▄▀▄▄▀▄▄▄▄▀▄▄▀▄▄▀▀▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▀▀▄▄▀▄▀▄▀▀▄▄▄▄▀▀▄▄▄▄▀▀

----------------------------------------------------------]]
--[[--------------------------------------------------------==
Constant
--]]--------------------------------------------------------==
local Players = game:GetService("Players")
local speaker = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local G_RemoteEvents = ReplicatedStorage.RemoteEvents

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

--[[--------------------------------------------------------==
Function
--]]--------------------------------------------------------==
local function PlayerTo(x, y, z)
	local new = CFrame.new(x, y, z)

	speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	wait(.05)
	speaker.Character.HumanoidRootPart.CFrame = new
end

local function FindPLR(name)
	for _, v in pairs(Players:GetPlayers()) do
		if name:lower() == (v.Name:lower()):sub(1, #name) then
			return v
		elseif name:lower() == (v.DisplayName:lower()):sub(1, #name) then
			return v
		end
	end
end

local function GetTools(t)
	local G_ToolGiver = ReplicatedStorage.RemoteEvents.GiveTool
	
	if t == "Chips" then
		G_ToolGiver:FireServer("Chips")
		
	elseif t == "Pizza" then
		G_ToolGiver:FireServer("Pizza3")
		
	elseif t == "Lollipop" then
		G_ToolGiver:FireServer("Lollipop")
		
	elseif t == "Apple" then
		G_ToolGiver:FireServer("Apple")
		
	elseif t == "BloxyCola" then
		G_ToolGiver:FireServer("BloxyCola")
		
	elseif t == "EpicPizza" then
		G_ToolGiver:FireServer("EpicPizza")
		
	elseif t == "Cookie" then
		G_ToolGiver:FireServer("Cookie")
		
	elseif t == "ExpiredBloxyCola" then
		G_ToolGiver:FireServer("ExpiredBloxyCola")
		
	elseif t == "Bat" then
		G_ToolGiver:FireServer("Bat")
		
	elseif t == "MedKit" then
		G_ToolGiver:FireServer("MedKit")
		
	elseif t == "TeddyBloxpin" then
		G_ToolGiver:FireServer("TeddyBloxpin")
		
	elseif t == "Cure" then
		G_ToolGiver:FireServer("Cure")
		
	elseif t == "Key" then
		G_ToolGiver:FireServer("Key")
		
	elseif t == "Plank" then
		G_ToolGiver:FireServer("Plank")
		
	else
		warn("Invalid item \"" .. t .. "\"")
	end
end

local function GetRole(t)
	if t == "Police" then
		local args = {
			[1] = "Gun",
			[2] = true
		}

		G_RemoteEvents.OutsideRole:FireServer(unpack(args))

	elseif t == "Swat" then
		local args = {
			[1] = "SwatGun",
			[2] = true
		}

		G_RemoteEvents.OutsideRole:FireServer(unpack(args))

	elseif t == "Fighter" then
		local args = {
			[1] = "Sword",
			[2] = true
		}

		G_RemoteEvents.OutsideRole:FireServer(unpack(args))
		
	elseif t == "Hyper" then
		local args = {
			[1] = "Lollipop",
			[2] = false
		}

		G_RemoteEvents.OutsideRole:FireServer(unpack(args))
		
	elseif t == "Guest" then
		local args = {
			[1] = "LinkedSword",
			[2] = false
		}

		G_RemoteEvents.OutsideRole:FireServer(unpack(args))
	end
end

local function GetWeapon(t)
	if t == "Hammer" then
		local args = {
			[1] = true,
			[2] = "Hammer"
		}

		G_RemoteEvents.BasementWeapon:FireServer(unpack(args))
		
	elseif t == "Crowbar" then
		local args = {
			[1] = true,
			[2] = "Crowbar"
		}

		G_RemoteEvents.BasementWeapon:FireServer(unpack(args))
		
	elseif t == "Broom" then
		local args = {
			[1] = true,
			[2] = "Broom"
		}

		G_RemoteEvents.BasementWeapon:FireServer(unpack(args))
		
	elseif t == "Spanner" then
		local args = {
			[1] = true,
			[2] = "Spanner"
		}

		G_RemoteEvents.BasementWeapon:FireServer(unpack(args))
		
	elseif t == "Pitchfork" then
		local args = {
			[1] = true,
			[2] = "Pitchfork"
		}

		G_RemoteEvents.BasementWeapon:FireServer(unpack(args))
		
	elseif t == "Breaker" then
		local args = {
			[1] = true,
			[2] = "Breaker"
		}

		G_RemoteEvents.BasementWeapon:FireServer(unpack(args))
	end
end
--[[--------------------------------------------------------==
Library
--]]--------------------------------------------------------==
local GUI_Name = "KorygonHub | Break In"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local KRYGN = Library.new(GUI_Name, 5013109572)

--[[------------------==
Items Giver Page
--]]------------------==
local ItemsGiverPage = KRYGN:addPage("Items Giver", 6026568266)
--[[---
Foods Section
-----]]
local It_FoodSec = ItemsGiverPage:addSection("Foods")

It_FoodSec:addButton("Chips", function()
	GetTools("Chips")
end)

It_FoodSec:addButton("Pizza", function()
	GetTools("Pizza")
end)

It_FoodSec:addButton("Lollipop", function()
	GetTools("Lollipop")
end)

It_FoodSec:addButton("Apple", function()
	GetTools("Apple")
end)

It_FoodSec:addButton("Bloxy Cola", function()
	GetTools("BloxyCola")
end)

It_FoodSec:addButton("Cookie", function()
	GetTools("Cookie")
end)

It_FoodSec:addButton("Bad Pizza", function()
	GetTools("EpicPizza")
end)

It_FoodSec:addButton("High Sugar Bloxy Cola", function()
	GetTools("ExpiredBloxyCola")
end)


--[[---
Weapons Section
-----]]
local It_WeaponSec = ItemsGiverPage:addSection("Weapons")

It_WeaponSec:addButton("Bat", function()
	GetTools("Bat")
end)

It_WeaponSec:addButton("Hammer", function()
	GetWeapon("Hammer")
end)

It_WeaponSec:addButton("Crowbar", function()
	GetWeapon("Crowbar")
end)

It_WeaponSec:addButton("Broom", function()
	GetWeapon("Broom")
end)

It_WeaponSec:addButton("Wrench", function()
	GetWeapon("Spanner")
end)

It_WeaponSec:addButton("Teddy Bloxpin", function()
	GetTools("TeddyBloxpin")
end)


--[[---
Healing Section
-----]]
local It_HealingSec = ItemsGiverPage:addSection("Healing")

It_HealingSec:addButton("MedKit", function()
	GetTools("MedKit")
end)

It_HealingSec:addButton("Cure", function()
	GetTools("Cure")
end)


--[[---
Others Section
-----]]
local It_OthersSec = ItemsGiverPage:addSection("Others")

It_OthersSec:addButton("Plank", function()
	GetTools("Plank")
end)


It_OthersSec:addButton("Basement Key", function()
	GetTools("Key")
end)


--[[------------------==
Teleportation Page
--]]------------------==
local TeleportationPage = KRYGN:addPage("Teleport", 6034684937)
--[[---
Teleport To Players Section
-----]]
local Te_TeleToPLR = TeleportationPage:addSection("Teleport To Player")

Te_TeleToPLR:addTextbox("Teleport To Player", "USERNAME", function(value, focusLost)
	if focusLost then
		local target = FindPLR(value)
		if target then
			speaker.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
		end
	end
end)


--[[---
Teleport To Places Section
-----]]
local Te_TeleToPlaces = TeleportationPage:addSection("Teleport To Places")

Te_TeleToPlaces:addButton("Teleport To The Basement", function()
	PlayerTo(71, -15, -163)
end)

Te_TeleToPlaces:addButton("Teleport To The House", function()
	PlayerTo(-36, 3, -200)
end)

Te_TeleToPlaces:addButton("Teleport To The Attic", function()
	PlayerTo(-16, 35, -220)
end)

Te_TeleToPlaces:addButton("Teleport To The Store", function()
	PlayerTo(-422, 3, -121)
end)

Te_TeleToPlaces:addButton("Teleport To The Sewer", function()
	PlayerTo(129, 3, -125)
end)

Te_TeleToPlaces:addButton("Teleport To The Boss Room", function()
	PlayerTo(-39, -287, -1480)
end)


--[[------------------==
Roles Page
--]]------------------==
local RolesPage = KRYGN:addPage("Roles", 6023426944)
--[[---
Get Roles Section
-----]]
local Ro_RolesSec = RolesPage:addSection("Get Roles (Only works on lobby.)")

Ro_RolesSec:addButton("Become The Police", function()
	GetRole("Police")
end)

Ro_RolesSec:addButton("Become The Swat", function()
	GetRole("Swat")
end)

Ro_RolesSec:addButton("Become The Fighter", function()
	GetRole("Fighter")
end)

Ro_RolesSec:addButton("Become The Hyper", function()
	GetRole("Hyper")
end)

Ro_RolesSec:addButton("Become The Guest", function()
	GetRole("Guest")
end)


--[[------------------==
Miscellaneous Page
--]]------------------==
local MiscPage = KRYGN:addPage("Misc", 6022668955)
--[[---
Main Section
-----]]
local Mi_MainSec = MiscPage:addSection("Main")

Mi_MainSec:addButton("Befriend with cat", function()
	G_RemoteEvents.Cattery:FireServer()
end)

Mi_MainSec:addButton("Unlock Safe", function()
	local args = {
		[1] = game:GetService("Workspace").CodeNote.SurfaceGui.TextLabel.Text
	}
	
	G_RemoteEvents.Safe:FireServer(unpack(args))
end)

Mi_MainSec:addButton("Turn Basement light on", function()
	G_RemoteEvents.BasementMission:FireServer()
end)

Mi_MainSec:addButton("Deliver all ice", function()
	G_RemoteEvents.EggHuntEvent:FireServer(1, "IcePart1")
	wait(1)
	G_RemoteEvents.EggHuntEvent:FireServer(2, "IcePart1")
	wait(1)
	G_RemoteEvents.EggHuntEvent:FireServer(1, "IcePart1")
end)

Mi_MainSec:addButton("Kill All Enemies", function()
	for i,v in pairs(game.Workspace.BadGuys:GetChildren()) do
		for i = 1, 50 do
			G_RemoteEvents.HitBadguy:FireServer(v,10)
			G_RemoteEvents.HitBadguy:FireServer(v,996)
			G_RemoteEvents.HitBadguy:FireServer(v,9)
			G_RemoteEvents.HitBadguy:FireServer(v,8)
			G_RemoteEvents.HitBadguy:FireServer(v,996)
		end
	end
end)

Mi_MainSec:addButton("Heal", function()
	for i = 1, 200 do
		wait(0.0001)
		local args = {
			[1] = "Cat"
		}
		
		G_RemoteEvents.Energy:FireServer(unpack(args))
	end
end)


--[[------------------==
Settings Page
--]]------------------==
local SettingPage = KRYGN:addPage("Settings", 6031280882)
--[[---
Settings Section
-----]]
local Se_SettingsSec = SettingPage:addSection("Settings")

Se_SettingsSec:addKeybind("Toggle Gui", Enum.KeyCode.RightControl, function()
	KRYGN:toggle()
end, function() end)


--[[---
Theme Section
-----]]
local Se_ThemeSec = SettingPage:addSection("Theme Changer")

for theme, color in pairs(themes) do
	Se_ThemeSec:addColorPicker(theme, color, function(color3)
		KRYGN:setTheme(theme, color3)
	end)
end


--[[------------------==
Credit Page
--]]------------------==
local CreditPage = KRYGN:addPage("Credit", 6023565898)
--[[---
Special Section
-----]]
local Cr_SpecialSec = CreditPage:addSection("Special")

Cr_SpecialSec:addButton("Script Tester : " .. tostring(speaker.Name), function()
	KRYGN:Notify("Credits", "Hey that's you!. Did you want to copy your own username?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard(tostring(speaker.Name))
			else
				KRYGN:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)
--[[---
Credit Section
-----]]
local Cr_CreditSec = CreditPage:addSection("Credits")

Cr_CreditSec:addButton("UI = Venyx Ui", function()
	KRYGN:Notify("Credits", "Do you want to copy the link to the Venyx Ui?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard("https://v3rmillion.net/showthread.php?tid=1026479")
			else
				KRYGN:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)


Cr_CreditSec:addButton("Script = Korygon Hub", function()
	KRYGN:Notify("Credits", "Do you want to copy the discord link?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard("https://discord.gg/FXR36XUGKx")
			else
				KRYGN:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)


KRYGN:SelectPage(KRYGN.pages[5], true)