local UIS = game:GetService("UserInputService");
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");

local LegacyMouse = Players.LocalPlayer:GetMouse()
local Locked = false
local OriginalIcon = LegacyMouse.Icon

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			Locked = not Locked
			if Locked then
				UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
				if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					local Humanoid: Humanoid = Players.LocalPlayer.Character.Humanoid
					Humanoid.CameraOffset = Vector3.new(1.5,0,0)
					LegacyMouse.Icon = 'rbxasset://textures/MouseLockedCursor.png'
				end
			else
				if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					local Humanoid: Humanoid = Players.LocalPlayer.Character.Humanoid
					Humanoid.CameraOffset = Vector3.new(0,0,0)
					UIS.MouseBehavior = Enum.MouseBehavior.Default
					LegacyMouse.Icon = OriginalIcon
				end
			end
		end
	end
end)
RunService.RenderStepped:Connect(function()
	if Locked then
		if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local HRP: BasePart = Players.LocalPlayer.Character.HumanoidRootPart
			local CamLV = workspace.CurrentCamera.CFrame.LookVector
			HRP.CFrame = CFrame.new(HRP.Position) * CFrame.Angles(0, math.atan2(-CamLV.X, -CamLV.Z), 0)
		end
	end
end)