-- Variável para controlar se o script está ativado ou desativado
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

-- Criar tela de carregamento
local loadingScreen = Instance.new("ScreenGui")
loadingScreen.Name = "LoadingScreen"
loadingScreen.Parent = game.Players.LocalPlayer.PlayerGui

local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.5
background.Parent = loadingScreen

local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(0, 200, 0, 30)
loadingText.Position = UDim2.new(0.5, -100, 0.5, -15)
loadingText.AnchorPoint = Vector2.new(0.5, 0.5)
loadingText.Text = "Loading.."
loadingText.Font = Enum.Font.SourceSans
loadingText.TextSize = 24
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Parent = background

print("Loaded.")
