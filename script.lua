-- Variável para controlar se o script está ativado ou desativado
print("Loading..")
local ativo = true

-- Função para processar os comandos
local function processarComando(comando)
    if not ativo then
        return
    end

    if comando == "Direita volver" then
        print("Direita volver!")
        -- Mover o jogador para a direita
        game.Players.LocalPlayer.Character:Move(Vector3.new(1, 0, 0))
    elseif comando == "Esquerda volver" then
        -- Mover o jogador para a esquerda
        game.Players.LocalPlayer.Character:Move(Vector3.new(-1, 0, 0))
    end
end

-- Conectar a função ao evento de chat
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local lowerMsg = msg:lower()
    if lowerMsg == "direita volver" or lowerMsg == "esquerda volver" then
            warn("Loading..")
        processarComando(lowerMsg)
    end
end)

-- Criar botões de ativar e desativar
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local ativarButton = Instance.new("TextButton")
ativarButton.Parent = gui
ativarButton.Position = UDim2.new(0, 10, 0, 10)
ativarButton.Size = UDim2.new(0, 100, 0, 30)
ativarButton.Text = "Ativar"
ativarButton.MouseButton1Click:Connect(function()
    ativo = true
end)

local desativarButton = Instance.new("TextButton")
desativarButton.Parent = gui
desativarButton.Position = UDim2.new(0, 120, 0, 10)
desativarButton.Size = UDim2.new(0, 100, 0, 30)
desativarButton.Text = "Desativar"
desativarButton.MouseButton1Click:Connect(function()
    ativo = false
end)
print("Loaded.")
