repeat wait() until game.Players.LocalPlayer.Character ~= nil

--// Open Vars
local Closed = false
local CBMoving = false

local ctrlenabled = false
local ctrltweening = false

local pressingCTRL = false

local notouchenabled = false
local notouchtweening = false

-- Player
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local PlayerGui = Player:WaitForChild("PlayerGui")

local function new()
	-- GUI Creation
	
	
	local GUI = Instance.new("ScreenGui", PlayerGui)
	local GuiName = "Zaksgui"
	GUI.Name = GuiName


	local Bar = Instance.new("Frame", GUI)
	Bar.Name = "Bar"

	Bar.Position = UDim2.new(0.343, 0,0.473, 0)
	Bar.Size = UDim2.new(0, 401, 0, 38)
	Bar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Bar.BorderSizePixel = 0

	local MainFrame = Instance.new("Frame", Bar)
	MainFrame.Name = "MainFrame"
	MainFrame.Position = UDim2.new(-0.001, 0, 1, 0)
	MainFrame.Size = UDim2.new(0, 401, 0, 276)
	MainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	MainFrame.BorderSizePixel = 0

	local Title = Instance.new("TextLabel", Bar)
	Title.Name = "Title"
	Title.BackgroundTransparency = 1

	Title.Position = UDim2.new(0.249, 0,0, 0)
	Title.Size = UDim2.new(0, 200, 0, 37)

	Title.Font = Enum.Font.Arial
	Title.Text = "__ZaksGui__"
	Title.TextStrokeTransparency = 0
	Title.TextScaled = true
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)

	local Close = Instance.new("TextButton", Bar)
	Close.Parent = Bar
	Close.Name = "Close"
	Close.Position = UDim2.new(0.836, 0,-0.022, 0)
	Close.Size = UDim2.new(0, 65, 0, 37)

	Close.TextScaled = true

	Close.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
	Close.BorderSizePixel = 0
	Close.Text = "X"
	Close.Font = Enum.Font.Gotham
	Close.TextColor3 = Color3.fromRGB(255, 0, 0)
	Close.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)

	local SpeedBox = Instance.new("TextBox", MainFrame)
	SpeedBox.Name = "WalkSpeed"
	SpeedBox.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	SpeedBox.BorderSizePixel = 0

	SpeedBox.Position = UDim2.new(0.047, 0,0.083, 0)
	SpeedBox.Size = UDim2.new(0, 68,0, 58)

	SpeedBox.Font = Enum.Font.Gotham
	SpeedBox.TextColor3 = Color3.new(255, 255, 255)
	SpeedBox.TextScaled = true

	SpeedBox.TextStrokeTransparency = 0
	SpeedBox.Text = Character:WaitForChild("Humanoid").WalkSpeed

	local SpeedLabel = Instance.new("TextLabel", MainFrame)
	SpeedLabel.Name = "WalkSpeedLabel"

	SpeedLabel.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
	SpeedLabel.BorderSizePixel = 0

	SpeedLabel.Position = UDim2.new(0.274, 0, 0.083, 0)
	SpeedLabel.Size = UDim2.new(0, 200, 0, 58)
	SpeedLabel.Font = Enum.Font.Gotham
	SpeedLabel.Text = "Walk Speed"

	SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	SpeedLabel.TextScaled = true
	SpeedLabel.TextStrokeTransparency = 0

	local CtrlClickTP = Instance.new("TextButton", MainFrame)
	CtrlClickTP.Name = "CtrlClickTP"

	CtrlClickTP.BackgroundTransparency = 1
	CtrlClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
	CtrlClickTP.Position = UDim2.new(0.047, 0,0.322, 0)
	CtrlClickTP.Size = UDim2.new(0, 200,0, 40)

	CtrlClickTP.Text = "Ctrl+Click TP"
	CtrlClickTP.TextScaled = true
	CtrlClickTP.TextStrokeTransparency = 0
	CtrlClickTP.Font = Enum.Font.Gotham

	local NoTouch = Instance.new("TextButton", MainFrame)
	NoTouch.Name = "No Touch"
	NoTouch.Text = "No Touch"

	NoTouch.BackgroundTransparency = 1
	NoTouch.TextColor3 = Color3.fromRGB(255, 255, 255)
	NoTouch.Position = UDim2.new(0.047, 0,0.467, 0)
	NoTouch.Size = UDim2.new(0, 200,0, 40)

	NoTouch.TextScaled = true
	NoTouch.TextStrokeTransparency = 0
	NoTouch.Font = Enum.Font.Gotham

	return GUI, Bar, MainFrame, Title, Close, SpeedBox, SpeedLabel, CtrlClickTP, NoTouch
end


local function startup()
	local GUI, Bar, MainFrame, Title, Close, SpeedBox, SpeedLabel, CtrlClickTP, NoTouch = new()
	Close.Visible = false
	for i,v in pairs(MainFrame:GetChildren()) do
		v.Visible = false
	end
	local t = game:GetService("TweenService")
	local m = t:Create(MainFrame, TweenInfo.new(0), {Size = UDim2.new(0, 401, 0, 0)})
	m:Play()
	m.Completed:Wait()
	wait(1)
	Close.Visible = true
	for i,v in pairs(MainFrame:GetChildren()) do
		v.Visible = true
	end
	local t = game:GetService("TweenService")
	local m = t:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.new(0, 401, 0, 276)})
	m:Play()
	m.Completed:Wait()
	Bar.Selectable = true
	Bar.Active = true
	Bar.Draggable = true
	
	game:GetService("RunService").Heartbeat:Connect(function(dt)
		wait(dt / 16)

		Character:WaitForChild("Humanoid").WalkSpeed = tonumber(SpeedBox.Text)
	end)

	Close.MouseButton1Click:Connect(function()
		if CBMoving then return end

		if not Closed then
			Closed = true
			for i,v in pairs(MainFrame:GetChildren()) do
				v.Visible = false
			end
			CBMoving = true
			local t = game:GetService("TweenService")
			local m = t:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.new(0, 401, 0, 0)})
			m:Play()
			m.Completed:Wait()
			CBMoving = false
		else
			Closed = false
			for i,v in pairs(MainFrame:GetChildren()) do
				v.Visible = true
			end
			CBMoving = true
			local t = game:GetService("TweenService")
			local m = t:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.new(0, 401, 0, 276)})
			m:Play()
			m.Completed:Wait()
			CBMoving = false
		end
	end)

	CtrlClickTP.MouseButton1Click:Connect(function()
		if ctrltweening then return end

		if not ctrlenabled then
			ctrlenabled = true
			ctrltweening = true
			local t = game:GetService("TweenService")
			local m = t:Create(CtrlClickTP, TweenInfo.new(1), {TextStrokeColor3 = Color3.fromRGB(17, 255, 0)})
			m:Play()
			m.Completed:Wait()
			ctrltweening = false
		else
			ctrlenabled = false
			ctrltweening = true
			local t = game:GetService("TweenService")
			local m = t:Create(CtrlClickTP, TweenInfo.new(1), {TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
			m:Play()
			m.Completed:Wait()
			ctrltweening = false
		end
	end)

	NoTouch.MouseButton1Click:Connect(function()
		if notouchtweening then return end

		if not notouchenabled then
			notouchenabled = true
			notouchtweening = true
			local t = game:GetService("TweenService")
			local m = t:Create(NoTouch, TweenInfo.new(1), {TextStrokeColor3 = Color3.fromRGB(17, 255, 0)})
			m:Play()
			m.Completed:Wait()
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Part") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
					v.CanTouch = false
				end
			end
			notouchtweening = false
		else
			notouchenabled = false
			notouchtweening = true
			local t = game:GetService("TweenService")
			local m = t:Create(NoTouch, TweenInfo.new(1), {TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
			m:Play()
			m.Completed:Wait()
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Part") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
					v.CanTouch = true
				end
			end
			notouchtweening = false
		end
	end)


	game:GetService("UserInputService").InputBegan:Connect(function(inp, gp)
		if gp then return end

		if inp.KeyCode == Enum.KeyCode.LeftControl then
			pressingCTRL = true
		end
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(inp, gp)
		if gp then return end

		if inp.KeyCode == Enum.KeyCode.LeftControl then
			pressingCTRL = false
		end
	end)

	Player:GetMouse().Button1Down:Connect(function()
		if ctrlenabled == false then return end
		if ctrltweening then return end
		if pressingCTRL == false then return end

		Character:PivotTo(Player:GetMouse().Hit)
	end)
end




local Start do
	startup()
end
