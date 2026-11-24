local function __store_list(t, start, ...)
    for i = 1, select("#", ...) do
        t[start + i - 1] = (select(i, ...))
    end
end

local getgenv = getgenv or function()
    return _G
end

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local function GetGuiParent()
    local ok, cg = pcall(function()
        local c = game:GetService("CoreGui")
        local _ = c:GetChildren()
        return c
    end)
    if ok and cg then
        return cg
    end
    local lp = Players.LocalPlayer
    if lp then
        return lp:WaitForChild("PlayerGui")
    end
    return game:GetService("CoreGui")
end

local GuiParent = GetGuiParent()

if getgenv().Nousigi and GuiParent:FindFirstChild("Nousigi Hub GUI") then
    for _, child in ipairs(GuiParent:GetChildren()) do
        if string.find(child.Name, "Nousigi Hub") then
            child:Destroy()
        end
    end
end

if Lighting:FindFirstChild("NousigiFluentBlur") then
    Lighting.NousigiFluentBlur:Destroy()
end

getgenv().Nousigi = true

local tbl = {
    ["Border Color"] = Color3.fromRGB(255, 105, 105),
    ["Click Effect Color"] = Color3.fromRGB(255, 255, 255),
    ["Setting Icon Color"] = Color3.fromRGB(255, 130, 130),
    ["Logo Image"] = "rbxassetid://5009915795",
    ["Search Icon Color"] = Color3.fromRGB(240, 240, 245),
    ["Search Icon Highlight Color"] = Color3.fromRGB(255, 95, 95),
    ["GUI Text Color"] = Color3.fromRGB(242, 244, 248),
    ["Text Color"] = Color3.fromRGB(238, 240, 245),
    ["Placeholder Text Color"] = Color3.fromRGB(175, 180, 192),
    ["Title Text Color"] = Color3.fromRGB(255, 95, 95),
    ["Background Main Color"] = Color3.fromRGB(20, 22, 28),
    ["Background 1 Color"] = Color3.fromRGB(30, 33, 42),
    ["Background 1 Transparency"] = 0.42,
    ["Background 2 Color"] = Color3.fromRGB(44, 48, 60),
    ["Background 3 Color"] = Color3.fromRGB(54, 58, 72),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(255, 95, 95),
    ["Section Text Color"] = Color3.fromRGB(255, 110, 110),
    ["Section Underline Color"] = Color3.fromRGB(255, 95, 95),
    ["Toggle Border Color"] = Color3.fromRGB(255, 95, 95),
    ["Toggle Checked Color"] = Color3.fromRGB(245, 248, 255),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 190, 202),
    ["Button Color"] = Color3.fromRGB(255, 95, 95),
    ["Label Color"] = Color3.fromRGB(240, 242, 248),
    ["Dropdown Icon Color"] = Color3.fromRGB(235, 238, 245),
    ["Dropdown Selected Color"] = Color3.fromRGB(255, 95, 95),
    ["Dropdown Selected Check Color"] = Color3.fromRGB(255, 105, 105),
    ["Textbox Highlight Color"] = Color3.fromRGB(255, 95, 95),
    ["Box Highlight Color"] = Color3.fromRGB(255, 95, 95),
    ["Slider Line Color"] = Color3.fromRGB(95, 102, 120),
    ["Slider Highlight Color"] = Color3.fromRGB(255, 95, 95),
    ["Tween Animation 1 Speed"] = 0.22,
    ["Tween Animation 2 Speed"] = 0.25,
    ["Tween Animation 3 Speed"] = 0.18,
    ["Text Stroke Transparency"] = 0.78,
}

local tbl2 = {
    ["Page Selected Color"] = Color3.fromRGB(96, 185, 255),
    ["Section Underline Color"] = Color3.fromRGB(96, 185, 255),
    ["Toggle Border Color"] = Color3.fromRGB(96, 185, 255),
    ["Toggle Checked Color"] = Color3.fromRGB(245, 250, 255),
    ["Button Color"] = Color3.fromRGB(96, 185, 255),
    ["Dropdown Selected Color"] = Color3.fromRGB(96, 185, 255),
    ["Dropdown Selected Check Color"] = Color3.fromRGB(96, 185, 255),
    ["Textbox Highlight Color"] = Color3.fromRGB(96, 185, 255),
    ["Box Highlight Color"] = Color3.fromRGB(96, 185, 255),
    ["Slider Highlight Color"] = Color3.fromRGB(96, 185, 255),
    ["Background Main Color"] = Color3.fromRGB(16, 20, 28),
    ["Background 1 Color"] = Color3.fromRGB(26, 32, 44),
    ["Background 1 Transparency"] = 0.42,
    ["Background 2 Color"] = Color3.fromRGB(38, 46, 62),
    ["Background 3 Color"] = Color3.fromRGB(48, 58, 76),
    ["Background Image"] = "",
    ["GUI Text Color"] = Color3.fromRGB(242, 246, 252),
    ["Text Color"] = Color3.fromRGB(238, 242, 248),
    ["Title Text Color"] = Color3.fromRGB(115, 198, 255),
    ["Section Text Color"] = Color3.fromRGB(220, 232, 248),
    ["Placeholder Text Color"] = Color3.fromRGB(168, 178, 194),
    ["Toggle Desc Color"] = Color3.fromRGB(184, 194, 210),
    ["Label Color"] = Color3.fromRGB(238, 242, 248),
    ["Border Color"] = Color3.fromRGB(140, 175, 220),
    ["Text Stroke Transparency"] = 0.85,
    ["Setting Icon Color"] = Color3.fromRGB(225, 235, 250),
    ["Dropdown Icon Color"] = Color3.fromRGB(225, 235, 250),
    ["Search Icon Color"] = Color3.fromRGB(235, 242, 252),
    ["Search Icon Highlight Color"] = Color3.fromRGB(115, 198, 255),
    ["Logo Image"] = "rbxassetid://5009915795",
    ["Click Effect Color"] = Color3.fromRGB(255, 255, 255),
    ["Slider Line Color"] = Color3.fromRGB(84, 102, 130),
    ["Tween Animation 1 Speed"] = 0.22,
    ["Tween Animation 2 Speed"] = 0.25,
    ["Tween Animation 3 Speed"] = 0.18,
}

local genv = getgenv()
genv.UIColor = getgenv().T1 and tbl or tbl2
getgenv().UIToggled = false

local function GetUIColor(key, fallback)
    local uc = getgenv().UIColor
    if type(uc) == "table" and uc[key] ~= nil then
        return uc[key]
    end
    return fallback
end

local tbl3 = {}
tbl3.Options = tbl3.Options or {}
tbl3._TitleMap = tbl3._TitleMap or {}

tbl3.RegisterOption = function(arg, arg2, arg3)
    if type(arg2) ~= "table" then return end
    local title = arg2.Title
    if not title then return end
    local tbl4 = {
        title = title,
        callback = arg3,
        Page_Name = arg2.Page_Name or "",
        Section_Name = arg2.Section_Name or "",
        search = arg2.Search or false,
        priority = arg2.Priority or false,
        selected = arg2.Selected or false,
        box = arg2.Box or false,
        slider = arg2.Slider or false,
        button = arg2.Button or false,
        textlabel = arg2.TextLabel or false,
        min = arg2.Min,
        max = arg2.Max,
        step = arg2.Step,
        list = arg2.List,
        value = arg2.Default,
        FunctionCreate = arg2.FunctionCreate,
    }

    if arg2.Box then tbl4.type = "box"
    elseif arg2.Button then tbl4.type = "button"
    elseif arg2.TextLabel then tbl4.type = "textlabel"
    elseif arg2.Slider and arg2.Min and arg2.Max then tbl4.type = "slider"
    elseif typeof(arg2.Default) == "boolean" then tbl4.type = "toggle"
    elseif arg2.Slider and type(arg2.List) == "table" then tbl4.type = "slider_dropdown"
    elseif arg2.Priority then tbl4.type = "priority_dropdown"
    elseif arg2.Selected then tbl4.type = "multi_toggle"
    else tbl4.type = "dropdown" end

    local tbl5 = {}
    for _, v2 in ipairs({
        {"title", tbl4.title}, {"callback", tbl4.callback}, {"Page_Name", tbl4.Page_Name},
        {"Section_Name", tbl4.Section_Name}, {"search", tbl4.search}, {"priority", tbl4.priority},
        {"selected", tbl4.selected}, {"box", tbl4.box}, {"slider", tbl4.slider},
        {"min", tbl4.min}, {"max", tbl4.max}, {"step", tbl4.step}, {"list", tbl4.list},
        {"value", tbl4.value}, {"FunctionCreate", tbl4.FunctionCreate}, {"type", tbl4.type},
    }) do
        tbl5[v2[1]] = v2[2]
    end

    tbl3.Options[title] = tbl5
    tbl3._TitleMap[title] = arg2
    return tbl5
end

--// FLUENT GLASS ENGINE & ANIMATION SYSTEM
local GlassState = {
    MainTransparency = 0.24,
    PanelTransparency = 0.44,
    CardTransparency = 0.52,
    BorderTransparency = 0.48,
    ShadowTransparency = 0.40,
    CornerRadius = 10,
    AnimationSpeed = 0.22,
    UIScale = 1.0,
    RippleEnabled = true,
    BounceEnabled = true,
    WorldBlurEnabled = false,
    WorldBlurSize = 10,
    AccentColor = GetUIColor("Title Text Color", Color3.fromRGB(115, 198, 255)),
    MainColor = GetUIColor("Background Main Color", Color3.fromRGB(16, 20, 28)),
    PanelColor = GetUIColor("Background 1 Color", Color3.fromRGB(26, 32, 44)),
    CardColor = GetUIColor("Background 2 Color", Color3.fromRGB(38, 46, 62)),
    BorderColor = GetUIColor("Border Color", Color3.fromRGB(140, 175, 220)),
    TextColor = GetUIColor("Text Color", Color3.fromRGB(238, 242, 248)),
}

local ThemeListeners = {}
local function RegisterThemeListener(listenerFn)
    table.insert(ThemeListeners, listenerFn)
end

local BlurInstance = nil
local function UpdateWorldBlur()
    pcall(function()
        local shouldBlur = GlassState.WorldBlurEnabled and getgenv().UIToggled
        if shouldBlur then
            if not BlurInstance or not BlurInstance.Parent then
                BlurInstance = Instance.new("BlurEffect")
                BlurInstance.Name = "NousigiFluentBlur"
                BlurInstance.Size = 0
                BlurInstance.Parent = Lighting
            end
            BlurInstance.Enabled = true
            TweenService:Create(BlurInstance, TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = GlassState.WorldBlurSize
            }):Play()
        elseif BlurInstance and BlurInstance.Parent then
            local tw = TweenService:Create(BlurInstance, TweenInfo.new(0.20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = 0
            })
            tw:Play()
            tw.Completed:Connect(function()
                if BlurInstance and not (GlassState.WorldBlurEnabled and getgenv().UIToggled) then
                    BlurInstance.Enabled = false
                end
            end)
        end
    end)
end

local function SyncUIColorTable()
    local c = getgenv().UIColor
    if type(c) ~= "table" then
        c = {}
        getgenv().UIColor = c
    end
    local acc = GlassState.AccentColor
    c["Title Text Color"] = acc
    c["Page Selected Color"] = acc
    c["Section Underline Color"] = acc
    c["Toggle Border Color"] = acc
    c["Button Color"] = acc
    c["Dropdown Selected Color"] = acc
    c["Dropdown Selected Check Color"] = acc
    c["Textbox Highlight Color"] = acc
    c["Box Highlight Color"] = acc
    c["Slider Highlight Color"] = acc
    c["Search Icon Highlight Color"] = acc
    c["Section Text Color"] = acc:Lerp(Color3.new(1, 1, 1), 0.25)
    c["Background Main Color"] = GlassState.MainColor
    c["Background 1 Color"] = GlassState.PanelColor
    c["Background 2 Color"] = GlassState.CardColor
    c["Background 3 Color"] = GlassState.CardColor:Lerp(Color3.new(1, 1, 1), 0.08)
    c["Background 1 Transparency"] = GlassState.CardTransparency
    c["Border Color"] = GlassState.BorderColor
    c["Text Color"] = GlassState.TextColor
    c["GUI Text Color"] = GlassState.TextColor
    c["Label Color"] = GlassState.TextColor
    local spd = math.max(0.03, GlassState.AnimationSpeed)
    c["Tween Animation 1 Speed"] = spd
    c["Tween Animation 2 Speed"] = spd * 1.1
    c["Tween Animation 3 Speed"] = spd * 0.85
end

local function ApplyGlassTheme()
    SyncUIColorTable()
    for i = #ThemeListeners, 1, -1 do
        local ok = pcall(ThemeListeners[i])
        if not ok then
            table.remove(ThemeListeners, i)
        end
    end
    UpdateWorldBlur()
end

local function CreateGlassStroke(parent, thickness, transparencyOffset)
    local stroke = Instance.new("UIStroke", parent)
    stroke.Thickness = thickness or 1
    pcall(function()
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    end)
    stroke.Color = Color3.new(1, 1, 1)
    stroke.Transparency = math.clamp(GlassState.BorderTransparency + (transparencyOffset or 0), 0, 1)

    local grad = Instance.new("UIGradient", stroke)
    grad.Rotation = 135
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, GlassState.BorderColor),
        ColorSequenceKeypoint.new(1, GlassState.AccentColor),
    })
    grad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.05),
        NumberSequenceKeypoint.new(0.5, 0.45),
        NumberSequenceKeypoint.new(1, 0.15),
    })

    RegisterThemeListener(function()
        if not stroke.Parent then return end
        stroke.Transparency = math.clamp(GlassState.BorderTransparency + (transparencyOffset or 0), 0, 1)
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, GlassState.BorderColor),
            ColorSequenceKeypoint.new(1, GlassState.AccentColor),
        })
    end)

    return stroke, grad
end

local function SpawnRipple(container, inputPos, color)
    if not GlassState.RippleEnabled or not container or not container.Parent then return end
    container.ClipsDescendants = true
    local absPos, absSize = container.AbsolutePosition, container.AbsoluteSize
    local lx = inputPos and math.clamp(inputPos.X - absPos.X, 0, math.max(1, absSize.X)) or absSize.X * 0.5
    local ly = inputPos and math.clamp(inputPos.Y - absPos.Y, 0, math.max(1, absSize.Y)) or absSize.Y * 0.5
    local maxDim = math.max(absSize.X, absSize.Y, 40) * 2.5

    local ripple = Instance.new("Frame", container)
    ripple.Name = "FluentRipple"
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.Position = UDim2.new(0, lx, 0, ly)
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.BackgroundColor3 = color or GetUIColor("Click Effect Color", Color3.new(1, 1, 1))
    ripple.BackgroundTransparency = 0.46
    ripple.BorderSizePixel = 0
    ripple.ZIndex = container.ZIndex + 6
    Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)

    local tw = TweenService:Create(ripple, TweenInfo.new(math.max(0.28, GlassState.AnimationSpeed * 1.65), Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, maxDim, 0, maxDim),
        BackgroundTransparency = 1,
    })
    tw:Play()
    tw.Completed:Connect(function()
        if ripple.Parent then ripple:Destroy() end
    end)
end

local function AttachClickJuice(triggerButton, visualTarget, opts)
    opts = opts or {}
    local hoverScale = opts.HoverScale or 1.015
    local pressScale = opts.PressScale or 0.965
    local hoverGlowAlpha = opts.HoverTransparency or 0.90
    local rippleTarget = opts.RippleTarget or visualTarget

    local uiScale = visualTarget:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", visualTarget)
    uiScale.Scale = 1

    local hoverOverlay = nil
    if not opts.NoHoverOverlay then
        hoverOverlay = Instance.new("Frame", visualTarget)
        hoverOverlay.Name = "FluentHoverOverlay"
        hoverOverlay.Size = UDim2.new(1, 0, 1, 0)
        hoverOverlay.BackgroundColor3 = Color3.new(1, 1, 1)
        hoverOverlay.BackgroundTransparency = 1
        hoverOverlay.BorderSizePixel = 0
        hoverOverlay.ZIndex = visualTarget.ZIndex + 1
        local c = visualTarget:FindFirstChildOfClass("UICorner")
        if c then
            local hc = Instance.new("UICorner", hoverOverlay)
            hc.CornerRadius = c.CornerRadius
            c:GetPropertyChangedSignal("CornerRadius"):Connect(function()
                hc.CornerRadius = c.CornerRadius
            end)
        end
    end

    local isHovered, isPressed = false, false
    local function playScale(targetScale, style, spdMult)
        if not GlassState.BounceEnabled then
            uiScale.Scale = 1
            return
        end
        TweenService:Create(uiScale, TweenInfo.new(math.max(0.06, GlassState.AnimationSpeed * (spdMult or 0.7)), style or Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Scale = targetScale
        }):Play()
    end

    triggerButton.MouseEnter:Connect(function()
        isHovered = true
        if not isPressed then playScale(hoverScale, Enum.EasingStyle.Quad, 0.65) end
        if hoverOverlay then
            TweenService:Create(hoverOverlay, TweenInfo.new(math.max(0.08, GlassState.AnimationSpeed * 0.7), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = hoverGlowAlpha
            }):Play()
        end
    end)

    triggerButton.MouseLeave:Connect(function()
        isHovered, isPressed = false, false
        playScale(1, Enum.EasingStyle.Quad, 0.75)
        if hoverOverlay then
            TweenService:Create(hoverOverlay, TweenInfo.new(math.max(0.08, GlassState.AnimationSpeed * 0.7), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1
            }):Play()
        end
    end)

    triggerButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isPressed = true
            playScale(pressScale, Enum.EasingStyle.Quad, 0.45)
            SpawnRipple(rippleTarget, input.Position, opts.RippleColor or GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.45))
        end
    end)

    triggerButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if isPressed then
                isPressed = false
                playScale(isHovered and hoverScale or 1, Enum.EasingStyle.Back, 0.9)
            end
        end
    end)

    return uiScale, hoverOverlay
end

local cac = false
local function fn(arg, arg2)
    local dragging, v2, position, position2 = false, nil, nil, nil
    arg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            position = input.Position
            position2 = arg2.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    arg.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            v2 = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == v2 and dragging then
            local n = input.Position - position
            local targetPos = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
            if not djtmemay and cac then
                TweenService:Create(arg2, TweenInfo.new(0.06, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = targetPos}):Play()
            elseif not djtmemay and not cac then
                TweenService:Create(arg2, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
            end
        end
    end)
end

--// CORE SCREENGUIS
local tbl4 = {Gui = Instance.new("ScreenGui")}
tbl4.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.Gui.Name = "Nousigi Hub GUI"
tbl4.Gui.ResetOnSpawn = false
tbl4.Gui.DisplayOrder = 999999
tbl4.Gui.Enabled = false
getgenv().ReadyForGuiLoaded = false

spawn(function()
    repeat task.wait() until getgenv().ReadyForGuiLoaded
    if getgenv().UIToggled then
        tbl4.Gui.Enabled = true
        UpdateWorldBlur()
    end
end)

tbl4.NotiGui = Instance.new("ScreenGui")
tbl4.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.NotiGui.Name = "Nousigi Hub Notification"
tbl4.NotiGui.ResetOnSpawn = false
tbl4.NotiGui.DisplayOrder = 1000001

tbl4.HideGui = Instance.new("ScreenGui")
tbl4.HideGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.HideGui.Name = "Nousigi Hub Btn"
tbl4.HideGui.ResetOnSpawn = false
tbl4.HideGui.DisplayOrder = 1000000

--// FLOATING TOGGLE PILL (BOTTOM-LEFT)
local textButton = Instance.new("TextButton", tbl4.HideGui)
textButton.BackgroundTransparency = 1
textButton.Text = ""
textButton.AnchorPoint = Vector2.new(0, 1)
textButton.Size = UDim2.new(0, 54, 0, 54)
textButton.Position = UDim2.new(0, 16, 1, -16)
textButton.ZIndex = 2

local frame = Instance.new("Frame", textButton)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Name = "dut dit"
frame.BackgroundColor3 = GlassState.MainColor
frame.BackgroundTransparency = getgenv().UIToggled and 0.12 or 0.28
Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0)
CreateGlassStroke(frame, 1.4, -0.1)

local btnShadow = Instance.new("ImageLabel", frame)
btnShadow.BackgroundTransparency = 1
btnShadow.Image = "rbxassetid://5028857084"
btnShadow.ImageColor3 = Color3.new(0, 0, 0)
btnShadow.ImageTransparency = 0.45
btnShadow.ScaleType = Enum.ScaleType.Slice
btnShadow.SliceCenter = Rect.new(24, 24, 276, 276)
btnShadow.Size = UDim2.new(1, 22, 1, 22)
btnShadow.Position = UDim2.new(0.5, 0, 0.5, 2)
btnShadow.AnchorPoint = Vector2.new(0.5, 0.5)
btnShadow.ZIndex = frame.ZIndex - 1

local imageLabel = Instance.new("ImageLabel", frame)
imageLabel.Image = GetUIColor("Logo Image", "rbxassetid://5009915795")
imageLabel.BackgroundTransparency = 1
local logoSize = getgenv().UIToggled and (getgenv().T1 and 32 or 38) or (getgenv().T1 and 26 or 30)
imageLabel.Size = UDim2.new(0, logoSize, 0, logoSize)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
imageLabel.ScaleType = Enum.ScaleType.Fit

AttachClickJuice(textButton, frame, {HoverScale = 1.09, PressScale = 0.88, HoverTransparency = 0.85})
RegisterThemeListener(function()
    if frame.Parent then frame.BackgroundColor3 = GlassState.MainColor end
end)

local MainWindowScaleRef = nil
local ActiveToggleTween = nil

tbl3.ToggleUI = function()
    getgenv().UIToggled = not getgenv().UIToggled
    local isShown = getgenv().UIToggled
    local targetSize = isShown and (getgenv().T1 and 32 or 38) or (getgenv().T1 and 26 or 30)
    local dur = math.max(0.12, GlassState.AnimationSpeed)

    TweenService:Create(imageLabel, TweenInfo.new(dur, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, targetSize, 0, targetSize)
    }):Play()
    TweenService:Create(frame, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = isShown and 0.12 or 0.30
    }):Play()

    if ActiveToggleTween then
        pcall(function() ActiveToggleTween:Cancel() end)
        ActiveToggleTween = nil
    end

    if GuiParent:FindFirstChild("Nousigi Hub GUI") then
        for _, child in ipairs(GuiParent:GetChildren()) do
            if child.Name == "Nousigi Hub GUI" then
                if isShown then
                    child.Enabled = true
                    if MainWindowScaleRef then
                        MainWindowScaleRef.Scale = GlassState.UIScale * 0.90
                        ActiveToggleTween = TweenService:Create(MainWindowScaleRef, TweenInfo.new(math.max(0.18, dur * 1.1), Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Scale = GlassState.UIScale
                        })
                        ActiveToggleTween:Play()
                    end
                elseif MainWindowScaleRef then
                    local tw = TweenService:Create(MainWindowScaleRef, TweenInfo.new(math.max(0.10, dur * 0.65), Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        Scale = GlassState.UIScale * 0.92
                    })
                    ActiveToggleTween = tw
                    tw:Play()
                    tw.Completed:Connect(function()
                        if not getgenv().UIToggled and child.Parent then
                            child.Enabled = false
                        end
                    end)
                else
                    child.Enabled = false
                end
            end
        end
    end
    UpdateWorldBlur()
end

local renderConn = nil
tbl3.DestroyUI = function()
    if renderConn then renderConn:Disconnect(); renderConn = nil end
    if BlurInstance and BlurInstance.Parent then BlurInstance:Destroy(); BlurInstance = nil end
    if GuiParent:FindFirstChild("Nousigi Hub GUI") then
        for _, child in ipairs(GuiParent:GetChildren()) do
            if string.find(child.Name, "Nousigi Hub") then
                child:Destroy()
            end
        end
    end
end

local flag, v2, position, position2, n3 = false, nil, nil, nil, 0
local function fn2(arg)
    local n4 = arg.Position - position
    textButton.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n4.X, position2.Y.Scale, position2.Y.Offset + n4.Y)
end

textButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        n3 = tick()
        position = input.Position
        position2 = textButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then flag = false; n3 = 0 end
        end)
    end
end)
textButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flag = false; n3 = 0
    end
end)
textButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        v2 = input
    end
end)
renderConn = RunService.RenderStepped:Connect(function()
    if not tbl4.HideGui.Parent then
        if renderConn then renderConn:Disconnect(); renderConn = nil end
        return
    end
    if n3 > 0 and tick() - n3 >= 0.1 and not flag then flag = true end
    if flag and v2 then fn2(v2) end
end)
textButton.MouseButton1Click:Connect(function()
    tbl3.ToggleUI()
end)

--// NOTIFICATIONS
local frame2 = Instance.new("Frame", tbl4.NotiGui)
frame2.Name = "NotiContainer"
frame2.AnchorPoint = Vector2.new(1, 1)
frame2.BackgroundTransparency = 1
frame2.Position = UDim2.new(1, -12, 1, -12)
frame2.Size = UDim2.new(0, 355, 1, -24)

local uiListLayout = Instance.new("UIListLayout", frame2)
uiListLayout.Name = "NotiList"
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
uiListLayout.Padding = UDim.new(0, 8)

tbl4.Gui.Parent = GuiParent
tbl4.NotiGui.Parent = GuiParent
tbl4.HideGui.Parent = GuiParent

tbl4.Getcolor = function(arg)
    return {math.floor(arg.r * 255), math.floor(arg.g * 255), math.floor(arg.b * 255)}
end

local function fn3(arg)
    arg = arg or {}
    getgenv().TitleNameNoti = arg.Title or ""
    local desc, n4 = arg.Desc, arg.ShowTime or 10

    local frame3 = Instance.new("Frame", frame2)
    frame3.Name = "NotiFrame"
    frame3.BackgroundTransparency = 1
    frame3.Size = UDim2.new(1, 0, 0, 0)
    frame3.AutomaticSize = Enum.AutomaticSize.Y

    local frame4 = Instance.new("Frame", frame3)
    frame4.Name = "Noticontainer"
    frame4.Position = UDim2.new(1, 40, 0, 0)
    frame4.Size = UDim2.new(1, 0, 0, 0)
    frame4.AutomaticSize = Enum.AutomaticSize.Y
    frame4.BackgroundColor3 = GlassState.MainColor
    frame4.BackgroundTransparency = math.clamp(GlassState.MainTransparency, 0.1, 0.88)

    local notiPad = Instance.new("UIPadding", frame4)
    notiPad.PaddingLeft = UDim.new(0, 10)
    notiPad.PaddingRight = UDim.new(0, 10)
    notiPad.PaddingTop = UDim.new(0, 8)
    notiPad.PaddingBottom = UDim.new(0, 10)

    Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, GlassState.CornerRadius)
    CreateGlassStroke(frame4, 1, -0.05)

    local notiGrad = Instance.new("UIGradient", frame4)
    notiGrad.Rotation = 120
    notiGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.08)),
        ColorSequenceKeypoint.new(1, GlassState.MainColor),
    })

    local frame5 = Instance.new("Frame", frame4)
    frame5.Name = "Topnoti"
    frame5.BackgroundTransparency = 1
    frame5.Size = UDim2.new(1, 0, 0, 26)

    local imageLabel2 = Instance.new("ImageLabel", frame5)
    imageLabel2.Name = "Ruafimg"
    imageLabel2.BackgroundTransparency = 1
    imageLabel2.Position = UDim2.new(0, 0, 0.5, -12)
    imageLabel2.Size = UDim2.new(0, 24, 0, 24)
    imageLabel2.Image = GetUIColor("Logo Image", "rbxassetid://5009915795")
    imageLabel2.ScaleType = Enum.ScaleType.Fit
    Instance.new("UICorner", imageLabel2).CornerRadius = UDim.new(1, 0)

    local col = tbl4.Getcolor(GetUIColor("Title Text Color", GlassState.AccentColor))
    local textLabel = Instance.new("TextLabel", frame5)
    textLabel.Name = "TextLabelNoti"
    textLabel.Text = "<font color=\"rgb(" .. col[1] .. "," .. col[2] .. "," .. col[3] .. ")\">QHuy Hub</font> " .. getgenv().TitleNameNoti
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 32, 0, 0)
    textLabel.Size = UDim2.new(1, -60, 1, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.RichText = true
    textLabel.TextColor3 = GetUIColor("GUI Text Color", GlassState.TextColor)

    local frame6 = Instance.new("Frame", frame5)
    frame6.Name = "CloseContainer"
    frame6.AnchorPoint = Vector2.new(1, 0.5)
    frame6.BackgroundColor3 = GlassState.CardColor
    frame6.BackgroundTransparency = 0.65
    frame6.Position = UDim2.new(1, 0, 0.5, 0)
    frame6.Size = UDim2.new(0, 22, 0, 22)
    Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)

    local imageLabel3 = Instance.new("ImageLabel", frame6)
    imageLabel3.Name = "CloseImage"
    imageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel3.BackgroundTransparency = 1
    imageLabel3.Size = UDim2.new(0, 14, 0, 14)
    imageLabel3.Image = "rbxassetid://3926305904"
    imageLabel3.ImageRectOffset = Vector2.new(284, 4)
    imageLabel3.ImageRectSize = Vector2.new(24, 24)
    imageLabel3.ImageColor3 = GetUIColor("Search Icon Color", Color3.new(1, 1, 1))

    local textButton2 = Instance.new("TextButton", frame6)
    textButton2.BackgroundTransparency = 1
    textButton2.Size = UDim2.new(1, 0, 1, 0)
    textButton2.Text = ""
    AttachClickJuice(textButton2, frame6, {HoverScale = 1.12, PressScale = 0.85})

    if desc then
        local textLabel2 = Instance.new("TextLabel", frame4)
        textLabel2.Name = "TextColor"
        textLabel2.BackgroundTransparency = 1
        textLabel2.Position = UDim2.new(0, 2, 0, 30)
        textLabel2.Size = UDim2.new(1, -4, 0, 0)
        textLabel2.Font = Enum.Font.GothamSemibold
        textLabel2.Text = desc
        textLabel2.TextSize = 13
        textLabel2.TextXAlignment = Enum.TextXAlignment.Left
        textLabel2.RichText = true
        textLabel2.TextColor3 = GetUIColor("Text Color", GlassState.TextColor)
        textLabel2.AutomaticSize = Enum.AutomaticSize.Y
        textLabel2.TextWrapped = true
    end

    local closed = false
    local function fn4()
        if closed or not frame3.Parent then return end
        closed = true
        local tw = TweenService:Create(frame4, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 40, 0, 0),
            BackgroundTransparency = 1,
        })
        tw:Play()
        tw.Completed:Connect(function()
            if frame3.Parent then frame3:Destroy() end
        end)
    end

    TweenService:Create(frame4, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()

    textButton2.MouseEnter:Connect(function()
        TweenService:Create(imageLabel3, TweenInfo.new(0.15), {ImageColor3 = GetUIColor("Search Icon Highlight Color", GlassState.AccentColor)}):Play()
    end)
    textButton2.MouseLeave:Connect(function()
        TweenService:Create(imageLabel3, TweenInfo.new(0.15), {ImageColor3 = GetUIColor("Search Icon Color", Color3.new(1, 1, 1))}):Play()
    end)
    textButton2.MouseButton1Click:Connect(fn4)
    task.delay(n4, fn4)
end

tbl3.CreateNoti = function(arg, arg2)
    if type(arg) == "table" and arg == tbl3 then
        arg = arg2
        arg2 = nil
    end
    arg = arg or {}
    if not getgenv().Config or arg2 then
        local ok, result = pcall(function() fn3(arg) end)
        if not ok or result then
            pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = "QHuy Hub",
                    Text = arg.Desc or "",
                    Icon = "rbxassetid://16791647668",
                    Duration = arg.ShowTime or 10,
                })
            end)
        end
    end
end

--// SETTINGS STUDIO OVERLAY
local function BuildSettingsOverlay(mainContainer, settingsIcon, settingsTrigger)
    local settingsOverlay = Instance.new("Frame", mainContainer)
    settingsOverlay.Name = "FluentSettingsOverlay"
    settingsOverlay.Position = UDim2.new(0, 8, 0, 40)
    settingsOverlay.Size = UDim2.new(1, -16, 1, -48)
    settingsOverlay.BackgroundColor3 = GlassState.MainColor:Lerp(GlassState.PanelColor, 0.45)
    settingsOverlay.BackgroundTransparency = math.clamp(GlassState.MainTransparency * 0.85, 0.06, 0.85)
    settingsOverlay.ZIndex = 30
    settingsOverlay.Visible = false
    settingsOverlay.ClipsDescendants = true

    local settingsCorner = Instance.new("UICorner", settingsOverlay)
    settingsCorner.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 1))
    CreateGlassStroke(settingsOverlay, 1.2, -0.05)

    local settingsScale = Instance.new("UIScale", settingsOverlay)
    settingsScale.Scale = 0.96

    RegisterThemeListener(function()
        if settingsOverlay.Parent then
            settingsOverlay.BackgroundColor3 = GlassState.MainColor:Lerp(GlassState.PanelColor, 0.45)
            settingsOverlay.BackgroundTransparency = math.clamp(GlassState.MainTransparency * 0.85, 0.06, 0.85)
            settingsCorner.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 1))
        end
    end)

    local sHeader = Instance.new("Frame", settingsOverlay)
    sHeader.BackgroundTransparency = 1
    sHeader.Size = UDim2.new(1, 0, 0, 36)
    sHeader.ZIndex = 31

    local sTitle = Instance.new("TextLabel", sHeader)
    sTitle.BackgroundTransparency = 1
    sTitle.Position = UDim2.new(0, 14, 0, 0)
    sTitle.Size = UDim2.new(1, -100, 1, 0)
    sTitle.Font = Enum.Font.GothamBold
    sTitle.Text = "Fluent Glass Studio  •  Customization"
    sTitle.TextSize = 14
    sTitle.TextXAlignment = Enum.TextXAlignment.Left
    sTitle.TextColor3 = GlassState.TextColor
    sTitle.ZIndex = 31

    local sCloseHolder = Instance.new("Frame", sHeader)
    sCloseHolder.AnchorPoint = Vector2.new(1, 0.5)
    sCloseHolder.Position = UDim2.new(1, -10, 0.5, 0)
    sCloseHolder.Size = UDim2.new(0, 64, 0, 24)
    sCloseHolder.BackgroundColor3 = GlassState.AccentColor
    sCloseHolder.BackgroundTransparency = 0.25
    sCloseHolder.ZIndex = 32
    Instance.new("UICorner", sCloseHolder).CornerRadius = UDim.new(0, 6)

    local sCloseBtn = Instance.new("TextButton", sCloseHolder)
    sCloseBtn.BackgroundTransparency = 1
    sCloseBtn.Size = UDim2.new(1, 0, 1, 0)
    sCloseBtn.Font = Enum.Font.GothamBold
    sCloseBtn.Text = "Done"
    sCloseBtn.TextSize = 12
    sCloseBtn.TextColor3 = Color3.new(1, 1, 1)
    sCloseBtn.ZIndex = 33
    AttachClickJuice(sCloseBtn, sCloseHolder, {HoverScale = 1.06, PressScale = 0.94})

    local sScroll = Instance.new("ScrollingFrame", settingsOverlay)
    sScroll.BackgroundTransparency = 1
    sScroll.BorderSizePixel = 0
    sScroll.Position = UDim2.new(0, 10, 0, 38)
    sScroll.Size = UDim2.new(1, -20, 1, -46)
    sScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    sScroll.ScrollBarThickness = 4
    sScroll.ScrollBarImageTransparency = 0.4
    sScroll.ZIndex = 31

    local sLayout = Instance.new("UIListLayout", sScroll)
    sLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sLayout.Padding = UDim.new(0, 8)
    sLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sScroll.CanvasSize = UDim2.new(0, 0, 0, sLayout.AbsoluteContentSize.Y + 12)
    end)

    RegisterThemeListener(function()
        if sTitle.Parent then sTitle.TextColor3 = GlassState.TextColor end
        if sCloseHolder.Parent then sCloseHolder.BackgroundColor3 = GlassState.AccentColor end
        if sScroll.Parent then sScroll.ScrollBarImageColor3 = GlassState.AccentColor end
    end)

    local settingsOpen = false
    local function SetSettingsOpen(state)
        settingsOpen = state
        local dur = math.max(0.16, GlassState.AnimationSpeed)
        TweenService:Create(settingsIcon, TweenInfo.new(dur * 1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Rotation = state and 135 or 0,
            ImageColor3 = state and GlassState.AccentColor or GlassState.TextColor
        }):Play()
        if state then
            settingsOverlay.Visible = true
            settingsScale.Scale = 0.93
            TweenService:Create(settingsScale, TweenInfo.new(dur * 1.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
        else
            local tw = TweenService:Create(settingsScale, TweenInfo.new(dur * 0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Scale = 0.94})
            tw:Play()
            tw.Completed:Connect(function()
                if not settingsOpen and settingsOverlay.Parent then settingsOverlay.Visible = false end
            end)
        end
    end

    settingsTrigger.MouseButton1Click:Connect(function() SetSettingsOpen(not settingsOpen) end)
    sCloseBtn.MouseButton1Click:Connect(function() SetSettingsOpen(false) end)

    local settingUpdaters = {}

    local function AddSettingHeader(titleText)
        local hdr = Instance.new("TextLabel", sScroll)
        hdr.BackgroundTransparency = 1
        hdr.Size = UDim2.new(1, -6, 0, 22)
        hdr.Font = Enum.Font.GothamBold
        hdr.Text = "  " .. titleText
        hdr.TextSize = 12
        hdr.TextXAlignment = Enum.TextXAlignment.Left
        hdr.TextColor3 = GlassState.AccentColor
        hdr.ZIndex = 32
        RegisterThemeListener(function()
            if hdr.Parent then hdr.TextColor3 = GlassState.AccentColor end
        end)
    end

    local function AddSettingSlider(labelText, minVal, maxVal, isPrecise, defaultVal, onChange)
        local row = Instance.new("Frame", sScroll)
        row.BackgroundColor3 = GlassState.CardColor
        row.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.82)
        row.Size = UDim2.new(1, -6, 0, 46)
        row.ZIndex = 32
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
        CreateGlassStroke(row, 1, 0.10)

        local lbl = Instance.new("TextLabel", row)
        lbl.BackgroundTransparency = 1
        lbl.Position = UDim2.new(0, 10, 0, 4)
        lbl.Size = UDim2.new(1, -80, 0, 18)
        lbl.Font = Enum.Font.GothamSemibold
        lbl.Text = labelText
        lbl.TextSize = 12
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextColor3 = GlassState.TextColor
        lbl.ZIndex = 33

        local valLbl = Instance.new("TextLabel", row)
        valLbl.BackgroundTransparency = 1
        valLbl.AnchorPoint = Vector2.new(1, 0)
        valLbl.Position = UDim2.new(1, -10, 0, 4)
        valLbl.Size = UDim2.new(0, 64, 0, 18)
        valLbl.Font = Enum.Font.GothamBold
        valLbl.Text = tostring(defaultVal)
        valLbl.TextSize = 12
        valLbl.TextXAlignment = Enum.TextXAlignment.Right
        valLbl.TextColor3 = GlassState.AccentColor
        valLbl.ZIndex = 33

        local track = Instance.new("Frame", row)
        track.Position = UDim2.new(0, 10, 0, 30)
        track.Size = UDim2.new(1, -20, 0, 6)
        track.BackgroundColor3 = Color3.new(1, 1, 1)
        track.BackgroundTransparency = 0.85
        track.ZIndex = 33
        Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

        local fill = Instance.new("Frame", track)
        fill.Size = UDim2.new(math.clamp((defaultVal - minVal) / math.max(0.0001, (maxVal - minVal)), 0, 1), 0, 1, 0)
        fill.BackgroundColor3 = GlassState.AccentColor
        fill.BorderSizePixel = 0
        fill.ZIndex = 34
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

        local knob = Instance.new("Frame", fill)
        knob.AnchorPoint = Vector2.new(0.5, 0.5)
        knob.Position = UDim2.new(1, 0, 0.5, 0)
        knob.Size = UDim2.new(0, 12, 0, 12)
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.ZIndex = 35
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local hitBtn = Instance.new("TextButton", track)
        hitBtn.BackgroundTransparency = 1
        hitBtn.Position = UDim2.new(0, -6, 0, -8)
        hitBtn.Size = UDim2.new(1, 12, 1, 16)
        hitBtn.Text = ""
        hitBtn.ZIndex = 36

        local function setVal(vNum, fire)
            local clamped = math.clamp(vNum, math.min(minVal, maxVal), math.max(minVal, maxVal))
            clamped = isPrecise and tonumber(string.format("%.2f", clamped)) or math.floor(clamped + 0.5)
            local ratio = (clamped - minVal) / math.max(0.0001, (maxVal - minVal))
            fill.Size = UDim2.new(ratio, 0, 1, 0)
            valLbl.Text = tostring(clamped)
            if fire then onChange(clamped) end
        end

        local dragging = false
        local function updateFromInput(posX)
            local ratio = math.clamp((posX - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
            setVal(minVal + (maxVal - minVal) * ratio, true)
        end

        hitBtn.InputBegan:Connect(function(input)
