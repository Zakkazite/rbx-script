-- Made for roblox; by Zakkites

repeat wait() until game.Players.LocalPlayer.Character ~= nil




local lplayer = game:GetService("Players").LocalPlayer


local Mouse = lplayer:GetMouse()


local flying = false


local a = 1


--// Open Vars


local Closed = false


local CBMoving = false



local ctrlenabled = false


local ctrltweening = false



local pressingCTRL = false



local notouchenabled = false


local notouchtweening = false



local function Fly_()


	if a == 1 then


		repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')


		repeat wait() until Mouse



		local speedfly = 3 --FLY SPEED HERE


		


		for i,v in pairs(game:GetDescendants()) do


			if v:IsA("Part") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then


				v.CanCollide = false


			end


			v.ChildAdded:Connect(function(v)


				if v:IsA("Part") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then


					v.CanCollide = false


				end


			end)


		end



		local T = lplayer.Character.HumanoidRootPart


		local CONTROL = {F = 0, B = 0, L = 0, R = 0}


		local lCONTROL = {F = 0, B = 0, L = 0, R = 0}


		local SPEED = speedfly



		local function fly()


			flying = true


			local BG = Instance.new('BodyGyro', T)


			local BV = Instance.new('BodyVelocity', T)


			BG.P = 9e4


			BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)


			BG.cframe = T.CFrame


			BV.velocity = Vector3.new(0, 0.1, 0)


			BV.maxForce = Vector3.new(9e9, 9e9, 9e9)


			spawn(function()


				repeat wait()


					lplayer.Character.Humanoid.PlatformStand = true


					if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then


						SPEED = 50


					elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then


						SPEED = 0


					end


					if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then


						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).Position) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED


						lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}


					elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then


						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).Position) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED


					else


						BV.velocity = Vector3.new(0, 0.1, 0)


					end


					BG.cframe = workspace.CurrentCamera.CoordinateFrame


				until not flying


				CONTROL = {F = 0, B = 0, L = 0, R = 0}


				lCONTROL = {F = 0, B = 0, L = 0, R = 0}


				SPEED = 0


				BG:destroy()


				BV:destroy()


				lplayer.Character.Humanoid.PlatformStand = false


			end)


		end


		Mouse.KeyDown:connect(function(KEY)


			if KEY:lower() == 'w' then


				CONTROL.F = speedfly


			elseif KEY:lower() == 's' then


				CONTROL.B = -speedfly


			elseif KEY:lower() == 'a' then


				CONTROL.L = -speedfly


			elseif KEY:lower() == 'd' then


				CONTROL.R = speedfly


			end


		end)


		Mouse.KeyUp:connect(function(KEY)


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


		a = 0


		fly()


	else 


		for i,v in pairs(workspace:GetDescendants()) do


			if v:IsA("Part") or v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then


				v.CanCollide = true


			end


		end


		flying = false


		lplayer.Character.Humanoid.PlatformStand = false


		a = 1


	end


end



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



	local Hide = Instance.new("TextButton", Bar)


	Hide.Parent = Bar


	Hide.Name = "Hide"


	Hide.Position = UDim2.new(0.836, 0,-0.022, 0)


	Hide.Size = UDim2.new(0, 65, 0, 37)



	Hide.TextScaled = true



	Hide.BackgroundColor3 = Color3.fromRGB(88, 88, 88)


	Hide.BorderSizePixel = 0


	Hide.Text = "↑"


	Hide.Font = Enum.Font.Gotham


	Hide.TextColor3 = Color3.fromRGB(255, 0, 0)


	Hide.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)



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


	


	local Fly = Instance.new("TextButton", MainFrame)


	Fly.Name = "Fly"


	Fly.Text = "Ctrl+E = Fly"



	Fly.BackgroundTransparency = 1


	Fly.TextColor3 = Color3.fromRGB(255, 255, 255)


	Fly.Position = UDim2.new(0.047, 0,0.612, 0)


	Fly.Size = UDim2.new(0, 200,0, 40)



	Fly.TextScaled = true


	Fly.TextStrokeTransparency = 0


	Fly.Font = Enum.Font.Gotham



	return GUI, Bar, MainFrame, Title, Hide, SpeedBox, SpeedLabel, CtrlClickTP, NoTouch, Fly


end




local function startup()


	local GUI, Bar, MainFrame, Title, Hide, SpeedBox, SpeedLabel, CtrlClickTP, NoTouch, Fly = new()


	Hide.Visible = false


	for i,v in pairs(MainFrame:GetChildren()) do


		v.Visible = false


	end


	local t = game:GetService("TweenService")


	local m = t:Create(MainFrame, TweenInfo.new(0), {Size = UDim2.new(0, 401, 0, 0)})


	m:Play()


	m.Completed:Wait()


	wait(1)


	Hide.Visible = true


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



	Hide.MouseButton1Click:Connect(function()


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


			Hide.Text = "↓"


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


			Hide.Text = "↑"


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


		


		if pressingCTRL and inp.KeyCode == Enum.KeyCode.E then


			Fly_()


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
