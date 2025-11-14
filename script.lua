local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ScreenGui

local function Setup()
	if ScreenGui then
		ScreenGui:Destroy()
		ScreenGui = nil
	end

	local Character = Player.Character or Player.CharacterAdded:Wait()
	local RootPart = Character:WaitForChild("HumanoidRootPart")
	local Humanoid = Character:WaitForChild("Humanoid")

	local PlayerGui = Player:WaitForChild("PlayerGui")

	ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = PlayerGui

	local TopBar = Instance.new("Frame")
	TopBar.Position = UDim2.new(0.35, 0, 0.129, 0)
	TopBar.Size = UDim2.new(0, 240, 0, 38)
	TopBar.BackgroundColor3 = Color3.fromRGB(255, 39, 32)
	TopBar.Active = true
	TopBar.Draggable = true
	TopBar.Parent = ScreenGui

	local MinimizeButton = Instance.new("TextButton")
	MinimizeButton.Position = UDim2.new(0.887, 0, 0, 0)
	MinimizeButton.Size = UDim2.new(0, 26, 0, 26)
	MinimizeButton.Text = "_"
	MinimizeButton.Parent = TopBar

	local Frame = Instance.new("Frame")
	Frame.Position = UDim2.new(-0.002, 0, 0.993, 0)
	Frame.Size = UDim2.new(0, 240, 0, 371)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 39, 32)
	Frame.Parent = TopBar

	local PrisonButton = Instance.new("TextButton")
	PrisonButton.Position = UDim2.new(0.083, 0, 0.063, 0)
	PrisonButton.Size = UDim2.new(0, 200, 0, 50)
	PrisonButton.Text = "Prisão"
	PrisonButton.Parent = Frame

	local CriminalButton = Instance.new("TextButton")
	CriminalButton.Position = UDim2.new(0.083, 0, 0.246, 0)
	CriminalButton.Size = UDim2.new(0, 200, 0, 50)
	CriminalButton.Text = "Auto Criminal"
	CriminalButton.Parent = Frame

	MinimizeButton.MouseButton1Down:Connect(function()
		Frame.Visible = not Frame.Visible
	end)

	PrisonButton.MouseButton1Down:Connect(function()
		RootPart.CFrame = CFrame.new(874.77, 99.99, 2275.22)
	end)

	CriminalButton.MouseButton1Down:Connect(function()
		RootPart.CFrame = CFrame.new(-935.53, 94.13, 2044.95)
	end)

	Humanoid.Died:Connect(function()
		if ScreenGui then
			ScreenGui:Destroy()
			ScreenGui = nil
		end
	end)
end

Setup()

Player.CharacterAdded:Connect(function()
	Setup()
end)
