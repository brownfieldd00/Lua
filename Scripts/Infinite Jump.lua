_G.ToggleKey = Enum.KeyCode.R
_G.Enabled = true

local Player = game:GetService("Players").LocalPlayer
local UIS = game:GetService('UserInputService')
local function getHumanoid()
	return Player.Character:FindFirstChild('Humanoid')
end
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.Space and getHumanoid() and _G.Enabled then
			getHumanoid():ChangeState("Jumping")
			task.wait(0.1)
			getHumanoid():ChangeState("Seated")
		elseif input.KeyCode == _G.ToggleKey then
			_G.Enabled = not _G.Enabled
		end
	end
end)