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

local G_GAMEWHATEVER = game:GetService("Workspace")

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

BRGHTNSS = game:GetService("Lighting").Brightness
CLCKTM = game:GetService("Lighting").ClockTime
FGND = game:GetService("Lighting").FogEnd
GLBLSHDWS = game:GetService("Lighting").GlobalShadows
OTDRAMBNT = game:GetService("Lighting").OutdoorAmbient

--[[--------------------------------------------------------==
Function
--]]--------------------------------------------------------==
local function PlayerTo(x, y, z)
	local new = CFrame.new(x, y, z)

	speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	wait(.05)
	speaker.Character.HumanoidRootPart.CFrame = new
end


local function GetItem(ItemType)
	if ItemType == "GreenKey" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(-279.601654, 1.29329336, -38.6287994, 0.707060337, -0.707153201, 1.33812428e-05, 1.33812428e-05, 3.23057175e-05, 1, -0.707153201, -0.707060337, 3.23057175e-05) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(-279.601654, 1.29329336, -38.6287994)
				end
			end
		end
		
	elseif ItemType == "BlueKey" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(-110.590004, 44.5, -91.7500076, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(-110.590004, 44.5, -91.7500076)
				end
			end
		end
		
	elseif ItemType == "PurpleKey" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(-295.501617, 122.143295, 497.471191, -0.707060337, -0.707153201, -1.33812428e-05, 1.33812428e-05, -3.23057175e-05, 1, -0.707153201, 0.707060337, 3.23057175e-05) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(-295.501617, 122.143295, 497.471191)
				end
			end
		end
		
	elseif ItemType == "RedKey" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(70.8000183, 1.20000398, -448.399994, -0.707060337, 0.707153201, 1.33812428e-05, -1.33812428e-05, -3.23057175e-05, 1, 0.707153201, 0.707060337, 3.23057175e-05) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(70.8000183, 1.20000398, -448.399994)
				end
			end
		end
		
	elseif ItemType == "YellowKey" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(64.2216949, 26.8932934, -481.771179, 0.707060337, 0.707153201, -1.33812428e-05, -1.33812428e-05, 3.23057175e-05, 1, 0.707153201, -0.707060337, 3.23057175e-05) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(64.2216949, 26.8932934, -481.771179)
				end
			end
		end
		
	elseif ItemType == "WhiteKey" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(-20.5016365, 5.14329338, -80.5288086, 0.707060337, -0.707153201, 1.33812428e-05, 1.33812428e-05, 3.23057175e-05, 1, -0.707153201, -0.707060337, 3.23057175e-05) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(-20.5016365, 5.14329338, -80.5288086)
				end
			end
		end
		
	elseif ItemType == "GreyKey" then --
		for _, v in pairs(workspace:GetChildren()) do
			if v:IsA("Model") and v:FindFirstChild("Handle") then
				if fireclickdetector then
					fireclickdetector(v.Handle.ClickDetector)
				end
			end
		end
		
	elseif ItemType == "Board" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(-200.901642, 1.2932936, -166.903625, 0.913549721, 0, 0.406727046, 0, 1, 0, -0.406727046, 0, 0.913549721) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(-200.901642, 1.2932936, -166.903625)
				end
			end
		end
		
	elseif ItemType == "BloxyCola" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(76.3000107, 4.6000061, -455.199982, 0, 0, -1, 0, 1, 0, 1, 0, 0) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(76.3000107, 4.6000061, -455.199982)
				end
			end
		end
		
	elseif ItemType == "GetAllCheese" then --
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		wait(.1)
		game:GetService("ReplicatedStorage").AddCheese:FireServer()
		
	elseif ItemType == "RedCheese" then --
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.CFrame == CFrame.new(-12.8112183, 5.32002211, -120.237991, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
				if fireclickdetector then
					fireclickdetector(v.ClickDetector)
				else
					PlayerTo(-12.8112183, 5.32002211, -120.237991)
				end
			end
		end
		
	else
		warn("Invalid Item.")
	end
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

--[[--------------------------------------------------------==
Library
--]]--------------------------------------------------------==
local GUI_Name = "KorygonHub | Cheese Escape"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local KRYGN = Library.new(GUI_Name, 5013109572)

--[[------------------==
Character Page
--]]------------------==
local CharPage = KRYGN:addPage("Character", 6022668887)
--[[---
Main Section
-----]]
	local Ch_Main = CharPage:addSection("Main")

Ch_Main:addToggle("Noclip", false, function(bool)
	--Credit to Infinite Yield
	if bool == true then
		local function NoclipLoop()
			if speaker.Character ~= nil then
				for _, child in pairs(speaker.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true then
						child.CanCollide = false
					end
				end
			end
		end
		
		Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
		
	else
		if Noclipping then
			Noclipping:Disconnect()
		end
		
	end
end)


Ch_Main:addSlider("Change Walkspeed", 16, 1, 200, function(value)
	speaker.Character.Humanoid.WalkSpeed = value
end)


Ch_Main:addSlider("Change Jumppower", 50, 1, 350, function(value)
	speaker.Character.Humanoid.JumpPower = value
end)


--[[------------------==
Items Page
--]]------------------==
local ItemsPage = KRYGN:addPage("Items", 6026568220)
--[[---
Cheese Section
-----]]
	local It_GetCheeseSec = ItemsPage:addSection("Get Cheese")

It_GetCheeseSec:addButton("Get All Cheese", function()
	GetItem("GetAllCheese")

end)

It_GetCheeseSec:addButton("Get Red Cheese", function()
	GetItem("RedCheese")
end)

It_GetCheeseSec:addButton("Add One Cheese", function()
	game:GetService("ReplicatedStorage").AddCheese:FireServer()
end)

--[[---
Keys Section
-----]]
	local It_GetKeySec = ItemsPage:addSection("Get Keys")

It_GetKeySec:addButton("Get Blue Key", function()
	GetItem("BlueKey")
end)

It_GetKeySec:addButton("Get Green Key", function()
	GetItem("GreenKey")
end)

It_GetKeySec:addButton("Get Red Key", function()
	GetItem("RedKey")
end)

It_GetKeySec:addButton("Get White Key", function()
	GetItem("WhiteKey")
end)

It_GetKeySec:addButton("Get Yellow Key", function()
	GetItem("YellowKey")
end)

It_GetKeySec:addButton("Get Purple Key", function()
	GetItem("PurpleKey")
end)

It_GetKeySec:addButton("Get Grey Key", function()
	GetItem("GreyKey")
end)


--[[---
Others Section
-----]]
	local It_GetOtherSec = ItemsPage:addSection("Get Others")

It_GetOtherSec:addButton("Get Board", function()
	GetItem("Board")
end)

It_GetOtherSec:addButton("Get BloxyCola", function()
	GetItem("BloxyCola")
end)


--[[---
Miscellaneous Section
-----]]
	local It_GetMiscSec = ItemsPage:addSection("Get Miscellaneous")

It_GetMiscSec:addButton("Get F3X", function()
	loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)

It_GetMiscSec:addButton("Get BTools", function()
	Instance.new("HopperBin", speaker:FindFirstChildOfClass("Backpack")).BinType = 1
	Instance.new("HopperBin", speaker:FindFirstChildOfClass("Backpack")).BinType = 2
	Instance.new("HopperBin", speaker:FindFirstChildOfClass("Backpack")).BinType = 3
	Instance.new("HopperBin", speaker:FindFirstChildOfClass("Backpack")).BinType = 4
end)

--[[------------------==
Teleport Page
--]]------------------==
local TeleportPage = KRYGN:addPage("Teleportation", 6034684937)
--[[---
Teleport To Players Section
-----]]
	local Te_TeleToPLR = TeleportPage:addSection("Teleport To Player")

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
	local Te_TeleToPlaces = TeleportPage:addSection("Teleport To Places")

Te_TeleToPlaces:addButton("Teleport To Spawn", function()
	PlayerTo(-12, 5, -13)
end)


Te_TeleToPlaces:addButton("Teleport To Finish Gate", function()
	PlayerTo(-290, 4, -126)
end)


Te_TeleToPlaces:addButton("Teleport To Last Cheese Button", function()
	PlayerTo(-273, 49, -216)
end)


Te_TeleToPlaces:addButton("Teleport To ??? Portal", function()
	PlayerTo(-30, 5, -71)
end)



--[[---
Teleport To Keys Section
-----]]
	local Te_TeleToKeys = TeleportPage:addSection("Teleport To Keys")

Te_TeleToKeys:addButton("Teleport to Blue Key", function()
	PlayerTo(-111, 47, -87)
end)

Te_TeleToKeys:addButton("Teleport to Green Key", function()
	PlayerTo(-280, 4, -34)
end)

Te_TeleToKeys:addButton("Teleport to Red Key", function()
	PlayerTo(70, 4, -456)
end)

Te_TeleToKeys:addButton("Teleport to White Key", function()
	PlayerTo(-14, 5, -81)
end)

Te_TeleToKeys:addButton("Teleport to Yellow Key", function()
	PlayerTo(58, 27, -481)
end)

Te_TeleToKeys:addButton("Teleport to Purple Key", function()
	PlayerTo(-289, 122, 498)
end)

Te_TeleToKeys:addButton("Teleport to Grey Key", function()
	PlayerTo(1051, 51, -1274)
end)


--[[---
Teleport To Others Section
-----]]
	local Te_TeleToOthers = TeleportPage:addSection("Teleport To Others")

Te_TeleToOthers:addButton("Teleport to Board Giver", function()
	PlayerTo(-201, 4, -161)
end)

Te_TeleToOthers:addButton("Teleport to BloxyCola Giver", function()
	PlayerTo(70, 4, -456)
end)


--[[---
Teleport To Cheese Section
-----]]
local Te_TeleToCheese = TeleportPage:addSection("Teleport To Cheeses")

Te_TeleToCheese:addButton("Teleport to Red Cheese", function()
	PlayerTo(-12, 5, -115)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 1", function()
	PlayerTo(-135, 4, -162)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 2", function()
	PlayerTo(-273, 4, -15)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 3", function()
	PlayerTo(-255, 49, -164)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 4", function()
	PlayerTo(-271, 49, -224)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 5", function()
	PlayerTo(-276, 4, -147)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 6", function()
	PlayerTo(72, 4, -453)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 7", function()
	PlayerTo(40, 25, -21)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 8", function()
	PlayerTo(-146, 4, -233)
end)

Te_TeleToCheese:addButton("Teleport to Cheese 9", function()
	PlayerTo(-273, 4, -54)
end)



--[[------------------==
Map Modify Page
--]]------------------==
local MapPage = KRYGN:addPage("Map Modify", 6034684930)
--[[---
Lightning Section
-----]]
	local Ma_LightningSec = MapPage:addSection("Lightning Modifying")

Ma_LightningSec:addToggle("Full Bright", false, function(bool)
	if bool == true then
		game:GetService("Lighting").Brightness = 2
		game:GetService("Lighting").ClockTime = 14
		game:GetService("Lighting").FogEnd = 100000
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		
	else
		game:GetService("Lighting").Brightness = BRGHTNSS
		game:GetService("Lighting").ClockTime = CLCKTM
		game:GetService("Lighting").FogEnd = FGND
		game:GetService("Lighting").GlobalShadows = GLBLSHDWS
		game:GetService("Lighting").OutdoorAmbient = OTDRAMBNT
		
	end
end)


--[[------------------==
Miscellaneous Page
--]]------------------==
local MiscPage = KRYGN:addPage("Miscellaneous", 6034684930)
--[[---
Badge Giver Section
-----]]
	local Mi_BadgeGiverSec = MiscPage:addSection("Badge Giver")

Mi_BadgeGiverSec:addButton("Get \"You completed the game.\" Badge", function()
	local args = {
		[1] = 2124910071
	}

	game:GetService("ReplicatedStorage").Events.GiveBadge:FireServer(unpack(args))
end)

Mi_BadgeGiverSec:addButton("Get \"Bloxy Cola\" Badge", function()
	local args = {
		[1] = 2124910945
	}

	game:GetService("ReplicatedStorage").Events.GiveBadge:FireServer(unpack(args))
end)

Mi_BadgeGiverSec:addButton("Get \"Defeat The Rat\" Badge", function()
	local args = {
		[1] = 2124940134
	}

	game:GetService("ReplicatedStorage").Events.GiveBadge:FireServer(unpack(args))
end)

Mi_BadgeGiverSec:addButton("Get \"Wrong Cheese\" Badge", function()
	local args = {
		[1] = 2124940135
	}

	game:GetService("ReplicatedStorage").Events.GiveBadge:FireServer(unpack(args))	
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "GiveBadge",
		Text = "Unable to Give Badge due to unknown reason."
	})
end)

Mi_BadgeGiverSec:addButton("Get \"???\" Badge", function()
	local args = {
		[1] = 2124940136
	}

	game:GetService("ReplicatedStorage").Events.GiveBadge:FireServer(unpack(args))
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


Se_SettingsSec:addButton("Destroy Gui", function()
	if game:GetService("CoreGui"):FindFirstChild(GUI_Name) then
		if Noclipping then
			Noclipping:Disconnect()
		end
		
		game:GetService("Lighting").Brightness = BRGHTNSS
		game:GetService("Lighting").ClockTime = CLCKTM
		game:GetService("Lighting").FogEnd = FGND
		game:GetService("Lighting").GlobalShadows = GLBLSHDWS
		game:GetService("Lighting").OutdoorAmbient = OTDRAMBNT
		
		game:GetService("CoreGui")[GUI_Name]:Destroy()

	else
		KRYGN:Notify("Destroy Gui", "Unable to destroy the gui.")
		warn("[KorygonHub] : \"CANNOT FIND GUI\"")
	end
end)


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

KRYGN:SelectPage(KRYGN.pages[7], true)
