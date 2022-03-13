--[[--------------------------------------------------------------------------------------------------------------------------------------

███╗░░██╗██╗░██████╗░░██████╗░░█████╗░
████╗░██║██║██╔════╝░██╔════╝░██╔══██╗
██╔██╗██║██║██║░░██╗░██║░░██╗░███████║
██║╚████║██║██║░░╚██╗██║░░╚██╗██╔══██║
██║░╚███║██║╚██████╔╝╚██████╔╝██║░░██║
╚═╝░░╚══╝╚═╝░╚═════╝░░╚═════╝░╚═╝░░╚═╝

█▄█ █▀█ █░█   ▄▀█ █▀█ █▀▀   █▄░█ █▀█ ▀█▀   █▀ █░█ █▀█ █▀█ █▀█ █▀ █▀▀ █▀▄   ▀█▀ █▀█   █▀ █▀▀ █▀▀   ▀█▀ █░█ █ █▀
░█░ █▄█ █▄█   █▀█ █▀▄ ██▄   █░▀█ █▄█ ░█░   ▄█ █▄█ █▀▀ █▀▀ █▄█ ▄█ ██▄ █▄▀   ░█░ █▄█   ▄█ ██▄ ██▄   ░█░ █▀█ █ ▄█

----------------------------------------------------------------------------------------------------------------------------------------]]

if _G.CheckingAlready == nil then
	_G.CheckingAlready = true
else
	return 
end

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local RunService = game:GetService("RunService")

--[[--__--__--__--__--__--__--__--__--__
Library
--]]--__--__--__--__--__--__--__--__--__

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

--[[--__--__--__--__--__--__--__--__--__
Functions
--]]--__--__--__--__--__--__--__--__--__
local function FindPLR(name)
	for _, v in pairs(Players:GetPlayers()) do
		if name:lower() == (v.Name:lower()):sub(1, #name) then
			return v
		elseif name:lower() == (v.DisplayName:lower()):sub(1, #name) then
			return v
		end
	end
end

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

--[[--[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
Character Page
--]]--]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
local CharacterPage = DPIS:addPage("Character", 6034287594)
--[[
Main Section
--]]
	local MainSec = CharacterPage:addSection("Main")

MainSec:addButton("No Energy Drain", function()
	local getrawmt = getrawmetatable or (debug and debug.getmetatable)
	local setread = setreadonly or (make_writeable and function(table, readonly) if readonly then make_readonly(table) end  end)

	local mt = getrawmt(game)

	if mt then
		local old = mt.__namecall
		setread(mt, false)

		mt.__namecall = function(...)
			local method = getnamecallmethod() or get_namecall_method()
			local args = {...}
			if method == "FireServer" and args[2] == "Vagour" then
				return nil
			end
			return old(...)
		end


	else
		DPIS:Notify("No Energy Drain", "Unable to run the script because of your exploit limitation. Missing function : [getrawmetatable]")

	end
end)

MainSec:addButton("No Fall Damage", function()	
	local getrawmt = getrawmetatable or (debug and debug.getmetatable)
	local setread = setreadonly or (make_writeable and function(table, readonly) if readonly then make_readonly(table) end  end)

	local mt = getrawmt(game)

	if mt then
		local old = mt.__namecall
		setread(mt, false)

		mt.__namecall = function(...)
			local method = getnamecallmethod() or get_namecall_method()
			local args = {...}
			if method == "FireServer" and args[2] == "FallDamage" then
				return nil
			end
			return old(...)
		end


	else
		DPIS:Notify("No Fall Damage", "Unable to run the script because of your exploit limitation. Missing function : [getrawmetatable]")

	end
end)

MainSec:addButton("Disable Ragdolling", function()	
	local getrawmt = getrawmetatable or (debug and debug.getmetatable)
	local setread = setreadonly or (make_writeable and function(table, readonly) if readonly then make_readonly(table) end  end)

	local mt = getrawmt(game)

	if mt then
		local old = mt.__namecall
		setread(mt, false)

		mt.__namecall = function(...)
			local method = getnamecallmethod() or get_namecall_method()
			local args = {...}
			if method == "FireServer" and args[2] == "Ragdoll" then
				return nil
			end
			return old(...)
		end


	else
		DPIS:Notify("Disable Ragdolling", "Unable to run the script because of your exploit limitation. Missing function : [getrawmetatable]")

	end

end)

local WALKSLIDER

local already = false

WALKSLIDER = MainSec:addSlider("Change WalkSpeed", 16, .000001, 500, function(value)
	if value > 25 and not already then 
		value = 25 
	end

	if already == false then
		local getrawmt = (debug and debug.getmetatable) or getrawmetatable
		local setread = setreadonly or (make_writeable and function(table, readonly) if readonly then make_readonly(table) end  end)
		local protect = newcclosure or protect_function

		local gamemt = getrawmt(game)

		if gamemt then
			local old = gamemt.__index
			setread(gamemt, false)

			gamemt.__index = protect(function(Self, Self2)
				if Self:IsA("Humanoid") and string.lower(tostring(Self2)) == 'walkspeed' then
					return 0
				end
				return old(Self, Self2)
			end)
			setread(gamemt, true)

			already = true

		else
			already = false
		end
	end


	speaker.Character.Humanoid.WalkSpeed = value
end)

local JUMPOWER = MainSec:addSlider("Change JumpPower", 50, .000001, 500, function(value)
	speaker.Character.Humanoid.JumpPower = value
end)


--[[
Other Section
--]]
	local OtherSec = CharacterPage:addSection("Others")

OtherSec:addButton("Reset Character", function()
	speaker.Character:BreakJoints()
end)

local NOCLIP = OtherSec:addToggle("Noclip", false, function(bool)
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

OtherSec:addButton("Camera Noclip", function()
	--Credit to Infinite Yield
	local pop = speaker.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper

	local sc = (debug and debug.setconstant) or setconstant
	local gc = (debug and debug.getconstants) or getconstants

	if not sc or not getgc or not gc then
		return DPIS:Notify("Camera Noclip", "Unable to run the script because of your exploit limitation. Missing function : [getconstants or setconstant or getgc]")
	end

	for _, v in pairs(getgc()) do
		if type(v) == 'function' and getfenv(v).script == pop then
			for i, v1 in pairs(gc(v)) do
				if tonumber(v1) == .25 then
					sc(v, i, 0)
				elseif tonumber(v1) == 0 then
					sc(v, i, .25)
				end
			end
		end
	end

end)

OtherSec:addButton("Enable Chat", function()
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


--[[
Fun Section
--]]
	local FunSec = CharacterPage:addSection("Fun!")

FunSec:addButton("Become Green", function()
	if (firetouchinterest) then
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood CrateBlack"].Tuch, 0)
		wait(.1)
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood CrateBlack"].Tuch, 1)
	else
		DPIS:Notify("Becoming Green", "Unable to run the script because of your exploit limitation. Teleporting you to the CHANGER Instead. Missing function : [firetouchinterest]")
		PlayerTo(-4472, 411, 1018)
	end
end)

FunSec:addButton("Become Rock", function()
	if (firetouchinterest) then
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood CrateWhite"].Tuch, 0)
		wait(.1)
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood CrateWhite"].Tuch, 1)
	else
		DPIS:Notify("Become Rock", "Unable to run the script because of your exploit limitation. Teleporting you to the CHANGER Instead. Missing function : [firetouchinterest]")
		PlayerTo(-4472, 411, 1018)
	end
end)

FunSec:addButton("Become Pink", function()
	if (firetouchinterest) then
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood Crate"].Tuch, 0)
		wait(.1)
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Sanatorium["Wood Crate"].Tuch, 1)
	else
		DPIS:Notify("Become Pink", "Unable to run the script because of your exploit limitation. Teleporting you to the CHANGER Instead. Missing function : [firetouchinterest]")
		PlayerTo(-4472, 411, 1018)
	end
end)

--[[
Clothing Section
--]]
	local ClothingSec = CharacterPage:addSection("Clothing")

ClothingSec:addButton("Blue Uniform [Boy]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Parent.Name == "Outfit"  and v.Parent.Parent.Parent.Name == "Blue  Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

ClothingSec:addButton("Blue Uniform [Girl]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Name == "Torso"  and v.Parent.Parent.Parent.Name == "Blue  Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

ClothingSec:addButton("Teal Uniform [Boy]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Parent.Name == "Outfit"  and v.Parent.Parent.Parent.Name == "Teal Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

ClothingSec:addButton("Teal Uniform [Girl]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Name == "Torso"  and v.Parent.Parent.Parent.Name == "Teal Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

ClothingSec:addButton("Pink Uniform [Boy]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Parent.Name == "Outfit"  and v.Parent.Parent.Parent.Name == "Pink Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

ClothingSec:addButton("Pink Uniform [Girl]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Name == "Torso"  and v.Parent.Parent.Parent.Name == "Pink Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")
			end
		end
	end
end)

ClothingSec:addButton("Lavender Uniform [Boy]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Parent.Name == "Outfit"  and v.Parent.Parent.Parent.Name == "Lavender Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

ClothingSec:addButton("Lavender Uniform [Girl]", function()
	for _, v in pairs(game:GetService("Workspace").Givers:GetDescendants()) do
		if (v:IsA("ClickDetector")) and v.Parent.Name == "Torso"  and v.Parent.Parent.Parent.Name == "Lavender Uniform" then
			if (fireclickdetector) then
				fireclickdetector(v, 1)
			else
				DPIS:Notify("Clothing", "Unable to change your clothes because of your exploit limitation. Missing function : [firetouchinterest]")

			end
		end
	end
end)

--[[--[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
Map Page
--]]--]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
local MapPage = DPIS:addPage("Map Modify", 6034684930)
--[[
Map Section
--]]
	local MapSec = MapPage:addSection("Map Modifying")

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


--[[
Lightning Section
--]]
	local LightningSec = MapPage:addSection("Lightning Modifying")

local FULLBRIGHT = LightningSec:addToggle("Full Bright", false, function(bool)
	--Credit to Infinite Yield
	if bool == true then
		if BrightLoop then
			BrightLoop:Disconnect()
		end
		
		local function LightLooping()
			game:GetService("Lighting").Brightness = 2
			game:GetService("Lighting").ClockTime = 14
			game:GetService("Lighting").FogEnd = 100000
			game:GetService("Lighting").GlobalShadows = false
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end
		
		BrightLoop = RunService.RenderStepped:Connect(LightLooping)

	else
		if BrightLoop then
			BrightLoop:Disconnect()
			wait(.1)
		end
		
		game:GetService("Lighting").Brightness = brightness
		game:GetService("Lighting").FogEnd = fogEnd
		game:GetService("Lighting").GlobalShadows = shadows
		game:GetService("Lighting").OutdoorAmbient = ambient

	end
end)

LightningSec:addToggle("No Blurs", true, function(bool)
	if bool == true then
		game:GetService("Lighting").PanicColor.Enabled = false
		game:GetService("Lighting").PanicBlur.Enabled = false
		game:GetService("Lighting").Blur.Enabled = false
		
	else
		game:GetService("Lighting").PanicColor.Enabled = true
		game:GetService("Lighting").PanicBlur.Enabled = true
		game:GetService("Lighting").Blur.Enabled = true
		
	end
end)

LightningSec:addToggle("No Raining", true, function(bool)
	if bool == true then
		game:GetService("ReplicatedStorage").Server.Rain.Value = false
	else
		game:GetService("ReplicatedStorage").Server.Rain.Value = true
	end
end)

LightningSec:addToggle("Turn on/off Sanatorium Light (LAGGY)", false, function(bool)
	if bool == true then
		for _, v in pairs(game:GetService("Workspace")["Sanatorium Lights"]:GetDescendants()) do
			if (v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight")) then
				v.Enabled = true
			end
		end
	else
		for _, v in pairs(game:GetService("Workspace")["Sanatorium Lights"]:GetDescendants()) do
			if (v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight")) then
				v.Enabled = false
			end
		end
	end
end)


--[[--[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
Teleportation Page
--]]--]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
local TeleportPage = DPIS:addPage("Teleportation", 6035190846)
--[[
Teleport Player Section
--]]
	local TPlayerSec = TeleportPage:addSection("Teleport to Player")

TPlayerSec:addTextbox("Teleport To Player", "USERNAME", function(value, focusLost)
	if focusLost then
		local target = FindPLR(value)
		if target then
			speaker.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
		end
	end
end)


--[[
Teleport Place (Inside) Section
--]]
	local TeleSec = TeleportPage:addSection("Teleport To Places (Inside)")

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


--[[
Teleport Place (Inside) Section
--]]
	local TeleSec2 = TeleportPage:addSection("Teleport To Places (Outside)")

TeleSec2:addButton("Cafeteria (Outside)", function()
	PlayerTo(-2933, 129, -111)
end)

TeleSec2:addButton("Stage (Outside)", function()
	PlayerTo(-2974, 149, 85)
end)

--[[
Teleport Secret Place Section
--]]
	local TeleSec3 = TeleportPage:addSection("Teleport To Secret Places")

TeleSec3:addButton("Teleport to Green Changer Crate", function()
	PlayerTo(-4472, 411, 1018)
end)

TeleSec3:addButton("Teleport to Rock Changer Crate", function()
	PlayerTo(-4001, 411, 1137)
end)

TeleSec3:addButton("Teleport to Pink Changer Crate", function()
	PlayerTo(-4710, 62, 1505)
end)

--[[
Teleport Nearest Section
--]]
	local NearSec = TeleportPage:addSection("Teleport To The Nearest")

local succesteleport = false

NearSec:addButton("Teleport To The Nearest Melon Fruit (Outside)", function()
	for _, v in pairs(game:GetService("Workspace").QweerialTrees:GetDescendants()) do
		if v.Name == "Stem" and succesteleport == false then
			local Dist = (speaker.Character.HumanoidRootPart.Position - v.Position).Magnitude
			
			if Dist < 100 then
				PlayerTo(v.CFrame.X, v.CFrame.Y + 2, v.CFrame.Z)
				succesteleport = true
			elseif Dist > 100 and Dist <= 200 then
				succesteleport = true
				PlayerTo(v.CFrame.X, v.CFrame.Y + 2, v.CFrame.Z)
				succesteleport = true
			elseif Dist > 200 and Dist <= 300 then
				PlayerTo(v.CFrame.X, v.CFrame.Y + 2, v.CFrame.Z)
				succesteleport = true
			elseif Dist > 300 and Dist <= 380 then
				PlayerTo(v.CFrame.X, v.CFrame.Y + 2, v.CFrame.Z)
				succesteleport = true
			end
		end
	end
	
	if succesteleport == false then
		DPIS:Notify("Teleport To The Nearest Melon Fruit", "There is no nearby melon fruit trees outside")
	end
	
	succesteleport = false
end)


--[[--[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
Miscellaneous Page
--]]--]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
local MiscPage = DPIS:addPage("Misc", 6034509993)
--[[
Items Section
--]]
	local ItemSec = MiscPage:addSection("Items")

ItemSec:addButton("Send tools to storage", function()
	for _, v in pairs(speaker.Backpack:GetChildren()) do
		if (v:IsA("Tool")) then
			v.Parent = speaker
		end
	end
end)

ItemSec:addButton("Get tools back", function()
	for _, v in pairs(speaker:GetChildren()) do
		if (v:IsA("Tool")) then
			v.Parent = speaker.Backpack
		end
	end
end)


--[[
Others Section 2
--]]
	local MiscSec = MiscPage:addSection("Others")

local FPSCAP

FPSCAP = MiscSec:addSlider("Set Fps Cap", 60, 5, 350, function(value)
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

MiscSec:addButton("Launch Infinite Yield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MiscSec:addButton("Launch CMD - X", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

MiscSec:addButton("Panic Mode", function()
	MainSec:updateSlider(WALKSLIDER, "Change WalkSpeed", 16, .000001, 25)
	speaker.Character.Humanoid.WalkSpeed = 16

	MainSec:updateSlider(JUMPOWER, "Change JumpPower", 50, .000001, 500)
	speaker.Character.Humanoid.JumpPower = 50

	OtherSec:updateToggle(NOCLIP, "Noclip", false)
	if NoClipper then
		NoClipper:Disconnect()
		NoClipper = nil
	end

	MapSec:updateToggle(NODOORS, "No Doors", false)
	if game:GetService("Lighting"):FindFirstChild("Interactables") then
		game.Lighting.Interactables.Parent = game:GetService("Workspace")
	end

	LightningSec:updateToggle(FULLBRIGHT, "Full Bright", false)
	if BrightLoop then
		BrightLoop:Disconnect()
		wait(.1)
	end
	
	game:GetService("Lighting").Brightness = brightness
	game:GetService("Lighting").FogEnd = fogEnd
	game:GetService("Lighting").GlobalShadows = shadows
	game:GetService("Lighting").OutdoorAmbient = ambient
	
	game:GetService("Lighting").PanicColor.Enabled = true
	game:GetService("Lighting").PanicBlur.Enabled = true
	game:GetService("Lighting").Blur.Enabled = true
	
	MapSec:updateToggle(NOWALLS, "No Invisible Walls", false)
	if game:GetService("Lighting"):FindFirstChild("RankBarriers") then 
		game.Lighting.RankBarriers.Parent = game:GetService("Workspace")
	end

end)

--[[
Guis Section
--]]
	 GuiSec = MiscPage:addSection("Game UIs")

GuiSec:addButton("Open TrashBin Gui", function()
	if (firetouchinterest) then
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Trashcan["Trash Can"].BinHitbox, 0)
		wait(.05)
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Trashcan["Trash Can"].BinHitbox, 1)
		
	else
		DPIS:Notify("Open TrashBin Gui", "Unable to open Gui because of your exploit limitation. Missing function : [firetouchinterest]")
	end
end)

GuiSec:addButton("Open Shop", function()
	if (firetouchinterest) then
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Shops["Holy Shop"].ShopTouch, 0)
		wait(.05)
		firetouchinterest(speaker.Character.HumanoidRootPart, game:GetService("Workspace").Shops["Holy Shop"].ShopTouch, 1)

	else
		DPIS:Notify("Open Shop", "Unable to open Gui because of your exploit limitation. Missing function : [firetouchinterest]")
	end
end)



--[[--[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
Settings Page
--]]--]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
local SettingsPage = DPIS:addPage("Settings", 6031280882)

--[[
Gui Settings Section
--]]
	local SettingSec = SettingsPage:addSection("Gui Settings")

SettingSec:addKeybind("Toggle GUI", Enum.KeyCode.RightControl, function()
	DPIS:toggle()
end, function() end)

SettingSec:addButton("Destroy GUI", function()
	DPIS:Notify("Destroy GUI", "Are you sure you want to destroy the gui?", function(accept)
		if accept then
			_G.CheckingAlready = nil

			if (setfpscap) then
				setfpscap(60)
			end

			MainSec:updateSlider(WALKSLIDER, "Change WalkSpeed", 16, .000001, 25)
			speaker.Character.Humanoid.WalkSpeed = 16

			MainSec:updateSlider(JUMPOWER, "Change JumpPower", 50, .000001, 500)
			speaker.Character.Humanoid.JumpPower = 50

			OtherSec:updateToggle(NOCLIP, "Noclip", false)
			if NoClipper then
				NoClipper:Disconnect()
				NoClipper = nil
			end

			MapSec:updateToggle(NODOORS, "No Doors", false)
			if game:GetService("Lighting"):FindFirstChild("Interactables") then
				game.Lighting.Interactables.Parent = game:GetService("Workspace")
			end

			LightningSec:updateToggle(FULLBRIGHT, "Full Bright", false)
			game:GetService("Lighting").Brightness = brightness
			game:GetService("Lighting").FogEnd = fogEnd
			game:GetService("Lighting").GlobalShadows = shadows
			game:GetService("Lighting").OutdoorAmbient = ambient
			
			game:GetService("Lighting").PanicColor.Enabled = true
			game:GetService("Lighting").PanicBlur.Enabled = true
			game:GetService("Lighting").Blur.Enabled = true
			
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


--[[
Theme Changer Section
--]]
	local ThemeSec = SettingsPage:addSection("Theme Changer")

for theme, color in pairs(themes) do
	ThemeSec:addColorPicker(theme, color, function(color3)
		DPIS:setTheme(theme, color3)
	end)
end


--[[--[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
Settings Page
--]]--]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
local CreditPage = DPIS:addPage("Credit", 6023565898)
--[[
Credits Section
--]]
	local CreditSec = CreditPage:addSection("Special")

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
--[[
Credits Section
--]]
	local CreditSec = CreditPage:addSection("Credits")

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

--------------
DPIS:Notify("WARNING!", "I am not responsible if you got banned. Use at your own risk!")

DPIS:SelectPage(DPIS.pages[6], true)

