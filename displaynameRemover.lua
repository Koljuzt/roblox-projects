function removeDisplayName(char)
	local humanoid = char.Humanoid
	local origName = humanoid.DisplayName
	humanoid.DisplayName = string.format("%s (@%s)", char.Name, origName)
end

for _, p in game.Players:GetPlayers() do
	removeDisplayName(p.Character)
	p.CharacterAdded:Connect(function(c)
		c:WaitForChild("Humanoid")
		removeDisplayName(c)
	end)
end
