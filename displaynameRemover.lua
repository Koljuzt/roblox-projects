function removeDisplayName(char)
    local humanoid = char.Humanoid
    local origName = humanoid.DisplayName
    humanoid.DisplayName = string.format("%s (@%s)", origName, char.Name)
end

for _, p in pairs(game.Players:GetPlayers()) do
    removeDisplayName(p.Character)
end

workspace.Players.ChildAdded:Connect(function(child)
    if child:IsA("Model") then
        local h = child:WaitForChild("Humanoid", 6)
        if h then
            removeDisplayName(child)
        end
    end
end)
