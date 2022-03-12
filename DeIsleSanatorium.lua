local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local RunService = game:GetService("RunService")

print("Checking if running")

--[[--__--__--__--__--__--__--__--__--__
Library
--]]--__--__--__--__--__--__--__--__--__
if _G.CheckingAlready == nil then
	_G.CheckingAlready = true
else
	return 
end

brightness = game:GetService("Lighting").Brightness
fogEnd = game:GetService("Lighting").FogEnd
shadows = game:GetService("Lighting").GlobalShadows
ambient = game:GetService("Lighting").OutdoorAmbient

local function PlayerTo(x, y, z)
	local new = CFrame.new(x, y, z)

	speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	wait(.05)
	speaker.Character.HumanoidRootPart.CFrame = new
end

local LibName = "KorygonHub | De Isle Sanatorium"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local DPIS = Library.new(LibName, 5013109572)

local CharacterPage = DPIS:addPage("Character", 6034287594)
local MapPage = DPIS:addPage("Map Modify", 6034684930)
local TeleportPage = DPIS:addPage("Teleport", 6035190846)
local MiscPage = DPIS:addPage("Misc", 6034509993)
local SettingsPage = DPIS:addPage("Settings", 6031280882)
local CreditPage = DPIS:addPage("Credit", 6023565898)

local CharSec = CharacterPage:addSection("Character")
local MapSec = MapPage:addSection("Map Modifying")
local TeleSec = TeleportPage:addSection("Teleportation")
local MiscSec = MiscPage:addSection("Miscellaneous")
local CreditSec = CreditPage:addSection("Credits")
local SettingSec = SettingsPage:addSection("Settings")

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}


DPIS:Notify("WARNING!", "I am not responsible if you get banned. Use at your own risk!")

--[[--==--==--==--==
Actions
--]]--==--==--==--==
--[[--[[[[[[
Character
--]]--]]]]]]
CharSec:addButton("Infinite Stamina", function()
	if (getrawmetatable and setreadonly and getnamecallmethod or get_namecall_method and setreadonly and getrawmetatable) then 
		local mt = getrawmetatable(game)
		setreadonly(mt,false)

		local old = mt.__namecall

		mt.__namecall = function(...)
			local method= getnamecallmethod() or get_namecall_method()
			local args = {...}
			if method == "FireServer" and args[2] == "Vagour" then
				return nil
			end
			return old(...)
		end

	else
		DPIS:Notify("Infinite Stamina", "Your exploit software is not supported")
	end
end)

CharSec:addButton("No Fall Damage", function()
	if (getrawmetatable and setreadonly and getnamecallmethod or get_namecall_method and setreadonly and getrawmetatable) then 
		local mt = getrawmetatable(game)
		setreadonly(mt,false)

		local old = mt.__namecall

		mt.__namecall = function(...)
			local method= getnamecallmethod() or get_namecall_method()
			local args = {...}
			if method == "FireServer" and args[2] == "FallDamage" then
				return nil
			end
			return old(...)
		end
		
	else
		DPIS:Notify("No Fall Damage", "Your exploit software is not supported")
	end
end)

CharSec:addButton("Disable Ragdolling", function()
	if (getrawmetatable and setreadonly and getnamecallmethod or get_namecall_method and setreadonly and getrawmetatable) then
		local mt = getrawmetatable(game)
		setreadonly(mt,false)

		local old = mt.__namecall

		mt.__namecall = function(...)
			local method= getnamecallmethod() or get_namecall_method()
			local args = {...}
			if method == "FireServer" and args[2] == "Ragdoll" then
				return nil
			end
			return old(...)
		end

		speaker.Character.Ragdoll:Destroy()
		
	else
		DPIS:Notify("Disable Ragdolling", "Your exploit software is not supported")
		
	end
end)

local NOCLIP = CharSec:addToggle("Noclip", false, function(bool)
	if bool == true then
		local function NoClipFunc()
			if speaker.Character ~= nil then
				for _, child in pairs(speaker.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true then
						child.CanCollide = false
					end
				end
			end
		end

		NoClipper = RunService.Stepped:Connect(NoClipFunc)
		
	else
		if NoClipper then
			NoClipper:Disconnect()
			NoClipper = nil
		end
		
	end
end)


CharSec:addButton("Enable Chat", function()
	enabled = false

	spyOnMyself = false

	public = false

	publicItalics = false

	privateProperties = {
		Color = Color3.fromRGB(0,255,255); 
		Font = Enum.Font.SourceSansBold;
		TextSize = 18;
	}

	local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local player = speaker or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
	local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
	local instance = (_G.chatSpyInstance or 0) + 1
	_G.chatSpyInstance = instance

	local function onChatted(p,msg)
		if _G.chatSpyInstance == instance then
			if p==player and msg:lower():sub(1,6)=="/e spy" then
				enabled = not enabled
				wait(0.3)
				privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
				StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
			elseif enabled and (spyOnMyself==true or p~=player) then
				msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
				local hidden = true
				local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
					if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
						hidden = false
					end
				end)
				wait(1)
				conn:Disconnect()
				if hidden and enabled then
					if public then
						saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
					else
						privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
						StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
					end
				end
			end
		end
	end

	for _,p in ipairs(Players:GetPlayers()) do
		p.Chatted:Connect(function(msg) onChatted(p,msg) end)
	end
	Players.PlayerAdded:Connect(function(p)
		p.Chatted:Connect(function(msg) onChatted(p,msg) end)
	end)
	privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
	player:WaitForChild("PlayerGui"):WaitForChild("Chat")
	StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
	wait(3)
	local chatFrame = player.PlayerGui.Chat.Frame
	chatFrame.ChatChannelParentFrame.Visible = true
	chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
end)

local WALKSLIDER

WALKSLIDER = CharSec:addSlider("Change WalkSpeed", 16, .000001, 25, function(value)
	if value > 25 then 
		value = 25 
		CharSec:updateSlider(WALKSLIDER, "Change WalkSpeed", 25, .000001, 25)
	end
	
	speaker.Character.Humanoid.WalkSpeed = value
end)

local JUMPOWER = CharSec:addSlider("Change JumpPower", 50, .000001, 500, function(value)
	speaker.Character.Humanoid.JumpPower = value
end)

CharSec:addButton("Becoming Green", function()
	if (firetouchinterest) then
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood CrateBlack"].Tuch, 0)
		wait(.1)
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood CrateBlack"].Tuch, 1)
	else
		DPIS:Notify("Becoming Green", "Your exploit software is not supported. Teleporting you to the CHANGER instead.")
		PlayerTo(-4472, 411, 1018)
	end
end)

--[[--[[[[[[
Map Modifying
--]]--]]]]]]
local NODOORS = MapSec:addToggle("No Doors", false, function(bool)
	if bool == true then
		if not game:GetService("Workspace"):FindFirstChild("Interactables") then return end
		workspace.Interactables.Parent = game:GetService("Lighting")
	else
		if not game:GetService("Lighting"):FindFirstChild("Interactables") then return end
		game.Lighting.Interactables.Parent = game:GetService("Workspace")
	end
end)

local NOWALLS = MapSec:addToggle("No Invisible Walls", false, function(bool)
	if bool == true then
		if not game:GetService("Workspace"):FindFirstChild("RankBarriers") then return end
		workspace.RankBarriers.Parent = game:GetService("Lighting")
	else
		if not game:GetService("Lighting"):FindFirstChild("RankBarriers") then return end
		game.Lighting.RankBarriers.Parent = game:GetService("Workspace")
	end
end)

local FULLBRIGHT = MapSec:addToggle("Full Bright", false, function(bool)
	--Credit to Infinite Yield
	if bool == true then
		game:GetService("Lighting").Brightness = 2
		game:GetService("Lighting").ClockTime = 14
		game:GetService("Lighting").FogEnd = 100000
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		
	else
		game:GetService("Lighting").Brightness = brightness
		game:GetService("Lighting").FogEnd = fogEnd
		game:GetService("Lighting").GlobalShadows = shadows
		game:GetService("Lighting").OutdoorAmbient = ambient

	end
end)


--[[--[[[[[[
Teleportation
--]]--]]]]]]

local function FindPLR(name)
	for _, v in pairs(Players:GetPlayers()) do
		if name:lower() == (v.Name:lower()):sub(1, #name) then
			return v
		elseif name:lower() == (v.DisplayName:lower()):sub(1, #name) then
			return v
		end
	end
end


TeleSec:addTextbox("Teleport To Player", "USERNAME", function(value, focusLost)
	if focusLost then
		local target = FindPLR(value)
		if target then
			speaker.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
		end
	end
end)

TeleSec:addButton("INSIDE =", function()
	DPIS:Notify("Teleportation", "This is just a label")
end)

TeleSec:addButton("Teleport to The Sanatorium", function()
	PlayerTo(-4228, 406, 1016)
end)

TeleSec:addButton("Teleport to Infront of The Sanatorium", function()
	PlayerTo(-4217, 407, 945)
end)

TeleSec:addButton("Teleport to The Clock", function()
	PlayerTo(-4246, 442, 1114)
end)

TeleSec:addButton("Teleport to The Cafeteria", function()
	PlayerTo(-4058, 442, 1057)
end)

TeleSec:addButton("Teleport to The Changing Room", function()
	PlayerTo(-4185, 406, 1002)
end)

TeleSec:addButton("Teleport to The Dorms", function()
	PlayerTo(-4170, 416, 1066)
end)

TeleSec:addButton("Teleport to The Melon Tree", function()
	PlayerTo(-4398, 454, 1035)
end)

TeleSec:addButton("Teleport to The Chapel", function()
	PlayerTo(-4141, 480, 1040)
end)

TeleSec:addButton("Teleport to The Lecture Hall", function()
	PlayerTo(-4451, 442, 1070)
end)

TeleSec:addButton("Teleport to The Backyard", function()
	PlayerTo(-4357, 416, 1105)
end)

TeleSec:addButton("Teleport to The Bunker", function()
	PlayerTo(-4439, 416, 1022)
end)

TeleSec:addButton("Teleport to The Isolation Room", function()
	PlayerTo(-4072, 442, 1154)
end)

TeleSec:addButton("Teleport to The Closet", function()
	PlayerTo(-4147, 479, 1171)
end)

TeleSec:addButton("Teleport to The Unholy Room", function()
	PlayerTo(-4379, 416, 1053)
end)

TeleSec:addButton("OUTSIDE =", function()
	DPIS:Notify("Teleportation", "This is just a label")
end)

TeleSec:addButton("Cafeteria (Outside)", function()
	PlayerTo(-2933, 129, -111)
end)

TeleSec:addButton("Stage (Outside)", function()
	PlayerTo(-2974, 149, 85)
end)

TeleSec:addButton("SECRETS =", function()
	DPIS:Notify("Teleportation", "This is just a label")
end)

TeleSec:addButton("Become Green Crate", function()
	PlayerTo(-4472, 411, 1018)
end)



--[[--[[[[[[
Misc
--]]--]]]]]]
MiscSec:addButton("Panic Mode", function()
	CharSec:updateSlider(WALKSLIDER, "Change WalkSpeed", 16, .000001, 25)
	speaker.Character.Humanoid.WalkSpeed = 16
	
	CharSec:updateSlider(JUMPOWER, "Change JumpPower", 50, .000001, 500)
	speaker.Character.Humanoid.JumpPower = 50
	
	CharSec:updateToggle(NOCLIP, "Noclip", false)
	if NoClipper then
		NoClipper:Disconnect()
		NoClipper = nil
	end
		
	MapSec:updateToggle(NODOORS, "No Doors", false)
	if game:GetService("Lighting"):FindFirstChild("Interactables") then
		game.Lighting.Interactables.Parent = game:GetService("Workspace")
	end
	
	MapSec:updateToggle(FULLBRIGHT, "Full Bright", false)
	game:GetService("Lighting").Brightness = brightness
	game:GetService("Lighting").FogEnd = fogEnd
	game:GetService("Lighting").GlobalShadows = shadows
	game:GetService("Lighting").OutdoorAmbient = ambient
	
	MapSec:updateToggle(NOWALLS, "No Invisible Walls", false)
	if game:GetService("Lighting"):FindFirstChild("RankBarriers") then 
		game.Lighting.RankBarriers.Parent = game:GetService("Workspace")
	end
	
end)

MiscSec:addButton("Launch Infinite Yield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local FPSCAP

FPSCAP = MiscSec:addSlider("Set Fps Cap", 60, 5, 5000, function(value)
	if (setfpscap) then
		if value > 5000 then
			value = 5000
			MiscSec:updateSlider(FPSCAP, "Set Fps Cap", 5000, 5, 5000)
		elseif value < 5 then
			value = 5
			MiscSec:updateSlider(FPSCAP, "Set Fps Cap", 5, 5, 5000)
		end
		
		setfpscap(value)
	end
end)

MiscSec:addKeybind("Toggle GUI", Enum.KeyCode.RightControl, function()
	DPIS:toggle()
end, function() end)

MiscSec:addButton("Destroy GUI", function()
	DPIS:Notify("Destroy GUI", "Are you sure you want to destroy the gui?", function(accept)
		if accept then
			_G.CheckingAlready = nil
			
			if (setfpscap) then
				setfpscap(60)
			end
			
			CharSec:updateSlider(WALKSLIDER, "Change WalkSpeed", 16, .000001, 25)
			speaker.Character.Humanoid.WalkSpeed = 16

			CharSec:updateSlider(JUMPOWER, "Change JumpPower", 50, .000001, 500)
			speaker.Character.Humanoid.JumpPower = 50

			CharSec:updateToggle(NOCLIP, "Noclip", false)
			if NoClipper then
				NoClipper:Disconnect()
				NoClipper = nil
			end

			MapSec:updateToggle(NODOORS, "No Doors", false)
			if game:GetService("Lighting"):FindFirstChild("Interactables") then
				game.Lighting.Interactables.Parent = game:GetService("Workspace")
			end

			MapSec:updateToggle(FULLBRIGHT, "Full Bright", false)
			game:GetService("Lighting").Brightness = brightness
			game:GetService("Lighting").FogEnd = fogEnd
			game:GetService("Lighting").GlobalShadows = shadows
			game:GetService("Lighting").OutdoorAmbient = ambient

			MapSec:updateToggle(NOWALLS, "No Invisible Walls", false)
			if game:GetService("Lighting"):FindFirstChild("RankBarriers") then 
				game.Lighting.RankBarriers.Parent = game:GetService("Workspace")
			end
			
			if game:GetService("CoreGui"):FindFirstChild(LibName) then
				game:GetService("CoreGui")[LibName]:Destroy()
			end
			
		end
	end)
end)


--[[--[[[[[[
Settings
--]]--]]]]]]
for theme, color in pairs(themes) do
	SettingSec:addColorPicker(theme, color, function(color3)
		DPIS:setTheme(theme, color3)
	end)
end



--[[--[[[[[[
Credits
--]]--]]]]]]
CreditSec:addButton("UI = Venyx Ui", function()
	DPIS:Notify("Credits", "Do you want to copy the link to the Venyx Ui?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard("https://v3rmillion.net/showthread.php?tid=1026479")
			else
				DPIS:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)

CreditSec:addButton("Main Scripter = UVIntake#0236", function()
	DPIS:Notify("Credits", "Do you want to copy the discord name?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard("UVIntake#0236")
			else
				DPIS:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)

CreditSec:addButton("Scripter = !Irlng#6325", function()
	DPIS:Notify("Credits", "Do you want to copy the discord name?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard("!Irlng#6325")
			else
				DPIS:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)

CreditSec:addButton("Script Tester = " .. tostring(speaker.Name), function()
	DPIS:Notify("Credits", "Hey that's you!. Did you want to copy your own username?", function(accept)
		if accept then
			if (setclipboard) then
				setclipboard(tostring(speaker.Name))
			else
				DPIS:Notify("Credits", "Unable to copy the link because of your exploit limitation.")
			end
		end
	end)
end)

DPIS:SelectPage(DPIS.pages[6], true)
