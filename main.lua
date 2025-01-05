-- Gui to Lua
-- Version: 3.2

-- Instances:

local iex = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local code = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")

--Properties:

iex.Name = "iex"
iex.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = iex
Frame.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.100000016, 0, 0.0999999717, 0)
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(143, 143, 143)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.030959744, 0, 0.833404124, 0)
TextButton.Size = UDim2.new(0, 128, 0, 20)
TextButton.Font = Enum.Font.Roboto
TextButton.Text = "Execute"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = TextButton

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(113, 113, 113)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0199999996, 0, 0.143999994, 0)
ScrollingFrame.Size = UDim2.new(0.959999979, 0, 0.657999992, 0)

code.Name = "code"
code.Parent = ScrollingFrame
code.BackgroundColor3 = Color3.fromRGB(129, 129, 129)
code.BorderColor3 = Color3.fromRGB(0, 0, 0)
code.BorderSizePixel = 0
code.Size = UDim2.new(1, 0, 1, 0)
code.ClearTextOnFocus = false
code.Font = Enum.Font.Unknown
code.MultiLine = true
code.Text = "what"
code.TextColor3 = Color3.fromRGB(241, 241, 241)
code.TextSize = 14.000
code.TextStrokeTransparency = 0.000
code.TextXAlignment = Enum.TextXAlignment.Left
code.TextYAlignment = Enum.TextYAlignment.Top

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = ScrollingFrame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(143, 143, 143)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.371747226, 0, 0.832089543, 0)
TextLabel.Size = UDim2.new(0, 229, 0, 36)
TextLabel.Font = Enum.Font.Arial
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 10)
UICorner_4.Parent = TextLabel

-- Scripts:

local function JIIGGAE_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.Activated:Connect(function()  
		local wah = loadstring(script.Parent.Parent.ScrollingFrame.code.Text)
		local success, err = pcall(wah)
		if success then
		script.Parent.Parent.TextLabel.Text = "Script execution success."
		else
		script.Parent.Parent.TextLabel.Text = "Scrpt errored:".. err
		end
	end)
	
	
end
coroutine.wrap(JIIGGAE_fake_script)()
local function VDDYKO_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	-- Need help? Check me out on the devforum!
	-- Link: https://devforum.roblox.com/t/smooth-dragging-easily-drag-your-frames/2508276
	local Drag = script.Parent
	gsCoreGui = game:GetService("CoreGui")
	gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		local dragTime = 0.04
		local SmoothDrag = {}
		SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
		dragSmoothFunction:Play()
	end
	Drag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Drag.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Drag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging and Drag.Size then
			update(input)
		end
	end)
end
coroutine.wrap(VDDYKO_fake_script)()
