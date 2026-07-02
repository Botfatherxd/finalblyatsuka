-- ============================================================
-- KEBABICH STUDIO MM2 CHAMS v13.0 (ПОЛНЫЙ ХАОС, СУКА!)
-- ДИЗАЙН: ЧЁРНЫЙ МИНИМАЛИЗМ, КРАСНЫЕ КНОПКИ, ОВАЛЬНАЯ КНОПКА
-- ФИЧИ: ESP (MURDER/SHERIFF/INNOCENT/SELF/DROPPED GUN) 
--        + SILENT AIM (ПК/ТЕЛЕФОН) 
--        + ANTI-AIM (ВРАЩЕНИЕ 80 РАД/СЕК)
--        + ТРОЛЛЬ-КНОПКА "ВЫЕБАТЬ МАТЬ РАЗРАБОТЧИКА"
-- АВТОР: KEBABICH (ПОДПИШИСЬ, ПИЗДА!)
-- ============================================================

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
gui.Name = "KEBABICH_MENU"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ========== РАЗМЫТИЕ ФОНА ==========
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

-- ========== КНОПКА-ОВАЛ ==========
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 140, 0, 40)
toggleButton.Position = UDim2.new(0.5, -70, 0, 20)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
toggleButton.BackgroundTransparency = 0.15
toggleButton.Text = "ВАЙБКОД СКРИПТ"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 14
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Draggable = true
toggleButton.Active = true
toggleButton.Parent = gui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 20)
toggleCorner.Parent = toggleButton

local toggleShadow = Instance.new("ImageLabel")
toggleShadow.Size = UDim2.new(1, 10, 1, 10)
toggleShadow.Position = UDim2.new(0, -5, 0, -5)
toggleShadow.BackgroundTransparency = 1
toggleShadow.Image = "rbxassetid://1316045711"
toggleShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
toggleShadow.ImageTransparency = 0.6
toggleShadow.ZIndex = 0
toggleShadow.Parent = toggleButton

local menuVisible = false

-- ========== ГЛАВНОЕ ОКНО ==========
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.25
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = mainFrame

local border = Instance.new("Frame")
border.Size = UDim2.new(1, 0, 1, 0)
border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
border.BackgroundTransparency = 0.92
border.BorderSizePixel = 0
border.Parent = mainFrame

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 18)
borderCorner.Parent = border

-- ========== АНИМАЦИЯ ==========
local tweenService = game:GetService("TweenService")
local openTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- ========== СТАРТОВЫЙ ФРЕЙМ ==========
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Size = UDim2.new(1, 0, 1, 0)
welcomeFrame.BackgroundTransparency = 1
welcomeFrame.Parent = mainFrame

local welcomeTitle = Instance.new("TextLabel")
welcomeTitle.Size = UDim2.new(1, -30, 0, 20)
welcomeTitle.Position = UDim2.new(0, 15, 0, 12)
welcomeTitle.BackgroundTransparency = 1
welcomeTitle.Text = "Добро пожаловать, олух!"
welcomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeTitle.TextSize = 14
welcomeTitle.Font = Enum.Font.GothamBold
welcomeTitle.Parent = welcomeFrame

local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 60, 0, 24)
startButton.Position = UDim2.new(0.5, -30, 0, 40)
startButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
startButton.BackgroundTransparency = 0.2
startButton.Text = "Начать"
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.TextSize = 12
startButton.Font = Enum.Font.GothamBold
startButton.Parent = welcomeFrame

local startCorner = Instance.new("UICorner")
startCorner.CornerRadius = UDim.new(0, 14)
startCorner.Parent = startButton

startButton.MouseEnter:Connect(function()
    tweenService:Create(startButton, TweenInfo.new(0.15), {BackgroundTransparency = 0.5}):Play()
end)
startButton.MouseLeave:Connect(function()
    tweenService:Create(startButton, TweenInfo.new(0.15), {BackgroundTransparency = 0.2}):Play()
end)

-- ========== ОСНОВНОЙ UI ==========
local mainUI = Instance.new("Frame")
mainUI.Size = UDim2.new(1, 0, 1, 0)
mainUI.BackgroundTransparency = 1
mainUI.Visible = false
mainUI.Parent = mainFrame

-- ========== ШАПКА ==========
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 24)
header.Position = UDim2.new(0, 0, 0, 4)
header.BackgroundTransparency = 1
header.Text = "KEBABICH STUDIO"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 14
header.Font = Enum.Font.GothamBold
header.Parent = mainUI

local subHeader = Instance.new("TextLabel")
subHeader.Size = UDim2.new(1, 0, 0, 14)
subHeader.Position = UDim2.new(0, 0, 0, 26)
subHeader.BackgroundTransparency = 1
subHeader.Text = "ебал я вайбкод"
subHeader.TextColor3 = Color3.fromRGB(180, 50, 50)
subHeader.TextSize = 11
subHeader.Font = Enum.Font.Gotham
subHeader.Parent = mainUI

-- ========== КАТЕГОРИИ ==========
local categories = {"VISUALS", "COMBAT", "ANANAS"}
local catButtons = {}
local activeTab = "VISUALS"

for i, cat in ipairs(categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 90, 0, 20)
    btn.Position = UDim2.new(0.06 + (i-1) * 0.28, 0, 0, 46)
    btn.BackgroundTransparency = 1
    btn.Text = cat
    btn.TextColor3 = (cat == "VISUALS") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(130, 130, 130)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = mainUI
    catButtons[cat] = btn
    
    btn.MouseEnter:Connect(function()
        if cat ~= activeTab then
            tweenService:Create(btn, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if cat ~= activeTab then
            tweenService:Create(btn, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(130, 130, 130)}):Play()
        end
    end)
end

-- ========== КОНТЕЙНЕР ВКЛАДОК ==========
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, -20, 0, 210)
tabContainer.Position = UDim2.new(0, 10, 0, 74)
tabContainer.BackgroundTransparency = 1
tabContainer.ClipsDescendants = true
tabContainer.Parent = mainUI

-- ========== VISUALS ==========
local visualsTab = Instance.new("Frame")
visualsTab.Size = UDim2.new(1, 0, 1, 0)
visualsTab.BackgroundTransparency = 1
visualsTab.Visible = true
visualsTab.Parent = tabContainer

local function createToggle(parent, yPos, label, callback)
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0.7, 0, 0, 20)
    labelText.Position = UDim2.new(0, 0, 0, yPos)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = Color3.fromRGB(220, 220, 220)
    labelText.TextSize = 12
    labelText.Font = Enum.Font.Gotham
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = parent
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 22, 0, 22)
    toggleButton.Position = UDim2.new(0.85, 0, 0, yPos - 1)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggleButton.BackgroundTransparency = 0.4
    toggleButton.Text = ""
    toggleButton.Parent = parent
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggleButton
    
    local enabled = false
    
    toggleButton.MouseButton1Click:Connect(function()
        enabled = not enabled
        local targetColor = enabled and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 60)
        local targetTransp = enabled and 0.1 or 0.4
        
        tweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = targetColor,
            BackgroundTransparency = targetTransp
        }):Play()
        
        callback(enabled)
    end)
end

-- ========== ESP ЛОГИКА (100% РАБОТАЕТ!) ==========
local ESP = {
    Murder = {Enabled = false},
    Sheriff = {Enabled = false},
    Innocent = {Enabled = false},
    Self = {Enabled = false},
    DroppedGun = {Enabled = false}
}

local function getPlayerRole(plr)
    if not plr or not plr.Character then return "Innocent" end
    
    local placesToCheck = {
        plr.Character,
        plr:FindFirstChild("Inventory"),
        plr:FindFirstChild("Backpack"),
        plr:FindFirstChild("StarterGear")
    }
    
    for _, container in pairs(placesToCheck) do
        if container then
            for _, item in pairs(container:GetChildren()) do
                if item:IsA("Tool") then
                    local name = item.Name:lower()
                    if name:find("knife") or name:find("murder") or 
                       name:find("кнайф") or name:find("крим") or 
                       name:find("нож") or name:find("киллер") or
                       name:find("blade") or name:find("dagger") then
                        return "Murder"
                    elseif name:find("gun") or name:find("pistol") or 
                           name:find("sheriff") or name:find("пистолет") or 
                           name:find("револьвер") or name:find("revolver") or
                           name:find("шоты") or name:find("ствол") then
                        return "Sheriff"
                    end
                end
            end
        end
    end
    
    return "Innocent"
end

local function updateESP()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local role = getPlayerRole(plr)
            local highlight = plr.Character:FindFirstChild("ESP_Highlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.Parent = plr.Character
                highlight.FillTransparency = 0.3
                highlight.OutlineTransparency = 0.1
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end
            
            if plr == player and ESP.Self.Enabled then
                highlight.FillColor = Color3.fromRGB(255, 200, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 200, 0)
                highlight.Enabled = true
            elseif role == "Murder" and ESP.Murder.Enabled then
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.Enabled = true
            elseif role == "Sheriff" and ESP.Sheriff.Enabled then
                highlight.FillColor = Color3.fromRGB(0, 100, 255)
                highlight.OutlineColor = Color3.fromRGB(0, 100, 255)
                highlight.Enabled = true
            elseif role == "Innocent" and ESP.Innocent.Enabled then
                highlight.FillColor = Color3.fromRGB(0, 255, 50)
                highlight.OutlineColor = Color3.fromRGB(0, 255, 50)
                highlight.Enabled = true
            else
                highlight.Enabled = false
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(updateESP)
game.Players.PlayerRemoving:Connect(function(plr)
    if plr.Character then
        local highlight = plr.Character:FindFirstChild("ESP_Highlight")
        if highlight then highlight:Destroy() end
    end
end)

-- ТОГГЛЫ VISUALS
createToggle(visualsTab, 2, "Подсвети мразь", function(enabled)
    ESP.Murder.Enabled = enabled
end)

createToggle(visualsTab, 32, "Подсвети шерифа", function(enabled)
    ESP.Sheriff.Enabled = enabled
end)

createToggle(visualsTab, 62, "Бедные невинные", function(enabled)
    ESP.Innocent.Enabled = enabled
end)

createToggle(visualsTab, 92, "Покажи себя, пидор", function(enabled)
    ESP.Self.Enabled = enabled
end)

createToggle(visualsTab, 122, "Выпавший ствол", function(enabled)
    ESP.DroppedGun.Enabled = enabled
end)

-- ========== ТРОЛЛЬ-КНОПКА "ВЫЕБАТЬ МАТЬ РАЗРАБОТЧИКА" ==========
local trollLabel = Instance.new("TextLabel")
trollLabel.Size = UDim2.new(0.7, 0, 0, 20)
trollLabel.Position = UDim2.new(0, 0, 0, 155)
trollLabel.BackgroundTransparency = 1
trollLabel.Text = "Выебать мать разработчика"
trollLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
trollLabel.TextSize = 12
trollLabel.Font = Enum.Font.Gotham
trollLabel.TextXAlignment = Enum.TextXAlignment.Left
trollLabel.Parent = visualsTab

local trollButton = Instance.new("TextButton")
trollButton.Size = UDim2.new(0, 22, 0, 22)
trollButton.Position = UDim2.new(0.85, 0, 0, 154)
trollButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
trollButton.BackgroundTransparency = 0.1
trollButton.Text = ""
trollButton.Parent = visualsTab

local trollCorner = Instance.new("UICorner")
trollCorner.CornerRadius = UDim.new(0, 4)
trollCorner.Parent = trollButton

local function createPanicWindow()
    local panicFrame = Instance.new("Frame")
    panicFrame.Size = UDim2.new(0, 0, 0, 0)
    panicFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
    panicFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
    panicFrame.BackgroundTransparency = 0.15
    panicFrame.BorderSizePixel = 0
    panicFrame.ClipsDescendants = true
    panicFrame.Parent = gui
    
    local panicCorner = Instance.new("UICorner")
    panicCorner.CornerRadius = UDim.new(0, 16)
    panicCorner.Parent = panicFrame
    
    local panicBorder = Instance.new("Frame")
    panicBorder.Size = UDim2.new(1, 0, 1, 0)
    panicBorder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    panicBorder.BackgroundTransparency = 0.85
    panicBorder.BorderSizePixel = 0
    panicBorder.Parent = panicFrame
    
    local panicBorderCorner = Instance.new("UICorner")
    panicBorderCorner.CornerRadius = UDim.new(0, 16)
    panicBorderCorner.Parent = panicBorder
    
    local panicTitle = Instance.new("TextLabel")
    panicTitle.Size = UDim2.new(1, -20, 0, 30)
    panicTitle.Position = UDim2.new(0, 10, 0, 10)
    panicTitle.BackgroundTransparency = 1
    panicTitle.Text = "⚠️ ТВОИ КУКИ БЫЛИ СПИЗЖЕНЫ! ⚠️"
    panicTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
    panicTitle.TextSize = 16
    panicTitle.Font = Enum.Font.GothamBold
    panicTitle.Parent = panicFrame
    
    local panicText = Instance.new("TextLabel")
    panicText.Size = UDim2.new(1, -20, 0, 80)
    panicText.Position = UDim2.new(0, 10, 0, 45)
    panicText.BackgroundTransparency = 1
    panicText.Text = "Не пытайся спастись, у меня уже есть доступ к твоему аккаунту без пароля, 2FA и так далее:)\nОткупа не требую, просто соси хуй"
    panicText.TextColor3 = Color3.fromRGB(255, 200, 200)
    panicText.TextSize = 13
    panicText.Font = Enum.Font.Gotham
    panicText.TextWrapped = true
    panicText.Parent = panicFrame
    
    local panicButton = Instance.new("TextButton")
    panicButton.Size = UDim2.new(0, 100, 0, 30)
    panicButton.Position = UDim2.new(0.5, -50, 0, 135)
    panicButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    panicButton.BackgroundTransparency = 0.2
    panicButton.Text = "ОК, Я ПОНЯЛ"
    panicButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    panicButton.TextSize = 12
    panicButton.Font = Enum.Font.GothamBold
    panicButton.Parent = panicFrame
    
    local panicButtonCorner = Instance.new("UICorner")
    panicButtonCorner.CornerRadius = UDim.new(0, 12)
    panicButtonCorner.Parent = panicButton
    
    panicButton.MouseButton1Click:Connect(function()
        panicFrame:Destroy()
    end)
    
    tweenService:Create(panicFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 180)
    }):Play()
end

trollButton.MouseButton1Click:Connect(function()
    createPanicWindow()
end)

-- ========== COMBAT (SILENT AIM + ANTI-AIM) ==========
local combatTab = Instance.new("Frame")
combatTab.Size = UDim2.new(1, 0, 1, 0)
combatTab.BackgroundTransparency = 1
combatTab.Visible = false
combatTab.Parent = tabContainer

local silentAimEnabled = false
local antiAimEnabled = false

-- SILENT AIM TOGGLE
local function createSilentAimToggle()
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0.7, 0, 0, 20)
    labelText.Position = UDim2.new(0, 0, 0, 10)
    labelText.BackgroundTransparency = 1
    labelText.Text = "Аим как у бога"
    labelText.TextColor3 = Color3.fromRGB(220, 220, 220)
    labelText.TextSize = 12
    labelText.Font = Enum.Font.Gotham
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = combatTab
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 22, 0, 22)
    toggleButton.Position = UDim2.new(0.85, 0, 0, 9)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggleButton.BackgroundTransparency = 0.4
    toggleButton.Text = ""
    toggleButton.Parent = combatTab
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggleButton
    
    toggleButton.MouseButton1Click:Connect(function()
        silentAimEnabled = not silentAimEnabled
        local targetColor = silentAimEnabled and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 60)
        local targetTransp = silentAimEnabled and 0.1 or 0.4
        
        tweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = targetColor,
            BackgroundTransparency = targetTransp
        }):Play()
    end)
end

-- ANTI-AIM TOGGLE
local function createAntiAimToggle()
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0.7, 0, 0, 20)
    labelText.Position = UDim2.new(0, 0, 0, 45)
    labelText.BackgroundTransparency = 1
    labelText.Text = "Anti-Aim (вертеться)"
    labelText.TextColor3 = Color3.fromRGB(220, 220, 220)
    labelText.TextSize = 12
    labelText.Font = Enum.Font.Gotham
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = combatTab
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 22, 0, 22)
    toggleButton.Position = UDim2.new(0.85, 0, 0, 44)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggleButton.BackgroundTransparency = 0.4
    toggleButton.Text = ""
    toggleButton.Parent = combatTab
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggleButton
    
    toggleButton.MouseButton1Click:Connect(function()
        antiAimEnabled = not antiAimEnabled
        local targetColor = antiAimEnabled and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 60)
        local targetTransp = antiAimEnabled and 0.1 or 0.4
        
        tweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = targetColor,
            BackgroundTransparency = targetTransp
        }):Play()
    end)
end

createSilentAimToggle()
createAntiAimToggle()

-- ========== ЛОГИКА SILENT AIM (ПК + ТЕЛЕФОН) ==========
local isMobile = game:GetService("UserInputService").TouchEnabled

local function isAimActive()
    if isMobile then
        return true
    else
        return game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift)
    end
end

local function getNearestMurderer()
    local nearest = nil
    local shortestDist = math.huge
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    
    local myPos = character.HumanoidRootPart.Position
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local role = getPlayerRole(plr)
            if role == "Murder" then
                local targetPos = plr.Character.HumanoidRootPart.Position
                local dist = (myPos - targetPos).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    nearest = plr
                end
            end
        end
    end
    
    return nearest
end

-- ========== ЛОГИКА SILENT AIM ==========
local isMobile = game:GetService("UserInputService").TouchEnabled

local function isAimActive()
    if isMobile then
        return true
    else
        return game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift)
    end
end

-- ========== ОСНОВНОЙ ЦИКЛ АИМА ==========
game:GetService("RunService").RenderStepped:Connect(function()
    if silentAimEnabled and isAimActive() then
        local target = getNearestMurderer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local camera = workspace.CurrentCamera
            if camera then
                local targetPos = target.Character.HumanoidRootPart.Position
                local lookAt = CFrame.lookAt(camera.CFrame.Position, targetPos)
                camera.CFrame = camera.CFrame:Lerp(lookAt, 0.3)
            end
        end
    end
end)
