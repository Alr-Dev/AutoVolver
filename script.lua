local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Button = script.Parent
local isActive = false -- Variável para controlar o estado do botão

Button.MouseButton1Click:Connect(function()
    local message = "Direta Volver" -- A mensagem que você quer verificar
    local player = Player.Name -- Nome do jogador que clicou no botão

    if message == "Direta Volver" then
        -- Encontre o personagem do jogador
        local character = Player.Character or Player.CharacterAdded:Wait()

        -- Calcule a nova direção (direita)
        local newDirection = Vector3.new(1, 0, 0)

        -- Aplique a nova direção à câmera do personagem
        character:WaitForChild("Humanoid").AutoRotate = false
        character:WaitForChild("Humanoid").AutoRotateSpeed = 0
        character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(character:WaitForChild("HumanoidRootPart").Position, character:WaitForChild("HumanoidRootPart").Position + newDirection)
    elseif message == "Esquerda Volver" then
        -- Calcule a nova direção (esquerda)
        local newDirection = Vector3.new(-1, 0, 0)

        -- Aplique a nova direção à câmera do personagem
        character:WaitForChild("Humanoid").AutoRotate = false
        character:WaitForChild("Humanoid").AutoRotateSpeed = 0
        character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(character:WaitForChild("HumanoidRootPart").Position, character:WaitForChild("HumanoidRootPart").Position + newDirection)
    end

    -- Alternar o estado do botão
    isActive = not isActive
    Button.Text = isActive and "Desativar" or "Ativar"
end)
