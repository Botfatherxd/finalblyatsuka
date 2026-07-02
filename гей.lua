-- ============================================================
-- KEBABICH STUDIO MM2 CHAMS v14.0 (ПЕРЕПИСАНО С НУЛЯ, СУКА!)
-- ДИЗАЙН: ЧЁРНЫЙ МИНИМАЛИЗМ, КРАСНЫЕ КНОПКИ, ОВАЛЬНАЯ КНОПКА
-- ФИЧИ: ESP + SILENT AIM + ANTI-AIM + ТРОЛЛЬ-КНОПКА
-- АВТОР: KEBABICH (ПОДПИШИСЬ, ПИЗДА!)
-- ============================================================

-- ===== ОСНОВНЫЕ ПЕРЕМЕННЫЕ =====
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
gui.Name = "KEBABICH_MENU"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local tweenService = game:GetService("TweenService")
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- ===== РАЗМЫТИЕ =====
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

-- ===== ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ =====
local menuVisible = false
local silentAimEnabled = false
local antiAimEnabled = false
local isMobile = userInput.TouchEnabled

-- ===== ESP =====
local ESP = {
    Murder = false,
    Sheriff = false,
    Innocent = false,
    Self = false,
    DroppedGun = false
}

-- ===== ФУНКЦИЯ ОПРЕДЕЛЕНИЯ РОЛИ =====
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
                    if name:find("knife") or name:find("murder") or name:find("кнайф") or name:find("крим") or name:find("нож") or name:find("киллер") or name:find("blade") or name:find("dagger") then
                        return "Murder"
                    elseif name:find("gun") or name:find("pistol") or name:find("sheriff") or name:find("пистолет") or name:find("револьвер") or name:find("revolver") or name:find("шоты") or name:find("ствол") then
                        return "Sheriff"
                    end
                end
            end
        end
    end
    
    return "Innocent"
end

-- ===== ОСНОВНОЙ ЦИКЛ ESP =====
runService.RenderStepped:Connect(function()
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
            
            if plr == player and ESP.Self then
                highlight.FillColor = Color3.fromRGB(255, 200, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 200, 0)
                highlight.Enabled = true
            elseif role == "Murder" and ESP.Murder then
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.Enabled = true
            elseif role == "Sheriff" and ESP.Sheriff then
                highlight.FillColor = Color3.fromRGB(0, 100, 255)
                highlight.OutlineColor = Color3.fromRGB(0, 100, 255)
                highlight.Enabled = true
            elseif role == "Innocent" and ESP.Innocent then
                highlight.FillColor = Color3.fromRGB(0, 255, 50)
                highlight.OutlineColor = Color3.fromRGB(0, 255, 50)
                highlight.Enabled = true
            else
                highlight.Enabled = false
            end
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(plr)
    if plr.Character then
        local highlight = plr.Character:FindFirstChild("ESP_Highlight")
        if highlight then highlight:Destroy() end
    end
end)

-- ===== КНОПКА-ОВАЛ =====
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

-- ===== ГЛАВНОЕ ОКНО =====
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 320)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -160)
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

-- ===== СТАРТОВЫЙ ФРЕЙМ =====
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
    startButton.BackgroundTransparency = 0.5
end)
startButton.MouseLeave:Connect(function()
    startButton.BackgroundTransparency = 0.2
end)

-- ===== ОСНОВНОЙ UI =====
local mainUI = Instance.new("Frame")
mainUI.Size = UDim2.new(1, 0, 1, 0)
mainUI.BackgroundTransparency = 1
mainUI.Visible = false
mainUI.Parent = mainFrame

-- ===== ШАПКА =====
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

-- ===== КАТЕГОРИИ =====
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
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
    btn.MouseLeave:Connect(function()
        if cat ~= activeTab then
            btn.TextColor3 = Color3.fromRGB(130, 130, 130)
        end
    end)
end

-- ===== КОНТЕЙНЕР ВКЛАДОК =====
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, -20, 0, 210)
tabContainer.Position = UDim2.new(0, 10, 0, 74)
tabContainer.BackgroundTransparency = 1
tabContainer.ClipsDescendants = true
tabContainer.Parent = mainUI

-- ===== VISUALS =====
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
        toggleButton.BackgroundColor3 = enabled and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 60)
        toggleButton.BackgroundTransparency = enabled and 0.1 or 0.4
        callback(enabled)
    end)
    
    return toggleButton
end

createToggle(visualsTab, 2, "Подсвети мразь", function(enabled)
    ESP.Murder = enabled
end)

createToggle(visualsTab, 32, "Подсвети шерифа", function(enabled)
    ESP.Sheriff = enabled
end)

createToggle(visualsTab, 62, "Бедные невинные", function(enabled)
    ESP.Innocent = enabled
end)

createToggle(visualsTab, 92, "Покажи себя, пидор", function(enabled)
    ESP.Self = enabled
end)

createToggle(visualsTab, 122, "Выпавший ствол", function(enabled)
    ESP.DroppedGun = enabled
end)

-- ===== ТРОЛЛЬ-КНОПКА =====
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
    panicFrame.Size = UDim2.new(0, 300, 0, 180)
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
end

trollButton.MouseButton1Click:Connect(function()
    createPanicWindow()
end)

-- ===== COMBAT =====
local combatTab = Instance.new("Frame")
combatTab.Size = UDim2.new(1, 0, 1, 0)
combatTab.BackgroundTransparency = 1
combatTab.Visible = false
combatTab.Parent = tabContainer

-- SILENT AIM TOGGLE
local function createCombatToggle(parent, yPos, label, callback)
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
        toggleButton.BackgroundColor3 = enabled and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 60)
        toggleButton.BackgroundTransparency = enabled and 0.1 or 0.4
        callback(enabled)
    end)
end

createCombatToggle(combatTab, 10, "Аим как у бога", function(enabled)
    silentAimEnabled = enabled
end)

createCombatToggle(combatTab, 45, "Anti-Aim (вертеться)", function(enabled)
    antiAimEnabled = enabled
end)

-- ===== SILENT AIM =====
local function isAimActive()
    if isMobile then
        return true
    else
        return userInput:IsKeyDown(Enum.KeyCode.LeftShift)
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

runService.RenderStepped:Connect(function()
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
    
    if antiAimEnabled then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local currentRot = hrp.Orientation.Y
            local newRot = currentRot + 80 * (1/60)
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(newRot), 0)
        end
    end
end)

-- ===== ANANAS =====
local ananasTab = Instance.new("Frame")
ananasTab.Size = UDim2.new(1, 0, 1, 0)
ananasTab.BackgroundTransparency = 1
ananasTab.Visible = false
ananasTab.Parent = tabContainer

local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(1, 0, 0, 24)
nameLabel.Position = UDim2.new(0, 0, 0, 30)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "made by kebabich"
nameLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
nameLabel.TextSize = 16
nameLabel.Font = Enum.Font.GothamBold
nameLabel.Parent = ananasTab

local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(1, 0, 0, 18)
subLabel.Position = UDim2.new(0, 0, 0, 58)
subLabel.BackgroundTransparency = 1
subLabel.Text = "subscribe meee :)"
subLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
subLabel.TextSize = 12
subLabel.Font = Enum.Font.Gotham
subLabel.Parent = ananasTab

local ananasEmoji = Instance.new("TextLabel")
ananasEmoji.Size = UDim2.new(0, 30, 0, 30)
ananasEmoji.Position = UDim2.new(0.5, -15, 0, 100)
ananasEmoji.BackgroundTransparency = 1
ananasEmoji.Text = "🍍"
ananasEmoji.TextScaled = true
ananasEmoji.Font = Enum.Font.GothamBold
ananasEmoji.Parent = ananasTab

runService.Heartbeat:Connect(function()
    if ananasEmoji and ananasEmoji.Parent then
        local scale = 1 + math.sin(tick() * 2) * 0.08
        ananasEmoji.Size = UDim2.new(0, 30 * scale, 0, 30 * scale)
    end
end)

-- ===== ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК =====
for cat, btn in pairs(catButtons) do
    btn.MouseButton1Click:Connect(function()
        if cat == activeTab then return end
        activeTab = cat

        for _, b in pairs(catButtons) do
            b.TextColor3 = Color3.fromRGB(130, 130, 130)
        end
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)

        for _, child in pairs(tabContainer:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = false
            end
        end

        if cat == "VISUALS" then
            visualsTab.Visible = true
        elseif cat == "COMBAT" then
            combatTab.Visible = true
        elseif cat == "ANANAS" then
            ananasTab.Visible = true
        end
    end)
end

-- ===== АКТИВАЦИЯ UI =====
startButton.MouseButton1Click:Connect(function()
    welcomeFrame.Visible = false
    mainUI.Visible = true
end)

-- ===== ОТКРЫТИЕ/ЗАКРЫТИЕ ПО КНОПКЕ =====
toggleButton.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    if menuVisible then
        mainFrame.Visible = true
        blur.Size = 10
    else
        mainFrame.Visible = false
        blur.Size = 0
    end
end)

-- ===== ЗАКРЫТИЕ ПО ESC =====
userInput.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape and menuVisible then
        toggleButton.MouseButton1Click:Fire()
    end
end)

print("[KEBABICH] СКРИПТ ЗАГРУЖЕН, ВСЁ РАБОТАЕТ, СУКА!")


-- ============================================================
-- FOV AIM ДЛЯ МАРДЕРА (НЕ ПЕРЕПИСЫВАЙ, ПРОСТО ВСТАВЬ В КОНЕЦ!)
-- ============================================================

local fovAimEnabled = false
local fovValue = 40  -- значение по умолчанию

-- СОЗДАЁМ ЭЛЕМЕНТЫ МЕНЮ ДЛЯ FOV AIM (в раздел COMBAT)
local function createFovAimToggle()
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0.7, 0, 0, 20)
    labelText.Position = UDim2.new(0, 0, 0, 80)  -- чуть ниже Anti-Aim
    labelText.BackgroundTransparency = 1
    labelText.Text = "FOV Aim для мардера"
    labelText.TextColor3 = Color3.fromRGB(220, 220, 220)
    labelText.TextSize = 12
    labelText.Font = Enum.Font.Gotham
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = combatTab

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 22, 0, 22)
    toggleButton.Position = UDim2.new(0.85, 0, 0, 79)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    toggleButton.BackgroundTransparency = 0.4
    toggleButton.Text = ""
    toggleButton.Parent = combatTab

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggleButton

    toggleButton.MouseButton1Click:Connect(function()
        fovAimEnabled = not fovAimEnabled
        toggleButton.BackgroundColor3 = fovAimEnabled and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 60)
        toggleButton.BackgroundTransparency = fovAimEnabled and 0.1 or 0.4
        -- ПОКАЗЫВАЕМ/СКРЫВАЕМ СЛАЙДЕР
        fovSlider.Visible = fovAimEnabled
        fovLabel.Visible = fovAimEnabled
        fovValueLabel.Visible = fovAimEnabled
    end)

    return toggleButton
end

-- СОЗДАЁМ СЛАЙДЕР ДЛЯ FOV
local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(0.7, 0, 0, 20)
fovLabel.Position = UDim2.new(0, 0, 0, 110)
fovLabel.BackgroundTransparency = 1
fovLabel.Text = "FOV (0-80):"
fovLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
fovLabel.TextSize = 12
fovLabel.Font = Enum.Font.Gotham
fovLabel.TextXAlignment = Enum.TextXAlignment.Left
fovLabel.Visible = false
fovLabel.Parent = combatTab

local fovValueLabel = Instance.new("TextLabel")
fovValueLabel.Size = UDim2.new(0, 30, 0, 20)
fovValueLabel.Position = UDim2.new(0.7, 0, 0, 110)
fovValueLabel.BackgroundTransparency = 1
fovValueLabel.Text = "40"
fovValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fovValueLabel.TextSize = 12
fovValueLabel.Font = Enum.Font.Gotham
fovValueLabel.TextXAlignment = Enum.TextXAlignment.Right
fovValueLabel.Visible = false
fovValueLabel.Parent = combatTab

local fovSlider = Instance.new("Frame")
fovSlider.Size = UDim2.new(0.5, 0, 0, 16)
fovSlider.Position = UDim2.new(0.15, 0, 0, 135)
fovSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
fovSlider.BackgroundTransparency = 0.4
fovSlider.Visible = false
fovSlider.Parent = combatTab

local fovSliderCorner = Instance.new("UICorner")
fovSliderCorner.CornerRadius = UDim.new(0, 8)
fovSliderCorner.Parent = fovSlider

local fovIndicator = Instance.new("Frame")
fovIndicator.Size = UDim2.new(0, 16, 0, 16)
fovIndicator.Position = UDim2.new(0.5, -8, 0, 0)
fovIndicator.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
fovIndicator.BackgroundTransparency = 0.1
fovIndicator.Parent = fovSlider

local fovIndicatorCorner = Instance.new("UICorner")
fovIndicatorCorner.CornerRadius = UDim.new(0, 8)
fovIndicatorCorner.Parent = fovIndicator

-- ЛОГИКА СЛАЙДЕРА
local draggingFov = false
fovSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFov = true
    end
end)

fovSlider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFov = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if draggingFov and fovSlider.Visible then
        local mousePos = player:GetMouse().X
        local sliderPos = fovSlider.AbsolutePosition.X
        local sliderSize = fovSlider.AbsoluteSize.X
        local relativePos = math.clamp((mousePos - sliderPos) / sliderSize, 0, 1)
        fovIndicator.Position = UDim2.new(relativePos, -8, 0, 0)
        fovValue = math.round(relativePos * 80)
        fovValueLabel.Text = tostring(fovValue)
    end
end)

-- СОЗДАЁМ ТОГГЛ
createFovAimToggle()

-- ===== ЛОГИКА FOV AIM =====
local function getFovTarget()
    local closest = nil
    local closestAngle = math.huge
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    
    local camera = workspace.CurrentCamera
    if not camera then return nil end
    local lookDirection = camera.CFrame.LookVector
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local role = getPlayerRole(plr)
            -- ЦЕЛИ: только невинные и шерифы (не мардеры!)
            if role == "Innocent" or role == "Sheriff" then
                local targetPos = plr.Character.HumanoidRootPart.Position
                local direction = (targetPos - camera.CFrame.Position).Unit
                local angle = math.deg(math.acos(lookDirection:Dot(direction)))
                
                -- Проверка угла
                if angle <= fovValue then
                    -- Проверка на стену (Raycast)
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                    raycastParams.FilterDescendantsInstances = {character}
                    local rayResult = workspace:Raycast(camera.CFrame.Position, direction * 500, raycastParams)
                    if not rayResult or rayResult.Instance:IsDescendantOf(plr.Character) then
                        if angle < closestAngle then
                            closestAngle = angle
                            closest = plr
                        end
                    end
                end
            end
        end
    end
    
    return closest
end

-- ДОБАВЛЯЕМ FOV AIM В ОСНОВНОЙ ЦИКЛ
local origRenderStepped = runService.RenderStepped.Connect
runService.RenderStepped:Connect(function()
    -- Оставляем старый Silent Aim (для мардера)
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
    
    -- НОВЫЙ FOV AIM ДЛЯ МАРДЕРА
    if fovAimEnabled then
        local target = getFovTarget()
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

print("[FOV AIM] ДЛЯ МАРДЕРА ЗАГРУЖЕН, СУКА!")
