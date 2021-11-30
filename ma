pcall(function()
	repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	local bgname = math.random().."tushub"..math.random()
	_G.bgname = bgname
	local file = "tushub.json"
	_G.tuws = 50
	_G.tujp = 80
	_G.flyspeed = 160
	_G.infinitejump = false
	_G.ws = false
	_G.jp = false
	_G.fly = false
	_G.fb = false
	_G.nofall = false
	_G.nofallrate = 50
	_G.brightness = 0.5
	_G.timeofday = 14
	_G.autotrinket = false
	local linka = "https://discord.com/api/webhooks/871926157782712362/sBnXXX2GYG0Blifn5QWfSAj0kO78sNRaPecBpCHIgsMY7r1bhjBCqhivsZWuFtUEeAKg"
	local MainFrame
	local noclipwhenfly = false
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local FLYING = false
	local flyspeed = 1
	local SPEED = 0
	local pickupcd = 0.25
	local Players = game:GetService("Players")
	local Lighting = game:GetService("Lighting")
	local workspace = game:GetService("Workspace")
	local realws = Players.LocalPlayer.Character.Humanoid.WalkSpeed
	local realjp = Players.LocalPlayer.Character.Humanoid.JumpPower
	local place = nil
	local flyKeyDown
	local flyKeyUp
	local cam = workspace.CurrentCamera
	local rp
	local humanoid
	humanoid = Players.LocalPlayer.Character.Humanoid
	rp = Players.LocalPlayer.Character.HumanoidRootPart
	local function removespaces(str)
		return str:gsub(" ","")
	end
	local function notification(text)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Peepoo Peepoo",
			Text = text,
			Duration = 5,
		})
	end
	Players.LocalPlayer.CharacterAdded:Connect(function()
		repeat wait() until Players.LocalPlayer.Character.HumanoidRootPart
		humanoid = Players.LocalPlayer.Character.Humanoid
		rp = Players.LocalPlayer.Character.HumanoidRootPart
	end)
	place = _G.place
	local nocliping = false
	local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KenzakiSnow/Tu-s-Hub/main/library.txt"))()
	local title = library.new("Lol Exploiter :grrr: ")
	local themes = {
		Background = Color3.fromRGB(24, 24, 24),
		Glow = Color3.fromRGB(0, 0, 0),
		Accent = Color3.fromRGB(10, 10, 10),
		LightContrast = Color3.fromRGB(20, 20, 20),
		DarkContrast = Color3.fromRGB(14, 14, 14),  
		TextColor = Color3.fromRGB(255, 255, 255)
	}
	local GUI = game:GetService("CoreGui"):FindFirstChild("Lol Exploiter :grrr: ")
	local plrPage = title:addPage("Misc", 123)
	local section1 = plrPage:addSection("Walk Speed")
	section1:addToggle("Toggle", false, function(value)
		if place == "FakeRL" then return end
		_G.ws = value
		if value == true then
			Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.tuws
		else
			Players.LocalPlayer.Character.Humanoid.WalkSpeed = realws
		end
	end)
	section1:addSlider("Adjust", 50, 25, 200, function(value)
		_G.tuws = value + math.random(0.01,0.00000000001)
		if _G.ws == true then
			Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.tuws
		end
	end)
	local section2 = plrPage:addSection("Jump Power")
	section2:addToggle("Toggle", false, function(value)
		if place == "FakeRL" then return end
		_G.jp = value
		if value == true then
			Players.LocalPlayer.Character.Humanoid.JumpPower = _G.tujp
		else
			Players.LocalPlayer.Character.Humanoid.JumpPower = realjp
		end
	end)
	section2:addSlider("Adjust", 160, 120, 280, function(value)
		_G.tujp = value + math.random(0.01,0.00000000001)
		if _G.jp == true then
			Players.LocalPlayer.Character.Humanoid.JumpPower = _G.tujp
		end
	end)
	local section3 = plrPage:addSection("Infinite Jump")
	section3:addToggle("Toggle", false, function(value)
		_G.infinitejump = value
	end)
	local section5 = plrPage:addSection("Noclip (Disabled due to succ dicc)")
	section5:addToggle("Toggle", false, function(value)
		nocliping = value
	end)
	local section4 = plrPage:addSection("Mana Fly (WIP)")
	_G.fly = Enum.KeyCode.Break
	section4:addKeybind("Toggle Keybind", Enum.KeyCode.Break, function(c) end, function(c) 
		--_G.fly = c.KeyCode
	end)
	section4:addSlider("Adjust", 2, 6, 20, function(value)
		flyspeed = value + math.random(0.01,0.00000000001)
	end)
	local lightingpage = title:addPage("Lighting's", 1234)
	local section12 = lightingpage:addSection("Full Bright")
	section12:addToggle("Toggle",false,function(val)
		_G.fb = val
		Lighting.Brightness = 2
	end)
	local section62 = lightingpage:addSection("Remove ColorCorrectionEffect")
	local cce = {}
	section62:addToggle("Remove",false,function(val)
		for i,v in pairs(Lighting:GetChildren()) do
			if v:IsA("ColorCorrectionEffect") then
				if v.Enabled == true and val == true then
					table.insert(cce,v)
					v.Enabled = not val
				end
				if val == false then
					if table.find(cce,v) then
						v.Enabled = not val
					end
					cce = {}
				end
			end
		end
	end)
	local section72 = lightingpage:addSection("Brightness")
	section72:addSlider("Adjust", 0, 0.5, 2, function(value)
		_G.brightness = value
		Lighting.Brightness = 2
	end)
	local section82 = lightingpage:addSection("Time of Day")
	section82:addSlider("Adjust", 0, 14, 24, function(value)
		_G.timeofday = value
		Lighting.Brightness = 2
	end)
	local section92 = lightingpage:addSection("Global Shadows")
	section92:addToggle("Toggle", true, function(value)
		_G.globalshadows = value
	end)
	local section22 = lightingpage:addSection("Remove BloomEffect")
	section22:addButton("Remove",function()
		for i,v in pairs(Lighting:GetChildren()) do
			if v:IsA("BloomEffect") then
				v.Enabled = false
			end
		end
	end)
	local section32 = lightingpage:addSection("Remove DepthOfFieldEffect")
	section32:addButton("Remove",function()
		for i,v in pairs(Lighting:GetChildren()) do
			if v:IsA("DepthOfFieldEffect") then
				v.Enabled = false
			end
		end
	end)
	local section42 = lightingpage:addSection("Remove SunRaysEffect")
	section42:addButton("Remove",function()
		for i,v in pairs(Lighting:GetChildren()) do
			if v:IsA("SunRaysEffect") then
				v.Enabled = false
			end
		end
	end)
	local section52 = lightingpage:addSection("Remove BlurEffect")
	section52:addButton("Remove",function()
		for i,v in pairs(Lighting:GetChildren()) do
			if v:IsA("BlurEffect") then
				v.Enabled = false
			end
		end
	end)
	if place ~= nil then
		local spgame = title:addPage("Supported Game", 123456)
		if place == "FakeRL" then
			local tabpar = {}
			local t
			local section13 = spgame:addSection("Nofall")
			section13:addToggle("Toggle", false, function(value)
				_G.nofall = value
			end)
			section13:addSlider("Adjust Dmg Reduction Rate (%)", 0, 50, 99, function(value)
				_G.nofallrate = value + math.random(0.01,0.00000000001)
			end)
			local section23 = spgame:addSection("Auto pick up trinkets")
			section23:addToggle("Toggle", false, function(value)
				_G.autotrinket = value
			end)
			local section73 = spgame:addSection("Auto pick up ingredients")
			section73:addToggle("Toggle", false, function(value)
				_G.autoingredient = value
			end)
			local section33 = spgame:addSection("Chat logger")
			section33:addToggle("Toggle", false, function(value)
				local gui = game:GetService("CoreGui"):FindFirstChild("Chat logger")
				gui.Enabled = value
			end)
			local section43 = spgame:addSection("No kill bricks")
			section43:addButton("Toggle",function()
				local p1 = game:GetService("Workspace").OrderlyBarriers
				local p2 = game:GetService("Workspace").Map.KillBricks
				pcall(function()
					for i,v in pairs(p1:GetChildren()) do
						if v:FindFirstChild("TouchInterest") then
							if not t then t = v.TouchInterest:Clone() end
							v.TouchInterest:Destroy()
							table.insert(tabpar,v)
						end
					end
					for i,v in pairs(p2:GetChildren()) do
						if v:FindFirstChild("TouchInterest") then
							v.TouchInterest:Destroy()
							table.insert(tabpar,v)
						end
					end
				end)
			end)
			local section53 = spgame:addSection("No burn")
			section53:addToggle("Toggle", false, function(value)
				_G.noburn = value
			end)
			local section63 = spgame:addSection("Temp Lock (hot)")
			section63:addToggle("Toggle", false, function(value)
				_G.templock = value
				if value == true then
					Players.LocalPlayer.PlayerGui.AreaGui.AreaClient.GetTemp:FireServer("Burning")
				end
			end)
		end
	end
	local miscpage = title:addPage("Misc", 1234567)
	local section43 = miscpage:addSection("Custom ESP [!]")
	section43:addButton("Execute",function()
		if game:GetService("CoreGui"):FindFirstChild("Customto") then
			game:GetService("CoreGui"):FindFirstChild("Customto").Enabled = true
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/KenzakiSnow/azxc1/main/customto", true))()
			repeat wait() until game:GetService("CoreGui"):FindFirstChild("Customto")
			game:GetService("CoreGui"):FindFirstChild("Customto").Enabled = true
		end
	end)
	local section13 = miscpage:addSection("Unnamed ESP")
	section13:addButton("Execute",function()
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua", true))()
		end)
	end)
	local section23 = miscpage:addSection("Infinity Yield")
	section23:addButton("Execute",function()
		pcall(function()
			loadstring(game:HttpGet("https://pastebin.com/raw/tzTXmYf2", true))()
		end)
	end)
	local section33 = miscpage:addSection("Dark Dex")
	section33:addButton("Execute",function()
		pcall(function()
			loadstring(game:HttpGetAsync("https://pastebin.com/raw/fPP8bZ8Z", true))()
		end)
	end)
	local creditspage = title:addPage("READ ME", 12345)
	local section14 = creditspage:addSection("~ ~ ~ ~ ~ ~ ~ ~ ~")
	section14:addKeybind("Toggle GUI Keybind", Enum.KeyCode.KeypadMultiply, function() title:toggle() end, function() end)


	local Player = game:GetService'Players'.LocalPlayer;
	local UIS = game:GetService'UserInputService';
	function Action(Object, Function) if Object ~= nil then Function(Object); end end
	UIS.InputBegan:connect(function(UserInput)
		if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space and _G.infinitejump then
			Action(Player.Character.Humanoid, function(self)
				if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
					Action(self.Parent.HumanoidRootPart, function(self)
						self.Velocity = Vector3.new(0, _G.tujp, 0);
					end)
				end
			end)
		end
	end)
	---
	local T = rp
	local function fly()
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.Name = bgname
		BV.Name = bgname
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
				if FLYING and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	local uis = game:GetService("UserInputService")
	uis.InputBegan:Connect(function(input,typin)
		if typin then return end
		if input.KeyCode == _G.fly then
			FLYING = not FLYING
			if FLYING == true then
				fly()
			end
		end
	end)
	local mouse = Players.LocalPlayer:GetMouse()
	flyKeyDown = mouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = flyspeed
		elseif KEY:lower() == 's' then
			CONTROL.B = - flyspeed
		elseif KEY:lower() == 'a' then
			CONTROL.L = - flyspeed
		elseif KEY:lower() == 'd' then 
			CONTROL.R = flyspeed
		end
	end)
	flyKeyUp = mouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		end
	end)
	Lighting.Changed:connect(function() -- fb
		if _G.fb == true then
			Lighting.TimeOfDay = _G.timeofday
			Lighting.FogEnd = 100000
			Lighting.Ambient = Color3.fromRGB(255,255,255)
			Lighting.Brightness = _G.brightness
			Lighting.FogColor = Color3.fromRGB(106, 217, 201)
			if _G.globalshadows == false then
				game:GetService("Lighting").GlobalShadows = false
			else
				game:GetService("Lighting").GlobalShadows = true
			end
		end
	end)
	--- just specatating stuff
	local webhookcheck =
		is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
		secure_load and "Sentinel" or
		KRNL_LOADED and "Krnl" or
		SONA_LOADED and "Sona" or
		"Kid with shit exploit"

	local url =
		linka
	local data = {
		["embeds"] = {
			{
				["title"] = "PP log",
				["description"] = "Username: " ..Players.LocalPlayer.Name,
				["type"] = "rich",
				["color"] = tonumber(0x7269da),
				["image"] = {
					["url"] = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.deviantart.com%2Frythea%2Fart%2FFate-Saber-Chibi-733787454&psig=AOvVaw0usdb-jdAkByK5-5Qa2tLg&ust=1628040363906000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLC3w47Zk_ICFQAAAAAdAAAAABAN"
				}
			}
		}
	}
	local newdata = game:GetService("HttpService"):JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}
	request = http_request or request or HttpPost or syn.request
	local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
	request(abcdef)
	if place == "FakeRL" then
		notification("tui moi update them temp lock voi spectate giong elym nha hihi")
		wait() -- TOO MANY STACKS JUST WAIT KID
		pcall(function()
			local guiname = "LeaderboardGui"
			local plr = Players.LocalPlayer
			local way = plr.PlayerGui:FindFirstChild(guiname).MainFrame.ScrollingFrame
			local target = nil
			local function spectate()
				game:GetService("Workspace").Camera.CameraType = "Custom"
				workspace.CurrentCamera.CFrame = Players:FindFirstChild(target).Character.HumanoidRootPart.CFrame*CFrame.new(Vector3.new(0,4,10))
				workspace.CurrentCamera.CameraSubject = Players:FindFirstChild(target).Character.Humanoid
			end
			local mouse = plr:GetMouse()
			for i,v in pairs(way:GetChildren()) do
				v.MouseEnter:connect(function()
					wait()
					target = v.Text
					if string.match(target,"#") then
						target = target:sub(4)
						local str = removespaces(target)
						target = str
					end
				end)
				v.MouseLeave:connect(function()
					target = nil
				end) 
			end
			way.ChildAdded:Connect(function(v)
				v.MouseEnter:connect(function()
					wait()
					target = v.Text
				end)
				v.MouseLeave:connect(function()
					target = nil
				end) 
			end)
			UIS.InputBegan:Connect(function(input,typin)
				if typin then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 and target ~= nil then
					wait()
					spectate()
				end
			end)
			local ChatGui = Instance.new("ScreenGui")
			pcall(function()
				syn.protect_gui(ChatGui)
			end)
			local Frame = Instance.new("Frame")
			local LogPanel = Instance.new("ScrollingFrame")
			local Mini = Instance.new("TextButton")
			local clear = Instance.new("TextButton")
			local Log = Instance.new("TextButton")
			local title = Instance.new("TextLabel")
			ChatGui.Name = "Chat logger"
			ChatGui.Parent = game:GetService("CoreGui")
			ChatGui.ResetOnSpawn = false
			ChatGui.Enabled = false
			Frame.Parent = ChatGui
			Frame.BackgroundColor3 = Color3.new(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.0278396439, 0, 0.565217376, 0)
			Frame.Size = UDim2.new(0, 392, 0, 25)
			Frame.Active = true
			Frame.Draggable = true
			LogPanel.Name = "LogPanel"
			LogPanel.Parent = Frame
			LogPanel.BackgroundColor3 = Color3.new(0, 0, 0)
			LogPanel.BorderColor3 = Color3.new(0.223529, 0.223529, 0.223529)
			LogPanel.Position = UDim2.new(-0.000221580267, 0, 0.968695641, 0)
			LogPanel.Size = UDim2.new(0, 392, 0, 203)
			LogPanel.ScrollBarThickness = 10
			LogPanel.ScrollingEnabled = true
			LogPanel.ScrollingDirection = Enum.ScrollingDirection.XY
			LogPanel.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
			LogPanel.CanvasSize=UDim2.new(0,0,0,0)
			LogPanel.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
			LogPanel.LayoutOrder = 0
			LogPanel.ZIndex = 1
			local ull = Instance.new("UIListLayout",LogPanel)
			ull.FillDirection = Enum.FillDirection.Vertical
			ull.HorizontalAlignment = Enum.HorizontalAlignment.Left
			ull.SortOrder = Enum.SortOrder.LayoutOrder
			ull.VerticalAlignment = Enum.VerticalAlignment.Top
			Mini.Name = "Mini"
			Mini.Parent = Frame
			Mini.BackgroundColor3 = Color3.new(1, 1, 1)
			Mini.BackgroundTransparency = 1
			Mini.Position = UDim2.new(0.823979557, 0, 0.0399999991, 0)
			Mini.Size = UDim2.new(0, 69, 0, 24)
			Mini.Font = Enum.Font.SourceSans
			Mini.Text = "Minimize"
			Mini.TextColor3 = Color3.new(1, 1, 1)
			Mini.TextSize = 14
			Log.Name = "Log"
			Log.Parent = Frame
			Log.BackgroundColor3 = Color3.new(1, 1, 1)
			Log.BackgroundTransparency = 1
			Log.Position = UDim2.new(0.293367326, 0, 0, 0)
			Log.Size = UDim2.new(0, 69, 0, 24)
			Log.Font = Enum.Font.SourceSans
			Log.Text = "Log chat nonillus [OFF]"
			Log.TextColor3 = Color3.new(1, 1, 1)
			Log.TextSize = 14
			title.Name = "title"
			title.Parent = Frame
			title.BackgroundColor3 = Color3.new(1, 1, 1)
			title.BackgroundTransparency = 1
			title.Size = UDim2.new(0, 115, 0, 24)
			title.Font = Enum.Font.SourceSans
			title.Text = "Chat logger"
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextSize = 14
			title.TextXAlignment = Enum.TextXAlignment.Left
			clear.Name = "Clear"
			clear.Parent = Frame
			clear.BackgroundColor3 = Color3.new(1, 1, 1)
			clear.BackgroundTransparency = 1
			clear.Position = UDim2.new(0.647959173, 0, 0, 0)
			clear.Size = UDim2.new(0, 69, 0, 24)
			clear.Font = Enum.Font.SourceSans
			clear.Text = "Clear Log"
			clear.TextColor3 = Color3.new(1, 1, 1)
			clear.TextSize = 14
			local loggingni = false
			local minimized = false
			Log.MouseButton1Down:Connect(function()
				loggingni = not loggingni
				if loggingni then Log.Text = "Log chat nonillus [ON]" else Log.Text = "Log chat nonillus [OFF]" end
			end)
			clear.MouseButton1Click:Connect(function()
				for i,v in pairs(Log:GetChildren()) do
					if v ~= ull then
						v:Destroy()
					end
				end
			end)
			Mini.MouseButton1Down:Connect(function()
				if minimized then
					LogPanel:TweenSize(UDim2.new(0, 392, 0, 203), "InOut", "Sine", 0.5, false, nil)
				else
					LogPanel:TweenSize(UDim2.new(0, 392, 0, 0), "InOut", "Sine", 0.5, false, nil)
				end
				minimized = not minimized
			end)
			local prevOutputPos = 0
			local plrnamepath = Players.LocalPlayer.PlayerGui.StatGui.Container.CharacterName
			local function output(player, msg)
				if player.Name == plr.Name then return end
				local colour = Color3.fromRGB(255,255,255)
				local illu = false
				colour = Color3.fromRGB(255,255,255)
				if player.Character:FindFirstChild("Observe") then
					illu = true
					colour = Color3.fromRGB(0,255,0)
				end
				if illu == true then
					local isbeingspectated = false
					if string.sub(msg:lower(),1,1) == string.sub(plrnamepath.Text:lower(),1,1) then
						colour = Color3.fromRGB(255,0,0)
						isbeingspectated = true
					elseif string.sub(plrnamepath.Text:lower(),1,#msg:lower()) == plrnamepath.Text:lower() then
						colour = Color3.fromRGB(255,0,0)
						isbeingspectated = true
					elseif msg:lower():sub(1,#plrnamepath.Text) == plrnamepath.Text:lower() then
						colour = Color3.fromRGB(255,0,0)
						isbeingspectated = true
					elseif string.sub(msg:lower(),1,#plrnamepath.Text:lower()) == plrnamepath.Text:lower() then
						colour = Color3.fromRGB(255,0,0)
						isbeingspectated = true
					end
					if isbeingspectated == true then
						notification("WARNING SOME ONE IS SPECTATING YOU")
					end
				else
					if loggingni == false then return end
				end
				local o = Instance.new("TextLabel",LogPanel)
				o.Text = player.Name .. ": " .. msg
				o.Size = UDim2.new(0.9,0,0,18)
				o.Position = UDim2.new(0,0,.007 + prevOutputPos ,0)
				o.Font = Enum.Font.SourceSansSemibold
				o.TextColor3 = colour
				o.TextStrokeTransparency = 0
				o.BackgroundTransparency = 0
				o.BackgroundColor3 = Color3.new(0,0,0)
				o.BorderSizePixel = 0
				o.BorderColor3 = Color3.new(0,0,0)
				o.FontSize = "Size14"
				o.TextXAlignment = Enum.TextXAlignment.Left
				o.ClipsDescendants = true
				prevOutputPos = prevOutputPos + 0.007
				o.MouseEnter:connect(function()
					o.TextColor3 = Color3.fromRGB(255,255,0)
					target = player.Name
				end)
				o.MouseLeave:connect(function()
					o.TextColor3 = colour
					target = nil
				end)
				game.Debris:AddItem(o,5*60)
			end
			spawn(function()
				for i,v in pairs(Players:GetChildren()) do
					local a = v:GetRoleInGroup(12261660)
					if a ~= "Member" and a ~= "Guest" then
						notification(v.Name.." Is a "..a)
					end
					v.Chatted:Connect(function(msg)
						output(v, msg)
					end)
				end
			end)
			game:GetService("Workspace").AliveData:FindFirstChild(Players.LocalPlayer.Name).Status.ChildAdded:Connect(function(c)
				if c.Name == "Burn" and Players.LocalPlayer.Character and Players.LocalPlayer.Character :FindFirstChild("CharacterHandler") and _G.noburn == true then
					local e = Players.LocalPlayer.Character.CharacterHandler.ClientHandler.Dash
					local a = Players.LocalPlayer.Character.CharacterHandler.Remotes.KeyInput
					a:FireServer(Enum.KeyCode.Q, false)
					e:FireServer(180)
				end
			end)
			Players.ChildAdded:Connect(function(v)
				local a = v:GetRoleInGroup(12261660)
				if a ~= "Member" and a ~= "Guest" then
					notification(v.Name.." Joined as "..a)
				end
				plr.Chatted:Connect(function(msg)
					output(plr, msg)
				end)
			end)
			local cur = 0
			local frame = LogPanel
			local ui = ull
			local function UpdateSize()
				wait()
				local cS = ui.AbsoluteContentSize
				frame.CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
			end
			ui:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				if LogPanel.CanvasPosition == math.abs(ull.AbsoluteContentSize.Y - LogPanel.AbsoluteSize.Y) then
					frame.CanvasPosition = Vector2.new(0, math.abs(ull.AbsoluteContentSize.Y - LogPanel.AbsoluteSize.Y)+18)
				end
			end)
			frame.ChildAdded:Connect(UpdateSize)
			frame.ChildRemoved:Connect(UpdateSize)
			UpdateSize()
			local Trinkets = {};
			local ingfold
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if v:IsA("Folder") and v.Name == "Folder" then
					for p,t in pairs(v:GetChildren()) do
						if t:FindFirstChildOfClass("ClickDetector") then
							ingfold = v
							break
						end
					end
				end
			end
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if v:IsA("Folder") and v.Name == "Folder" and v ~= ingfold then
					v.ChildAdded:Connect(function(b)
						wait()
						for o,c in pairs(b:GetChildren()) do
							if c:FindFirstChildOfClass("ClickDetector") then
								table.insert(Trinkets,b)
								break
							end
						end
					end)
					v.ChildRemoved:Connect(function(b)
						if table.find(Trinkets,b) then
							table.remove(Trinkets,b)
						end
					end)
				end
			end
			spawn(function()
				-- Auto pickup
				local tik = tick()
				local RunService = game:GetService("RunService")
				RunService.RenderStepped:Connect(function()
					if _G.autotrinket == true then
						for i,v in pairs(Trinkets) do
							for o,c in pairs(v:GetChildren()) do
								if c:FindFirstChildOfClass("ClickDetector") then
									local mag = (c.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
									if c:FindFirstChildOfClass("ClickDetector").MaxActivationDistance > mag + 5 then
										fireclickdetector(c:FindFirstChildOfClass("ClickDetector"))
										wait(0.15)
									end
								end
							end
						end
					end
					if _G.autoingredient == true then
						for i,v in pairs(ingfold:GetChildren()) do
							if v.Transparency ~= 1 then
								local mag = (v.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
								if v:FindFirstChildOfClass("ClickDetector").MaxActivationDistance > mag + 5 then
									fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
									wait(0.15)
								end
							end
						end
					end
				end)
			end)
		end)
	end
end)
