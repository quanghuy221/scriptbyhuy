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

local function SetTruncate(lbl)
    pcall(function()
        lbl.TextTruncate = Enum.TextTruncate.AtEnd
    end)
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

local function GetContrastText(bgColor)
    local lum = (0.299 * bgColor.r) + (0.587 * bgColor.g) + (0.114 * bgColor.b)
    return lum > 0.72 and Color3.fromRGB(22, 26, 34) or Color3.fromRGB(255, 255, 255)
end

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
        local ok, keep = pcall(ThemeListeners[i])
        if not ok or keep == false then
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
        if not stroke.Parent then return false end
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
        if not uiScale.Parent then return end
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
        if hoverOverlay and hoverOverlay.Parent then
            TweenService:Create(hoverOverlay, TweenInfo.new(math.max(0.08, GlassState.AnimationSpeed * 0.7), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = hoverGlowAlpha
            }):Play()
        end
    end)

    triggerButton.MouseLeave:Connect(function()
        isHovered, isPressed = false, false
        playScale(1, Enum.EasingStyle.Quad, 0.75)
        if hoverOverlay and hoverOverlay.Parent then
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
    local dragConn
    dragConn = UserInputService.InputChanged:Connect(function(input)
        if not arg.Parent or not arg2.Parent then
            dragConn:Disconnect()
            return
        end
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
    if not frame.Parent then return false end
    frame.BackgroundColor3 = GlassState.MainColor
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
        if not settingsOverlay.Parent then return false end
        settingsOverlay.BackgroundColor3 = GlassState.MainColor:Lerp(GlassState.PanelColor, 0.45)
        settingsOverlay.BackgroundTransparency = math.clamp(GlassState.MainTransparency * 0.85, 0.06, 0.85)
        settingsCorner.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 1))
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
    sCloseBtn.TextColor3 = GetContrastText(GlassState.AccentColor)
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
        if not settingsOverlay.Parent then return false end
        sTitle.TextColor3 = GlassState.TextColor
        sCloseHolder.BackgroundColor3 = GlassState.AccentColor
        sCloseBtn.TextColor3 = GetContrastText(GlassState.AccentColor)
        sScroll.ScrollBarImageColor3 = GlassState.AccentColor
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
            if not hdr.Parent then return false end
            hdr.TextColor3 = GlassState.AccentColor
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
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                TweenService:Create(knob, TweenInfo.new(0.12), {Size = UDim2.new(0, 15, 0, 15)}):Play()
                updateFromInput(input.Position.X)
            end
        end)
        local c1, c2
        c1 = UserInputService.InputChanged:Connect(function(input)
            if not row.Parent then c1:Disconnect(); c2:Disconnect(); return end
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateFromInput(input.Position.X)
            end
        end)
        c2 = UserInputService.InputEnded:Connect(function(input)
            if not row.Parent then c1:Disconnect(); c2:Disconnect(); return end
            if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                dragging = false
                TweenService:Create(knob, TweenInfo.new(0.15), {Size = UDim2.new(0, 12, 0, 12)}):Play()
            end
        end)

        RegisterThemeListener(function()
            if not row.Parent then return false end
            row.BackgroundColor3 = GlassState.CardColor
            row.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.82)
            lbl.TextColor3 = GlassState.TextColor
            valLbl.TextColor3 = GlassState.AccentColor
            fill.BackgroundColor3 = GlassState.AccentColor
        end)
        return setVal
    end

    local function AddSettingToggle(labelText, defaultBool, onToggle)
        local state = defaultBool
        local row = Instance.new("Frame", sScroll)
        row.BackgroundColor3 = GlassState.CardColor
        row.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.82)
        row.Size = UDim2.new(1, -6, 0, 36)
        row.ZIndex = 32
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
        CreateGlassStroke(row, 1, 0.10)

        local lbl = Instance.new("TextLabel", row)
        lbl.BackgroundTransparency = 1
        lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.Size = UDim2.new(1, -68, 1, 0)
        lbl.Font = Enum.Font.GothamSemibold
        lbl.Text = labelText
        lbl.TextSize = 12
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextColor3 = GlassState.TextColor
        lbl.ZIndex = 33

        local pill = Instance.new("Frame", row)
        pill.AnchorPoint = Vector2.new(1, 0.5)
        pill.Position = UDim2.new(1, -10, 0.5, 0)
        pill.Size = UDim2.new(0, 40, 0, 20)
        pill.BackgroundColor3 = state and GlassState.AccentColor or Color3.fromRGB(90, 96, 112)
        pill.BackgroundTransparency = state and 0.15 or 0.45
        pill.ZIndex = 33
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)

        local thumb = Instance.new("Frame", pill)
        thumb.AnchorPoint = Vector2.new(0, 0.5)
        thumb.Position = state and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
        thumb.Size = UDim2.new(0, 16, 0, 16)
        thumb.BackgroundColor3 = Color3.new(1, 1, 1)
        thumb.ZIndex = 34
        Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)

        local btn = Instance.new("TextButton", row)
        btn.BackgroundTransparency = 1
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.Text = ""
        btn.ZIndex = 35
        AttachClickJuice(btn, row, {HoverScale = 1.01, PressScale = 0.98})

        local function setToggle(val, fire)
            state = val
            TweenService:Create(pill, TweenInfo.new(0.2), {
                BackgroundColor3 = state and GlassState.AccentColor or Color3.fromRGB(90, 96, 112),
                BackgroundTransparency = state and 0.15 or 0.45,
            }):Play()
            TweenService:Create(thumb, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = state and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
            }):Play()
            if fire then onToggle(state) end
        end

        btn.MouseButton1Click:Connect(function() setToggle(not state, true) end)
        RegisterThemeListener(function()
            if not row.Parent then return false end
            row.BackgroundColor3 = GlassState.CardColor
            row.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.82)
            lbl.TextColor3 = GlassState.TextColor
            if state then pill.BackgroundColor3 = GlassState.AccentColor end
        end)
        return setToggle
    end

    AddSettingHeader("Glass & Transparency")
    settingUpdaters.MainTrans = AddSettingSlider("Main Glass Transparency", 0, 0.95, true, GlassState.MainTransparency, function(val) GlassState.MainTransparency = val; ApplyGlassTheme() end)
    settingUpdaters.PanelTrans = AddSettingSlider("Sidebar & Page Transparency", 0, 0.95, true, GlassState.PanelTransparency, function(val) GlassState.PanelTransparency = val; ApplyGlassTheme() end)
    settingUpdaters.CardTrans = AddSettingSlider("Card & Element Transparency", 0, 0.95, true, GlassState.CardTransparency, function(val) GlassState.CardTransparency = val; ApplyGlassTheme() end)
    settingUpdaters.BorderTrans = AddSettingSlider("Border Glow Transparency", 0, 1, true, GlassState.BorderTransparency, function(val) GlassState.BorderTransparency = val; ApplyGlassTheme() end)
    settingUpdaters.ShadowTrans = AddSettingSlider("Drop Shadow Transparency", 0, 1, true, GlassState.ShadowTransparency, function(val) GlassState.ShadowTransparency = val; ApplyGlassTheme() end)
    settingUpdaters.WorldBlur = AddSettingToggle("World Background Blur", GlassState.WorldBlurEnabled, function(val) GlassState.WorldBlurEnabled = val; UpdateWorldBlur() end)
    settingUpdaters.BlurSize = AddSettingSlider("World Blur Strength", 2, 24, false, GlassState.WorldBlurSize, function(val) GlassState.WorldBlurSize = val; UpdateWorldBlur() end)

    AddSettingHeader("Geometry & Click Juice")
    settingUpdaters.Corner = AddSettingSlider("Corner Roundness", 2, 16, false, GlassState.CornerRadius, function(val) GlassState.CornerRadius = val; ApplyGlassTheme() end)
    settingUpdaters.Scale = AddSettingSlider("UI Scale", 0.75, 1.25, true, GlassState.UIScale, function(val) GlassState.UIScale = val; ApplyGlassTheme() end)
    settingUpdaters.Speed = AddSettingSlider("Animation Speed (sec)", 0.05, 0.50, true, GlassState.AnimationSpeed, function(val) GlassState.AnimationSpeed = val; ApplyGlassTheme() end)
    settingUpdaters.Ripple = AddSettingToggle("Click Ripple Effect", GlassState.RippleEnabled, function(val) GlassState.RippleEnabled = val end)
    settingUpdaters.Bounce = AddSettingToggle("Tactile Spring Bounce", GlassState.BounceEnabled, function(val) GlassState.BounceEnabled = val end)

    AddSettingHeader("Fluent Color Presets")
    local presetGrid = Instance.new("Frame", sScroll)
    presetGrid.BackgroundTransparency = 1
    presetGrid.Size = UDim2.new(1, -6, 0, 0)
    presetGrid.AutomaticSize = Enum.AutomaticSize.Y
    presetGrid.ZIndex = 32
    local gridLayout = Instance.new("UIGridLayout", presetGrid)
    gridLayout.CellSize = UDim2.new(0, 114, 0, 28)
    gridLayout.CellPadding = UDim2.new(0, 6, 0, 6)

    local presets = {
        {Name = "Fluent Sky", Acc = Color3.fromRGB(115, 198, 255), Main = Color3.fromRGB(16, 20, 28), Panel = Color3.fromRGB(26, 32, 44), Card = Color3.fromRGB(38, 46, 62), Border = Color3.fromRGB(140, 175, 220)},
        {Name = "Crimson Glass", Acc = Color3.fromRGB(255, 95, 95), Main = Color3.fromRGB(22, 18, 22), Panel = Color3.fromRGB(34, 26, 30), Card = Color3.fromRGB(48, 36, 42), Border = Color3.fromRGB(255, 110, 110)},
        {Name = "Amber Gold", Acc = Color3.fromRGB(255, 208, 90), Main = Color3.fromRGB(18, 18, 22), Panel = Color3.fromRGB(28, 28, 34), Card = Color3.fromRGB(40, 40, 48), Border = Color3.fromRGB(230, 190, 95)},
        {Name = "Emerald Mint", Acc = Color3.fromRGB(72, 232, 168), Main = Color3.fromRGB(14, 22, 20), Panel = Color3.fromRGB(22, 34, 30), Card = Color3.fromRGB(32, 48, 44), Border = Color3.fromRGB(100, 220, 175)},
        {Name = "Cyber Violet", Acc = Color3.fromRGB(178, 120, 255), Main = Color3.fromRGB(18, 16, 28), Panel = Color3.fromRGB(28, 24, 42), Card = Color3.fromRGB(40, 35, 58), Border = Color3.fromRGB(170, 130, 255)},
        {Name = "Rose Quartz", Acc = Color3.fromRGB(255, 128, 185), Main = Color3.fromRGB(24, 18, 24), Panel = Color3.fromRGB(36, 26, 36), Card = Color3.fromRGB(50, 36, 50), Border = Color3.fromRGB(240, 140, 190)},
        {Name = "Obsidian Mono", Acc = Color3.fromRGB(225, 230, 240), Main = Color3.fromRGB(14, 14, 16), Panel = Color3.fromRGB(24, 24, 28), Card = Color3.fromRGB(36, 36, 42), Border = Color3.fromRGB(160, 165, 175)},
    }

    AddSettingHeader("Custom RGB Studio")
    settingUpdaters.AccR = AddSettingSlider("Accent Red", 0, 255, false, math.floor(GlassState.AccentColor.r * 255), function(r)
        GlassState.AccentColor = Color3.fromRGB(r, math.floor(GlassState.AccentColor.g * 255), math.floor(GlassState.AccentColor.b * 255))
        GlassState.BorderColor = GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.25)
        ApplyGlassTheme()
    end)
    settingUpdaters.AccG = AddSettingSlider("Accent Green", 0, 255, false, math.floor(GlassState.AccentColor.g * 255), function(g)
        GlassState.AccentColor = Color3.fromRGB(math.floor(GlassState.AccentColor.r * 255), g, math.floor(GlassState.AccentColor.b * 255))
        GlassState.BorderColor = GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.25)
        ApplyGlassTheme()
    end)
    settingUpdaters.AccB = AddSettingSlider("Accent Blue", 0, 255, false, math.floor(GlassState.AccentColor.b * 255), function(b)
        GlassState.AccentColor = Color3.fromRGB(math.floor(GlassState.AccentColor.r * 255), math.floor(GlassState.AccentColor.g * 255), b)
        GlassState.BorderColor = GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.25)
        ApplyGlassTheme()
    end)
    settingUpdaters.BgR = AddSettingSlider("Glass Tint Red", 0, 255, false, math.floor(GlassState.MainColor.r * 255), function(r)
        local g, b = math.floor(GlassState.MainColor.g * 255), math.floor(GlassState.MainColor.b * 255)
        GlassState.MainColor = Color3.fromRGB(r, g, b)
        GlassState.PanelColor = GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.06)
        GlassState.CardColor = GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.12)
        ApplyGlassTheme()
    end)
    settingUpdaters.BgG = AddSettingSlider("Glass Tint Green", 0, 255, false, math.floor(GlassState.MainColor.g * 255), function(g)
        local r, b = math.floor(GlassState.MainColor.r * 255), math.floor(GlassState.MainColor.b * 255)
        GlassState.MainColor = Color3.fromRGB(r, g, b)
        GlassState.PanelColor = GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.06)
        GlassState.CardColor = GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.12)
        ApplyGlassTheme()
    end)
    settingUpdaters.BgB = AddSettingSlider("Glass Tint Blue", 0, 255, false, math.floor(GlassState.MainColor.b * 255), function(b)
        local r, g = math.floor(GlassState.MainColor.r * 255), math.floor(GlassState.MainColor.g * 255)
        GlassState.MainColor = Color3.fromRGB(r, g, b)
        GlassState.PanelColor = GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.06)
        GlassState.CardColor = GlassState.MainColor:Lerp(Color3.new(1, 1, 1), 0.12)
        ApplyGlassTheme()
    end)

    for _, p in ipairs(presets) do
        local pCard = Instance.new("Frame", presetGrid)
        pCard.BackgroundColor3 = p.Card
        pCard.BackgroundTransparency = 0.25
        pCard.ZIndex = 33
        Instance.new("UICorner", pCard).CornerRadius = UDim.new(0, 6)
        local pStroke = Instance.new("UIStroke", pCard)
        pStroke.Color = p.Acc
        pStroke.Thickness = 1
        pStroke.Transparency = 0.35

        local dot = Instance.new("Frame", pCard)
        dot.AnchorPoint = Vector2.new(0, 0.5)
        dot.Position = UDim2.new(0, 7, 0.5, 0)
        dot.Size = UDim2.new(0, 10, 0, 10)
        dot.BackgroundColor3 = p.Acc
        dot.ZIndex = 34
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local pBtn = Instance.new("TextButton", pCard)
        pBtn.BackgroundTransparency = 1
        pBtn.Position = UDim2.new(0, 20, 0, 0)
        pBtn.Size = UDim2.new(1, -22, 1, 0)
        pBtn.Font = Enum.Font.GothamBold
        pBtn.Text = p.Name
        pBtn.TextSize = 11
        pBtn.TextXAlignment = Enum.TextXAlignment.Left
        pBtn.TextColor3 = Color3.fromRGB(240, 244, 250)
        pBtn.ZIndex = 35
        AttachClickJuice(pBtn, pCard, {HoverScale = 1.05, PressScale = 0.94, RippleColor = p.Acc})

        pBtn.MouseButton1Click:Connect(function()
            GlassState.AccentColor = p.Acc
            GlassState.MainColor = p.Main
            GlassState.PanelColor = p.Panel
            GlassState.CardColor = p.Card
            GlassState.BorderColor = p.Border
            settingUpdaters.AccR(math.floor(p.Acc.r * 255), false)
            settingUpdaters.AccG(math.floor(p.Acc.g * 255), false)
            settingUpdaters.AccB(math.floor(p.Acc.b * 255), false)
            settingUpdaters.BgR(math.floor(p.Main.r * 255), false)
            settingUpdaters.BgG(math.floor(p.Main.g * 255), false)
            settingUpdaters.BgB(math.floor(p.Main.b * 255), false)
            ApplyGlassTheme()
        end)
    end

    AddSettingHeader("Actions")
    local actionRow = Instance.new("Frame", sScroll)
    actionRow.BackgroundTransparency = 1
    actionRow.Size = UDim2.new(1, -6, 0, 32)
    actionRow.ZIndex = 32

    local resetHolder = Instance.new("Frame", actionRow)
    resetHolder.Size = UDim2.new(0.49, 0, 1, 0)
    resetHolder.BackgroundColor3 = GlassState.CardColor
    resetHolder.BackgroundTransparency = 0.25
    resetHolder.ZIndex = 33
    Instance.new("UICorner", resetHolder).CornerRadius = UDim.new(0, 7)
    CreateGlassStroke(resetHolder, 1, 0.05)

    local resetBtn = Instance.new("TextButton", resetHolder)
    resetBtn.BackgroundTransparency = 1
    resetBtn.Size = UDim2.new(1, 0, 1, 0)
    resetBtn.Font = Enum.Font.GothamBold
    resetBtn.Text = "Reset Fluent Default"
    resetBtn.TextSize = 12
    resetBtn.TextColor3 = GlassState.TextColor
    resetBtn.ZIndex = 34
    AttachClickJuice(resetBtn, resetHolder, {HoverScale = 1.03, PressScale = 0.96})

    resetBtn.MouseButton1Click:Connect(function()
        local def = getgenv().T1 and presets[2] or presets[1]
        GlassState.MainTransparency = 0.24
        GlassState.PanelTransparency = 0.44
        GlassState.CardTransparency = 0.52
        GlassState.BorderTransparency = 0.48
        GlassState.ShadowTransparency = 0.40
        GlassState.CornerRadius = 10
        GlassState.AnimationSpeed = 0.22
        GlassState.UIScale = 1.0
        GlassState.RippleEnabled = true
        GlassState.BounceEnabled = true
        GlassState.WorldBlurEnabled = false
        GlassState.WorldBlurSize = 10
        GlassState.AccentColor = def.Acc
        GlassState.MainColor = def.Main
        GlassState.PanelColor = def.Panel
        GlassState.CardColor = def.Card
        GlassState.BorderColor = def.Border

        settingUpdaters.MainTrans(0.24, false)
        settingUpdaters.PanelTrans(0.44, false)
        settingUpdaters.CardTrans(0.52, false)
        settingUpdaters.BorderTrans(0.48, false)
        settingUpdaters.ShadowTrans(0.40, false)
        settingUpdaters.WorldBlur(false, false)
        settingUpdaters.BlurSize(10, false)
        settingUpdaters.Corner(10, false)
        settingUpdaters.Scale(1.0, false)
        settingUpdaters.Speed(0.22, false)
        settingUpdaters.Ripple(true, false)
        settingUpdaters.Bounce(true, false)
        settingUpdaters.AccR(math.floor(def.Acc.r * 255), false)
        settingUpdaters.AccG(math.floor(def.Acc.g * 255), false)
        settingUpdaters.AccB(math.floor(def.Acc.b * 255), false)
        settingUpdaters.BgR(math.floor(def.Main.r * 255), false)
        settingUpdaters.BgG(math.floor(def.Main.g * 255), false)
        settingUpdaters.BgB(math.floor(def.Main.b * 255), false)
        ApplyGlassTheme()
    end)

    local destroyHolder = Instance.new("Frame", actionRow)
    destroyHolder.Position = UDim2.new(0.51, 0, 0, 0)
    destroyHolder.Size = UDim2.new(0.49, 0, 1, 0)
    destroyHolder.BackgroundColor3 = Color3.fromRGB(220, 65, 75)
    destroyHolder.BackgroundTransparency = 0.25
    destroyHolder.ZIndex = 33
    Instance.new("UICorner", destroyHolder).CornerRadius = UDim.new(0, 7)

    local destroyBtn = Instance.new("TextButton", destroyHolder)
    destroyBtn.BackgroundTransparency = 1
    destroyBtn.Size = UDim2.new(1, 0, 1, 0)
    destroyBtn.Font = Enum.Font.GothamBold
    destroyBtn.Text = "Unload / Destroy UI"
    destroyBtn.TextSize = 12
    destroyBtn.TextColor3 = Color3.new(1, 1, 1)
    destroyBtn.ZIndex = 34
    AttachClickJuice(destroyBtn, destroyHolder, {HoverScale = 1.03, PressScale = 0.96, RippleColor = Color3.fromRGB(255, 160, 160)})
    destroyBtn.MouseButton1Click:Connect(function() tbl3.DestroyUI() end)
end

--// CREATE MAIN WINDOW
tbl3.CreateMain = function(arg, arg2)
    if arg == tbl3 then arg = arg2 end
    arg = arg or {}
    local text = tostring(arg.Title or "QHuy Hub")
    getgenv().MainDesc = arg.Desc or ""
    cac = false

    local frame3 = Instance.new("Frame", tbl4.Gui)
    frame3.Name = "Main"
    frame3.BackgroundTransparency = 1
    frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    frame3.Size = UDim2.new(0, 646, 0, 384)
    fn(frame3, frame3)

    local mainScale = Instance.new("UIScale", frame3)
    mainScale.Scale = GlassState.UIScale
    MainWindowScaleRef = mainScale
    RegisterThemeListener(function()
        if not mainScale.Parent then return false end
        if getgenv().UIToggled then mainScale.Scale = GlassState.UIScale end
    end)

    local imageLabel2 = Instance.new("ImageLabel", frame3)
    imageLabel2.Name = "maingui"
    imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel2.BackgroundTransparency = 1
    imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel2.Size = UDim2.new(1, 30, 1, 30)
    imageLabel2.Image = "rbxassetid://8068653048"
    imageLabel2.ScaleType = Enum.ScaleType.Slice
    imageLabel2.SliceCenter = Rect.new(15, 15, 175, 175)
    imageLabel2.SliceScale = 1.3
    imageLabel2.ImageColor3 = GetUIColor("Title Text Color", GlassState.AccentColor)
    imageLabel2.ImageTransparency = 1

    local imageLabel4 = Instance.new("ImageLabel", frame3)
    imageLabel4.Name = "MainContainer"
    imageLabel4.BackgroundColor3 = GlassState.MainColor
    imageLabel4.BackgroundTransparency = GlassState.MainTransparency
    imageLabel4.Size = UDim2.new(1, 0, 1, 0)
    imageLabel4.ClipsDescendants = true
    getgenv().ReadyForGuiLoaded = true

    local imageLabel5 = Instance.new("ImageLabel", frame3)
    imageLabel5.Name = "Shadow"
    imageLabel5.BackgroundTransparency = 1
    imageLabel5.Image = "rbxassetid://5028857084"
    imageLabel5.ImageColor3 = Color3.new(0, 0, 0)
    imageLabel5.ImageTransparency = GlassState.ShadowTransparency
    imageLabel5.ScaleType = Enum.ScaleType.Slice
    imageLabel5.SliceCenter = Rect.new(24, 24, 276, 276)
    imageLabel5.Size = UDim2.new(1, 44, 1, 44)
    imageLabel5.Position = UDim2.new(0.5, 0, 0.5, 3)
    imageLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel5.ZIndex = imageLabel4.ZIndex - 1

    CreateGlassStroke(imageLabel4, 1.2, -0.05)

    local uiGradient = Instance.new("UIGradient", imageLabel4)
    uiGradient.Rotation = 135
    uiGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(220, 228, 242)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 200, 220)),
    })

    local glassSheen = Instance.new("Frame", imageLabel4)
    glassSheen.Name = "GlassSheen"
    glassSheen.BackgroundColor3 = Color3.new(1, 1, 1)
    glassSheen.BackgroundTransparency = 0.94
    glassSheen.BorderSizePixel = 0
    glassSheen.Size = UDim2.new(1, 0, 0, 34)
    glassSheen.ZIndex = 1

    local uiCorner2 = Instance.new("UICorner", imageLabel4)
    uiCorner2.CornerRadius = UDim.new(0, GlassState.CornerRadius)
    uiCorner2.Name = "MainCorner"

    RegisterThemeListener(function()
        if not imageLabel4.Parent then return false end
        imageLabel4.BackgroundColor3 = GlassState.MainColor
        imageLabel4.BackgroundTransparency = GlassState.MainTransparency
        imageLabel5.ImageTransparency = GlassState.ShadowTransparency
        uiCorner2.CornerRadius = UDim.new(0, GlassState.CornerRadius)
    end)

    --// Header Bar
    local frame4 = Instance.new("Frame", imageLabel4)
    frame4.Name = "TopMain"
    frame4.BackgroundTransparency = 1
    frame4.Size = UDim2.new(1, 0, 0, 34)
    frame4.ZIndex = 3
    fn(frame4, frame3)

    local frame9 = Instance.new("Frame", frame4)
    frame9.Name = "TopStroke"
    frame9.BackgroundColor3 = GlassState.BorderColor
    frame9.BackgroundTransparency = 0.65
    frame9.BorderSizePixel = 0
    frame9.Position = UDim2.new(0, 10, 1, -1)
    frame9.Size = UDim2.new(1, -20, 0, 1)
    Instance.new("UIGradient", frame9).Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.15, 0.2),
        NumberSequenceKeypoint.new(0.85, 0.2),
        NumberSequenceKeypoint.new(1, 1),
    })

    local imageLabel3 = Instance.new("ImageLabel", frame4)
    imageLabel3.Name = "Ruafimg"
    imageLabel3.BackgroundTransparency = 1
    imageLabel3.AnchorPoint = Vector2.new(0, 0.5)
    imageLabel3.Position = UDim2.new(0, 10, 0.5, 0)
    imageLabel3.Size = UDim2.new(0, 22, 0, 22)
    imageLabel3.Image = GetUIColor("Logo Image", "rbxassetid://5009915795")
    imageLabel3.ScaleType = Enum.ScaleType.Fit
    Instance.new("UICorner", imageLabel3).CornerRadius = UDim.new(1, 0)

    local textLabel = Instance.new("TextLabel", frame4)
    textLabel.Name = "TextLabelMain"
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 40, 0, 0)
    textLabel.Size = UDim2.new(1, -130, 1, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.RichText = true
    textLabel.TextSize = 15
    SetTruncate(textLabel)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextColor3 = GlassState.TextColor

    local function updateMainTitleText()
        local c = tbl4.Getcolor(GlassState.AccentColor)
        textLabel.Text = "<font color=\"rgb(" .. c[1] .. "," .. c[2] .. "," .. c[3] .. ")\">QHuy Hub</font> " .. tostring(getgenv().MainDesc or "")
        textLabel.TextColor3 = GlassState.TextColor
    end
    updateMainTitleText()

    local uiStroke2 = Instance.new("UIStroke", textLabel)
    uiStroke2.Thickness = 1
    uiStroke2.Transparency = 0.85
    uiStroke2.Color = Color3.new(0, 0, 0)

    RegisterThemeListener(function()
        if not textLabel.Parent then return false end
        frame9.BackgroundColor3 = GlassState.BorderColor
        updateMainTitleText()
    end)

    --// Top-Right Settings + Minimize
    local topActions = Instance.new("Frame", frame4)
    topActions.Name = "TopActions"
    topActions.AnchorPoint = Vector2.new(1, 0.5)
    topActions.Position = UDim2.new(1, -8, 0.5, 0)
    topActions.Size = UDim2.new(0, 62, 0, 24)
    topActions.BackgroundTransparency = 1
    topActions.ZIndex = 5

    local settingsBtnHolder = Instance.new("Frame", topActions)
    settingsBtnHolder.Name = "SettingsHolder"
    settingsBtnHolder.Size = UDim2.new(0, 26, 0, 24)
    settingsBtnHolder.BackgroundColor3 = GlassState.CardColor
    settingsBtnHolder.BackgroundTransparency = 0.55
    Instance.new("UICorner", settingsBtnHolder).CornerRadius = UDim.new(0, 6)
    CreateGlassStroke(settingsBtnHolder, 1, 0.05)

    local settingsIcon = Instance.new("ImageLabel", settingsBtnHolder)
    settingsIcon.Name = "SettingsIcon"
    settingsIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    settingsIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    settingsIcon.Size = UDim2.new(0, 16, 0, 16)
    settingsIcon.BackgroundTransparency = 1
    settingsIcon.Image = "rbxassetid://3926307971"
    settingsIcon.ImageRectOffset = Vector2.new(324, 124)
    settingsIcon.ImageRectSize = Vector2.new(36, 36)
    settingsIcon.ImageColor3 = GlassState.TextColor

    local settingsTrigger = Instance.new("TextButton", settingsBtnHolder)
    settingsTrigger.Name = "SettingsButton"
    settingsTrigger.BackgroundTransparency = 1
    settingsTrigger.Size = UDim2.new(1, 0, 1, 0)
    settingsTrigger.Text = ""
    settingsTrigger.ZIndex = 6
    AttachClickJuice(settingsTrigger, settingsBtnHolder, {HoverScale = 1.12, PressScale = 0.88, HoverTransparency = 0.80})

    local minBtnHolder = Instance.new("Frame", topActions)
    minBtnHolder.Name = "MinimizeHolder"
    minBtnHolder.Position = UDim2.new(0, 32, 0, 0)
    minBtnHolder.Size = UDim2.new(0, 26, 0, 24)
    minBtnHolder.BackgroundColor3 = GlassState.CardColor
    minBtnHolder.BackgroundTransparency = 0.55
    Instance.new("UICorner", minBtnHolder).CornerRadius = UDim.new(0, 6)
    CreateGlassStroke(minBtnHolder, 1, 0.05)

    local minLabel = Instance.new("TextLabel", minBtnHolder)
    minLabel.BackgroundTransparency = 1
    minLabel.Size = UDim2.new(1, 0, 1, 0)
    minLabel.Font = Enum.Font.GothamBold
    minLabel.Text = "—"
    minLabel.TextSize = 13
    minLabel.TextColor3 = GlassState.TextColor

    local minTrigger = Instance.new("TextButton", minBtnHolder)
    minTrigger.Name = "MinimizeButton"
    minTrigger.BackgroundTransparency = 1
    minTrigger.Size = UDim2.new(1, 0, 1, 0)
    minTrigger.Text = ""
    minTrigger.ZIndex = 6
    AttachClickJuice(minTrigger, minBtnHolder, {HoverScale = 1.12, PressScale = 0.88, HoverTransparency = 0.80})
    minTrigger.MouseButton1Click:Connect(function() tbl3.ToggleUI() end)

    RegisterThemeListener(function()
        if not settingsBtnHolder.Parent then return false end
        settingsBtnHolder.BackgroundColor3 = GlassState.CardColor
        settingsIcon.ImageColor3 = GlassState.TextColor
        minBtnHolder.BackgroundColor3 = GlassState.CardColor
        minLabel.TextColor3 = GlassState.TextColor
    end)

    pcall(BuildSettingsOverlay, imageLabel4, settingsIcon, settingsTrigger)

    local frame7 = Instance.new("Frame", imageLabel4)
    frame7.Name = "Concacontainer"
    frame7.BackgroundTransparency = 1
    frame7.ClipsDescendants = true
    frame7.Position = UDim2.new(0, 0, 0, 36)
    frame7.Size = UDim2.new(1, 0, 1, -36)

    local frame8 = Instance.new("Frame", frame7)
    frame8.Name = "Concacmain"
    frame8.BackgroundTransparency = 1
    frame8.Selectable = true
    frame8.Size = UDim2.new(1, 0, 1, 0)

    --// Sidebar
    local frame5 = Instance.new("Frame", frame8)
    frame5.Name = "Background1"
    frame5.Position = UDim2.new(0, 8, 0, 4)
    frame5.Size = UDim2.new(0, 184, 1, -12)
    frame5.BackgroundTransparency = GlassState.PanelTransparency
    frame5.BackgroundColor3 = GlassState.PanelColor

    local sideCorner = Instance.new("UICorner", frame5)
    sideCorner.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 2))
    CreateGlassStroke(frame5, 1, 0.04)

    local uiGradient2 = Instance.new("UIGradient", frame5)
    uiGradient2.Rotation = 90
    local function updateSidebarGrad()
        uiGradient2.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, GlassState.PanelColor:Lerp(Color3.new(1, 1, 1), 0.04)),
            ColorSequenceKeypoint.new(1, GlassState.CardColor),
        })
    end
    updateSidebarGrad()

    local uiPadding = Instance.new("UIPadding", frame5)
    uiPadding.PaddingLeft = UDim.new(0, 6); uiPadding.PaddingRight = UDim.new(0, 6)
    uiPadding.PaddingTop = UDim.new(0, 6); uiPadding.PaddingBottom = UDim.new(0, 6)

    local textLabel2 = Instance.new("TextLabel", frame5)
    textLabel2.Name = "GUITextColor"
    textLabel2.BackgroundTransparency = 1
    textLabel2.Position = UDim2.new(0, 4, 0, 0)
    textLabel2.Size = UDim2.new(1, -8, 0, 20)
    textLabel2.Font = Enum.Font.GothamBold
    textLabel2.Text = text
    textLabel2.TextSize = 13
    SetTruncate(textLabel2)
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.TextColor3 = GlassState.TextColor

    local frame10 = Instance.new("Frame", frame5)
    frame10.Name = "PageSearch"
    frame10.BackgroundColor3 = GlassState.CardColor
    frame10.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.85)
    frame10.Position = UDim2.new(0, 0, 0, 24)
    frame10.Size = UDim2.new(1, 0, 0, 26)
    frame10.ClipsDescendants = true
    Instance.new("UICorner", frame10).CornerRadius = UDim.new(0, 6)
    CreateGlassStroke(frame10, 1, 0.12)

    local frame11 = Instance.new("Frame", frame10)
    frame11.Name = "SearchFrame"
    frame11.BackgroundTransparency = 1
    frame11.Size = UDim2.new(0, 26, 1, 0)

    local imageLabel6 = Instance.new("ImageLabel", frame11)
    imageLabel6.Name = "SearchIcon"
    imageLabel6.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel6.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel6.Size = UDim2.new(0, 14, 0, 14)
    imageLabel6.BackgroundTransparency = 1
    imageLabel6.Image = "rbxassetid://8154282545"
    imageLabel6.ImageColor3 = GetUIColor("Search Icon Color", Color3.new(1, 1, 1))

    local textBox = Instance.new("TextBox", frame10)
    textBox.Name = "SearchBox"
    textBox.BackgroundTransparency = 1
    textBox.Position = UDim2.new(0, 28, 0, 0)
    textBox.Size = UDim2.new(1, -32, 1, 0)
    textBox.Font = Enum.Font.GothamSemibold
    textBox.Text = ""
    textBox.TextSize = 12
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.PlaceholderText = "Search section or function..."
    textBox.PlaceholderColor3 = GetUIColor("Placeholder Text Color", Color3.fromRGB(168, 178, 194))
    textBox.TextColor3 = GlassState.TextColor
    textBox.ClearTextOnFocus = false

    textBox.Focused:Connect(function()
        TweenService:Create(imageLabel6, TweenInfo.new(0.18), {ImageColor3 = GlassState.AccentColor}):Play()
    end)
    textBox.FocusLost:Connect(function()
        TweenService:Create(imageLabel6, TweenInfo.new(0.18), {ImageColor3 = GetUIColor("Search Icon Color", Color3.new(1, 1, 1))}):Play()
    end)

    local scrollingFrame = Instance.new("ScrollingFrame", frame5)
    scrollingFrame.Name = "ControlList"
    scrollingFrame.Active = true
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.Position = UDim2.new(0, 0, 0, 56)
    scrollingFrame.Size = UDim2.new(1, 0, 1, -56)
    scrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame.ScrollBarThickness = 3
    scrollingFrame.ScrollBarImageTransparency = 0.45
    scrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    local uiListLayout2 = Instance.new("UIListLayout", scrollingFrame)
    uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout2.Padding = UDim.new(0, 5)

    RegisterThemeListener(function()
        if not frame5.Parent then return false end
        frame5.BackgroundTransparency = GlassState.PanelTransparency
        frame5.BackgroundColor3 = GlassState.PanelColor
        sideCorner.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 2))
        updateSidebarGrad()
        textLabel2.TextColor3 = GlassState.TextColor
        frame10.BackgroundColor3 = GlassState.CardColor
        frame10.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.85)
        textBox.TextColor3 = GlassState.TextColor
        scrollingFrame.ScrollBarImageColor3 = GlassState.AccentColor
    end)

    --// Pages Area
    local frame6 = Instance.new("Frame", frame8)
    frame6.Name = "MainPage"
    frame6.BackgroundTransparency = 1
    frame6.ClipsDescendants = true
    frame6.Position = UDim2.new(0, 200, 0, 4)
    frame6.Size = UDim2.new(1, -208, 1, -12)

    local uiPageLayout = Instance.new("UIPageLayout", frame6)
    uiPageLayout.Name = "UIPage"
    uiPageLayout.FillDirection = Enum.FillDirection.Vertical
    uiPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiPageLayout.EasingDirection = Enum.EasingDirection.Out
    uiPageLayout.EasingStyle = Enum.EasingStyle.Quint
    uiPageLayout.Padding = UDim.new(0, 10)
    uiPageLayout.TweenTime = math.max(0.18, GlassState.AnimationSpeed * 1.15)
    pcall(function()
        uiPageLayout.ScrollWheelInputEnabled = false
        uiPageLayout.TouchInputEnabled = false
    end)

    RegisterThemeListener(function()
        if not uiPageLayout.Parent then return false end
        uiPageLayout.TweenTime = math.max(0.10, GlassState.AnimationSpeed * 1.15)
    end)

    --// Global Search
    local v5 = nil
    local fn4
    fn4 = function(arg2)
        local tbl6 = {}
        for _, v13 in pairs(arg2:GetChildren()) do
            if v13:IsA("TextLabel") then table.insert(tbl6, v13) end
            for _, v15 in pairs(fn4(v13)) do table.insert(tbl6, v15) end
        end
        return tbl6
    end

    textBox:GetPropertyChangedSignal("Text"):Connect(function()
        local v6 = string.lower(textBox.Text)
        local tbl6 = {}
        for _, v14 in pairs(frame6:GetChildren()) do
            if v14:IsA("Frame") and v14:FindFirstChild("PageList") then
                local flag2 = false
                for _, v22 in pairs(v14.PageList:GetChildren()) do
                    if not v22:IsA("UIListLayout") then
                        local flag3 = false
                        local topsec = v22:FindFirstChild("Topsec")
                        local sectiontitle = topsec and v22.Topsec:FindFirstChild("Sectiontitle")
                        if sectiontitle and v6 ~= "" and string.find(string.lower(sectiontitle.Text), v6) then
                            flag3 = true
                            for _, child in pairs(v22:GetChildren()) do
                                if child:IsA("Frame") then child.Visible = true end
                            end
                        end
                        for _, v30 in pairs(v22:GetChildren()) do
                            if v30:IsA("Frame") then
                                local flag4 = false
                                for _, v32 in pairs(fn4(v30)) do
                                    if string.find(string.lower(v32.Text), v6) then flag4 = true; break end
                                end
                                v30.Visible = (v6 == "" or flag4)
                                if v30.Visible then flag3 = true end
                            end
                        end
                        v22.Visible = (v6 == "" or flag3)
                        if v22.Visible then flag2 = true end
                    end
                end
                v14.Visible = (v6 == "" or flag2)
                if v14.Visible then table.insert(tbl6, v14) end
            end
        end
        for _, child in pairs(scrollingFrame:GetChildren()) do
            if child:IsA("Frame") then
                local v13 = frame6:FindFirstChild("Page" .. (child.LayoutOrder + 1))
                if v13 then child.Visible = v13.Visible end
            end
        end
        if v6 == "" then
            if v5 then uiPageLayout:JumpTo(v5) end
            return
        end
        if #tbl6 == 1 then uiPageLayout:JumpTo(tbl6[1]) end
    end)

    uiListLayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout2.AbsoluteContentSize.Y + 6)
    end)

    local layoutOrder, layoutOrder2, n9 = -1, -1, 1
    local mainObj = {}

    mainObj.CreatePage = function(arg2, arg3)
        if arg2 == mainObj then arg2 = arg3 end
        arg2 = arg2 or {}
        local text2 = tostring(arg2.Page_Name or "Page")
        local text3 = tostring(arg2.Page_Title or text2)
        layoutOrder2 = layoutOrder2 + 1
        layoutOrder = layoutOrder + 1

        local frame12 = Instance.new("Frame", scrollingFrame)
        frame12.Name = text2 .. "_Control"
        frame12.BackgroundColor3 = GlassState.CardColor
        frame12.BackgroundTransparency = 0.85
        frame12.Size = UDim2.new(1, -4, 0, 30)
        frame12.LayoutOrder = layoutOrder
        Instance.new("UICorner", frame12).CornerRadius = UDim.new(0, 7)

        local frame13 = Instance.new("Frame", frame12)
        frame13.BackgroundTransparency = 1
        frame13.Position = UDim2.new(0, 4, 0, 0)
        frame13.Size = UDim2.new(1, -8, 1, 0)
        Instance.new("UICorner", frame13).CornerRadius = UDim.new(0, 6)

        local frame14 = Instance.new("Frame", frame13)
        frame14.Name = "Line"
        frame14.AnchorPoint = Vector2.new(0, 0.5)
        frame14.BackgroundTransparency = 1
        frame14.Position = UDim2.new(0, 0, 0.5, 0)
        frame14.Size = UDim2.new(0, 10, 1, 0)

        local frame15 = Instance.new("Frame", frame14)
        frame15.Name = "PageInLine"
        frame15.AnchorPoint = Vector2.new(0.5, 0.5)
        frame15.BorderSizePixel = 0
        frame15.Position = UDim2.new(0.5, 0, 0.5, 0)
        frame15.Size = UDim2.new(0, 4, 0, 16)
        frame15.BackgroundColor3 = GlassState.AccentColor
        frame15.BackgroundTransparency = 1
        Instance.new("UICorner", frame15).CornerRadius = UDim.new(1, 0)

        local frame16 = Instance.new("Frame", frame13)
        frame16.Name = "TabTitleContainer"
        frame16.BackgroundTransparency = 1
        frame16.Position = UDim2.new(0, 14, 0, 0)
        frame16.Size = UDim2.new(1, -14, 1, 0)

        local textLabel3 = Instance.new("TextLabel", frame16)
        textLabel3.Name = "GUITextColor"
        textLabel3.BackgroundTransparency = 1
        textLabel3.Size = UDim2.new(1, 0, 1, 0)
        textLabel3.Font = Enum.Font.GothamSemibold
        textLabel3.Text = text2
        textLabel3.TextSize = 13
        SetTruncate(textLabel3)
        textLabel3.TextXAlignment = Enum.TextXAlignment.Left
        textLabel3.TextColor3 = GlassState.TextColor

        local textButton2 = Instance.new("TextButton", frame12)
        textButton2.Name = "PageButton"
        textButton2.BackgroundTransparency = 1
        textButton2.Size = UDim2.new(1, 0, 1, 0)
        textButton2.Text = ""
        textButton2.ZIndex = frame12.ZIndex + 3
        AttachClickJuice(textButton2, frame12, {HoverScale = 1.025, PressScale = 0.96, HoverTransparency = 0.86})

        local frame17 = Instance.new("Frame", frame6)
        local v6 = n9
        n9 = n9 + 1
        frame17.Name = "Page" .. v6
        frame17.BackgroundColor3 = GlassState.PanelColor
        frame17.Size = UDim2.new(1, 0, 1, 0)
        frame17.LayoutOrder = layoutOrder2
        frame17.BackgroundTransparency = GlassState.PanelTransparency

        local pageScale = Instance.new("UIScale", frame17)
        pageScale.Scale = 1

        local uiCorner7 = Instance.new("UICorner", frame17)
        uiCorner7.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 2))
        CreateGlassStroke(frame17, 1, 0.04)

        local uiGradient3 = Instance.new("UIGradient", frame17)
        uiGradient3.Rotation = 110
        local function updatePageGrad()
            uiGradient3.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, GlassState.PanelColor:Lerp(Color3.new(1, 1, 1), 0.04)),
                ColorSequenceKeypoint.new(1, GlassState.CardColor),
            })
        end
        updatePageGrad()

        local uiPadding2 = Instance.new("UIPadding", frame17)
        uiPadding2.PaddingLeft = UDim.new(0, 8); uiPadding2.PaddingRight = UDim.new(0, 8)
        uiPadding2.PaddingTop = UDim.new(0, 6); uiPadding2.PaddingBottom = UDim.new(0, 8)

        local textLabel4 = Instance.new("TextLabel", frame17)
        textLabel4.Name = "GUITextColor"
        textLabel4.BackgroundTransparency = 1
        textLabel4.Position = UDim2.new(0, 4, 0, 0)
        textLabel4.Size = UDim2.new(1, -36, 0, 26)
        textLabel4.Font = Enum.Font.GothamBold
        textLabel4.Text = text3
        textLabel4.TextSize = 15
        SetTruncate(textLabel4)
        textLabel4.TextXAlignment = Enum.TextXAlignment.Left
        textLabel4.TextColor3 = GlassState.TextColor

        local scrollingFrame2 = Instance.new("ScrollingFrame", frame17)
        scrollingFrame2.Name = "PageList"
        scrollingFrame2.Active = true
        scrollingFrame2.BackgroundTransparency = 1
        scrollingFrame2.BorderSizePixel = 0
        scrollingFrame2.Position = UDim2.new(0, 0, 0, 30)
        scrollingFrame2.Size = UDim2.new(1, 0, 1, -30)
        scrollingFrame2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollingFrame2.ScrollBarThickness = 4
        scrollingFrame2.ScrollBarImageTransparency = 0.45
        scrollingFrame2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        scrollingFrame2.ScrollingEnabled = true
        scrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.Always

        local uiListLayout3 = Instance.new("UIListLayout", scrollingFrame2)
        uiListLayout3.Name = "Pagelistlayout"
        uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
        uiListLayout3.Padding = UDim.new(0, 8)
        uiListLayout3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, uiListLayout3.AbsoluteContentSize.Y + 6)
        end)

        RegisterThemeListener(function()
            if not frame17.Parent then return false end
            frame12.BackgroundColor3 = GlassState.CardColor
            frame15.BackgroundColor3 = GlassState.AccentColor
            textLabel3.TextColor3 = GlassState.TextColor
            frame17.BackgroundColor3 = GlassState.PanelColor
            frame17.BackgroundTransparency = GlassState.PanelTransparency
            uiCorner7.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 2))
            updatePageGrad()
            textLabel4.TextColor3 = GlassState.TextColor
            scrollingFrame2.ScrollBarImageColor3 = GlassState.AccentColor
        end)

        local frame18 = Instance.new("Frame", frame17)
        frame18.Name = "Page Search"
        frame18.AnchorPoint = Vector2.new(1, 0)
        frame18.BackgroundColor3 = GlassState.CardColor
        frame18.BackgroundTransparency = math.clamp(GlassState.CardTransparency, 0.15, 0.85)
        frame18.Position = UDim2.new(1, -2, 0, 2)
        frame18.Size = UDim2.new(0, 24, 0, 24)
        frame18.ClipsDescendants = true
        frame18.ZIndex = 5
        Instance.new("UICorner", frame18).CornerRadius = UDim.new(0, 6)
        CreateGlassStroke(frame18, 1, 0.12)

        local frame19 = Instance.new("Frame", frame18)
        frame19.Name = "SearchFrame"
        frame19.BackgroundTransparency = 1
        frame19.Size = UDim2.new(0, 24, 0, 24)
        frame19.ZIndex = 6

        local imageLabel7 = Instance.new("ImageLabel", frame19)
        imageLabel7.Name = "SearchIcon"
        imageLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
        imageLabel7.BackgroundTransparency = 1
        imageLabel7.Position = UDim2.new(0.5, 0, 0.5, 0)
        imageLabel7.Size = UDim2.new(0, 14, 0, 14)
        imageLabel7.Image = "rbxassetid://8154282545"
        imageLabel7.ImageColor3 = GetUIColor("Search Icon Color", Color3.new(1, 1, 1))
        imageLabel7.ZIndex = 6

        local textButton3 = Instance.new("TextButton", frame19)
        textButton3.Name = "Search Button"
        textButton3.BackgroundTransparency = 1
        textButton3.Size = UDim2.new(1, 0, 1, 0)
        textButton3.Text = ""
        textButton3.ZIndex = 7
        AttachClickJuice(textButton3, frame18, {HoverScale = 1.06, PressScale = 0.94})

        local textBox2 = Instance.new("TextBox", frame18)
        textBox2.Name = "Search Box"
        textBox2.BackgroundTransparency = 1
        textBox2.Position = UDim2.new(0, 28, 0, 0)
        textBox2.Size = UDim2.new(1, -32, 1, 0)
        textBox2.Font = Enum.Font.GothamSemibold
        textBox2.Text = ""
        textBox2.TextSize = 12
        textBox2.TextXAlignment = Enum.TextXAlignment.Left
        textBox2.PlaceholderText = "Search section name..."
        textBox2.PlaceholderColor3 = GetUIColor("Placeholder Text Color", Color3.fromRGB(168, 178, 194))
        textBox2.TextColor3 = GlassState.TextColor
        textBox2.ClearTextOnFocus = false
        textBox2.ZIndex = 6

        local flag2 = false
        textButton3.MouseEnter:Connect(function()
            TweenService:Create(imageLabel7, TweenInfo.new(0.15), {ImageColor3 = GlassState.AccentColor}):Play()
        end)
        textButton3.MouseLeave:Connect(function()
            TweenService:Create(imageLabel7, TweenInfo.new(0.15), {ImageColor3 = GetUIColor("Search Icon Color", Color3.new(1, 1, 1))}):Play()
        end)
        textButton3.MouseButton1Click:Connect(function()
            flag2 = not flag2
            TweenService:Create(frame18, TweenInfo.new(math.max(0.16, GlassState.AnimationSpeed), Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = flag2 and UDim2.new(0, 185, 0, 24) or UDim2.new(0, 24, 0, 24)
            }):Play()
        end)

        textBox2:GetPropertyChangedSignal("Text"):Connect(function()
            for _, v11 in next, scrollingFrame2:GetChildren() do
                if v11:IsA("Frame") then
                    v11.Visible = string.find(string.lower(v11.Name), string.lower(textBox2.Text)) ~= nil
                end
            end
        end)

        if layoutOrder == 0 then
            frame15.BackgroundTransparency = 0
            frame12.BackgroundTransparency = 0.55
            v5 = frame17
        end

        textButton2.MouseButton1Click:Connect(function()
            if uiPageLayout.CurrentPage ~= frame17 then
                uiPageLayout:JumpTo(frame17)
                if GlassState.BounceEnabled then
                    pageScale.Scale = 0.975
                    TweenService:Create(pageScale, TweenInfo.new(math.max(0.16, GlassState.AnimationSpeed), Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Scale = 1
                    }):Play()
                end
            end
            local dur = math.max(0.14, GlassState.AnimationSpeed)
            for _, v11 in next, scrollingFrame:GetChildren() do
                if v11:FindFirstChild("Frame") and v11.Frame:FindFirstChild("Line") and v11.Frame.Line:FindFirstChild("PageInLine") then
                    local isSelected = (v11.Name == text2 .. "_Control")
                    TweenService:Create(v11.Frame.Line.PageInLine, TweenInfo.new(dur, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        BackgroundTransparency = isSelected and 0 or 1,
                        Size = isSelected and UDim2.new(0, 4, 0, 18) or UDim2.new(0, 4, 0, 8),
                    }):Play()
                    TweenService:Create(v11, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = isSelected and 0.52 or 0.88
                    }):Play()
                end
            end
            v5 = frame17
        end)

        local pageObj = {}
        pageObj.CreateSection = function(text4, arg3, arg4, arg5, arg6)
            if text4 == pageObj then
                text4, arg3, arg4, arg5 = arg3, arg4, arg5, arg6
            end
            text4 = tostring(text4 or "Section")
            local flag3 = arg3 or false

            local frame20 = Instance.new("Frame", scrollingFrame2)
            frame20.Name = text4 .. "_Dot"
            frame20.Size = UDim2.new(1, -6, 0, 34)
            frame20.BackgroundColor3 = GlassState.CardColor
            frame20.BackgroundTransparency = math.clamp(GlassState.CardTransparency + 0.08, 0.15, 0.88)
            frame20.ClipsDescendants = true

            local uiCorner9 = Instance.new("UICorner", frame20)
            uiCorner9.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 2))
            CreateGlassStroke(frame20, 1, 0.08)

            Instance.new("UIPadding", frame20).PaddingBottom = UDim.new(0, 6)

            local uiGradient5 = Instance.new("UIGradient", frame20)
            uiGradient5.Rotation = 90
            local function updateSecGrad()
                uiGradient5.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, GlassState.CardColor:Lerp(Color3.new(1, 1, 1), 0.05)),
                    ColorSequenceKeypoint.new(1, GlassState.PanelColor),
                })
            end
            updateSecGrad()

            local frame21 = Instance.new("Frame", frame20)
            frame21.Name = "Topsec"
            frame21.BackgroundTransparency = 1
            frame21.Size = UDim2.new(1, 0, 0, 32)

            local textLabel5 = Instance.new("TextLabel", frame21)
            textLabel5.Name = "Sectiontitle"
            textLabel5.BackgroundTransparency = 1
            textLabel5.Position = UDim2.new(0, 10, 0, 0)
            textLabel5.Size = UDim2.new(1, -44, 1, 0)
            textLabel5.Font = Enum.Font.GothamBold
            textLabel5.Text = text4
            textLabel5.TextSize = 13
            SetTruncate(textLabel5)
            textLabel5.TextXAlignment = Enum.TextXAlignment.Left
            textLabel5.TextColor3 = arg5 or GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.25)

            local frame22 = Instance.new("Frame", frame21)
            frame22.Name = "Linesec"
            frame22.AnchorPoint = Vector2.new(0.5, 1)
            frame22.BorderSizePixel = 0
            frame22.Position = UDim2.new(0.5, 0, 1, -1)
            frame22.Size = UDim2.new(1, -16, 0, 1.5)
            frame22.BackgroundColor3 = arg5 or GlassState.AccentColor
            Instance.new("UIGradient", frame22).Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.9), NumberSequenceKeypoint.new(0.25, 0.1),
                NumberSequenceKeypoint.new(0.75, 0.1), NumberSequenceKeypoint.new(1, 0.9),
            })

            RegisterThemeListener(function()
                if not frame20.Parent then return false end
                frame20.BackgroundColor3 = GlassState.CardColor
                frame20.BackgroundTransparency = math.clamp(GlassState.CardTransparency + 0.08, 0.15, 0.88)
                uiCorner9.CornerRadius = UDim.new(0, math.max(4, GlassState.CornerRadius - 2))
                updateSecGrad()
                if not arg5 then
                    textLabel5.TextColor3 = GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.25)
                    frame22.BackgroundColor3 = GlassState.AccentColor
                end
            end)

            local n10, flag4 = nil, false
            if flag3 then
                local frame23 = Instance.new("Frame", frame21)
                frame23.Name = "VisibilitySectionFrame"
                frame23.AnchorPoint = Vector2.new(1, 0.5)
                frame23.BackgroundColor3 = GlassState.PanelColor
                frame23.BackgroundTransparency = 0.45
                frame23.Position = UDim2.new(1, -10, 0.5, 0)
                frame23.Size = UDim2.new(0, 22, 0, 22)
                Instance.new("UICorner", frame23).CornerRadius = UDim.new(0, 6)

                local imageButton = Instance.new("ImageButton", frame23)
                imageButton.Name = "visibility"
                imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
                imageButton.BackgroundTransparency = 1
                imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
                imageButton.Size = UDim2.new(1, -4, 1, -4)
                imageButton.ZIndex = 2
                imageButton.Image = "rbxassetid://3926307971"
                imageButton.ImageRectOffset = Vector2.new(84, 44)
                imageButton.ImageRectSize = Vector2.new(36, 36)
                imageButton.ImageTransparency = 1

                local imageButton2 = Instance.new("ImageButton", frame23)
                imageButton2.Name = "visibility_off"
                imageButton2.AnchorPoint = Vector2.new(0.5, 0.5)
                imageButton2.BackgroundTransparency = 1
                imageButton2.Position = UDim2.new(0.5, 0, 0.5, 0)
                imageButton2.Size = UDim2.new(1, -4, 1, -4)
                imageButton2.ZIndex = 2
                imageButton2.Image = "rbxassetid://3926307971"
                imageButton2.ImageRectOffset = Vector2.new(564, 44)
                imageButton2.ImageRectSize = Vector2.new(36, 36)
                imageButton2.ImageTransparency = 0

                local textButton4 = Instance.new("TextButton", frame21)
                textButton4.Name = "VisibilityButton"
                textButton4.AnchorPoint = Vector2.new(1, 0.5)
                textButton4.BackgroundTransparency = 1
                textButton4.Text = ""
                textButton4.ZIndex = 3
                textButton4.Position = UDim2.new(1, -10, 0.5, 0)
                textButton4.Size = UDim2.new(0, 22, 0, 22)
                AttachClickJuice(textButton4, frame23, {HoverScale = 1.12, PressScale = 0.88})

                textButton4.MouseButton1Down:Connect(function()
                    flag4 = not flag4
                    local spd = math.max(0.14, GlassState.AnimationSpeed)
                    TweenService:Create(imageButton, TweenInfo.new(spd * 0.6), {ImageTransparency = flag4 and 0 or 1}):Play()
                    TweenService:Create(imageButton2, TweenInfo.new(spd * 0.6), {ImageTransparency = flag4 and 1 or 0}):Play()
                    TweenService:Create(frame20, TweenInfo.new(spd * 1.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, -6, 0, flag4 and (n10 or 34) or 34)
                    }):Play()
                end)
            end

            if arg4 then
                local gap = Instance.new("Frame", scrollingFrame2)
                gap.Name = "SectionGap"
                gap.Size = UDim2.new(1, -6, 0, 24)
                gap.BackgroundTransparency = 1
            end

            local uiListLayout4 = Instance.new("UIListLayout", frame20)
            uiListLayout4.Name = "SectionList"
            uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
            uiListLayout4.Padding = UDim.new(0, 6)
            uiListLayout4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                n10 = uiListLayout4.AbsoluteContentSize.Y + 8
                if not flag3 then
                    frame20.Size = UDim2.new(1, -6, 0, n10)
                elseif flag4 then
                    TweenService:Create(frame20, TweenInfo.new(math.max(0.14, GlassState.AnimationSpeed), Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, -6, 0, n10)
                    }):Play()
                end
            end)

            local secObj = {}

            secObj.CreateToggle = function(arg6, arg7, arg8)
                if arg6 == secObj then arg6, arg7 = arg7, arg8 end
                arg6 = arg6 or {}
                local text5 = tostring(arg6.Title or "Toggle")
                local desc2 = arg6.Desc
                local default = arg6.Default
                if default == nil then default = false end
                local fn7 = arg7 or function() end

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = "ToggleFrame"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 0)
                frame23.AutomaticSize = Enum.AutomaticSize.Y

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "TogFrame1"
                frame24.AnchorPoint = Vector2.new(0.5, 0)
                frame24.BackgroundTransparency = 1
                frame24.Position = UDim2.new(0.5, 0, 0, 0)
                frame24.Size = UDim2.new(1, -12, 0, 0)
                frame24.AutomaticSize = Enum.AutomaticSize.Y

                local frame28 = Instance.new("Frame", frame24)
                frame28.Name = "Background1"
                frame28.Size = UDim2.new(1, 0, 1, 0)
                frame28.ZIndex = 1
                frame28.BackgroundColor3 = GlassState.PanelColor
                frame28.BackgroundTransparency = GlassState.CardTransparency
                Instance.new("UICorner", frame28).CornerRadius = UDim.new(0, 8)
                CreateGlassStroke(frame28, 1, 0.12)

                local togPad = Instance.new("UIPadding", frame24)
                togPad.PaddingTop = UDim.new(0, 7); togPad.PaddingBottom = UDim.new(0, 7)

                local frame25 = Instance.new("Frame", frame24)
                frame25.Name = "checkbox"
                frame25.AnchorPoint = Vector2.new(1, 0.5)
                frame25.Position = UDim2.new(1, -10, 0.5, 0)
                frame25.Size = UDim2.new(0, 42, 0, 22)
                frame25.BackgroundColor3 = default and GlassState.AccentColor or Color3.fromRGB(92, 98, 114)
                frame25.BackgroundTransparency = default and 0.12 or 0.45
                frame25.BorderSizePixel = 0
                frame25.ZIndex = 3
                Instance.new("UICorner", frame25).CornerRadius = UDim.new(1, 0)

                local pillStroke = Instance.new("UIStroke", frame25)
                pillStroke.Thickness = 1
                pillStroke.Color = default and GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.35) or GlassState.BorderColor
                pillStroke.Transparency = 0.35

                local frame27 = Instance.new("Frame", frame25)
                frame27.Name = "check"
                frame27.AnchorPoint = Vector2.new(0, 0.5)
                frame27.BackgroundColor3 = GetUIColor("Toggle Checked Color", Color3.fromRGB(245, 250, 255))
                frame27.Position = default and UDim2.new(1, -19, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
                frame27.Size = UDim2.new(0, 16, 0, 16)
                frame27.ZIndex = 4
                Instance.new("UICorner", frame27).CornerRadius = UDim.new(1, 0)

                local textContainer = Instance.new("Frame", frame24)
                textContainer.BackgroundTransparency = 1
                textContainer.Position = UDim2.new(0, 10, 0, 0)
                textContainer.Size = UDim2.new(1, -64, 0, 0)
                textContainer.AutomaticSize = Enum.AutomaticSize.Y
                textContainer.ZIndex = 2

                local textColLayout = Instance.new("UIListLayout", textContainer)
                textColLayout.SortOrder = Enum.SortOrder.LayoutOrder
                textColLayout.Padding = UDim.new(0, 2)

                local textLabel7 = Instance.new("TextLabel", textContainer)
                textLabel7.Name = "TextColor"
                textLabel7.BackgroundTransparency = 1
                textLabel7.Size = UDim2.new(1, 0, 0, 20)
                textLabel7.Font = Enum.Font.GothamSemibold
                textLabel7.Text = text5
                textLabel7.TextSize = 13
                textLabel7.TextXAlignment = Enum.TextXAlignment.Left
                textLabel7.TextYAlignment = Enum.TextYAlignment.Center
                textLabel7.RichText = true
                textLabel7.AutomaticSize = Enum.AutomaticSize.Y
                textLabel7.TextWrapped = true
                textLabel7.TextColor3 = GlassState.TextColor
                textLabel7.LayoutOrder = 1

                local textLabel6 = Instance.new("TextLabel")
                if desc2 then
                    textLabel6.Name = "ToggleDesc"
                    textLabel6.Parent = textContainer
                    textLabel6.BackgroundTransparency = 1
                    textLabel6.Size = UDim2.new(1, 0, 0, 0)
                    textLabel6.Font = Enum.Font.GothamSemibold
                    textLabel6.Text = desc2
                    textLabel6.TextSize = 11.5
                    textLabel6.TextWrapped = true
                    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel6.RichText = true
                    textLabel6.AutomaticSize = Enum.AutomaticSize.Y
                    textLabel6.TextColor3 = GetUIColor("Toggle Desc Color", Color3.fromRGB(184, 194, 210))
                    textLabel6.LayoutOrder = 2
                else
                    textLabel6.Text = ""
                end

                local textButton4 = Instance.new("TextButton", frame24)
                textButton4.Name = "ToggleButton"
                textButton4.BackgroundTransparency = 1
                textButton4.Size = UDim2.new(1, 0, 1, 0)
                textButton4.Text = ""
                textButton4.ZIndex = 5
                AttachClickJuice(textButton4, frame28, {HoverScale = 1.012, PressScale = 0.978, HoverTransparency = 0.91, RippleTarget = frame28})

                RegisterThemeListener(function()
                    if not frame28.Parent then return false end
                    frame28.BackgroundColor3 = GlassState.PanelColor
                    frame28.BackgroundTransparency = GlassState.CardTransparency
                    textLabel7.TextColor3 = GlassState.TextColor
                    if default then
                        frame25.BackgroundColor3 = GlassState.AccentColor
                        pillStroke.Color = GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.35)
                    end
                end)

                local function fn8(arg8)
                    local dur = math.max(0.14, GlassState.AnimationSpeed)
                    TweenService:Create(frame25, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = arg8 and GlassState.AccentColor or Color3.fromRGB(92, 98, 114),
                        BackgroundTransparency = arg8 and 0.12 or 0.45,
                    }):Play()
                    TweenService:Create(pillStroke, TweenInfo.new(dur), {
                        Color = arg8 and GlassState.AccentColor:Lerp(Color3.new(1, 1, 1), 0.35) or GlassState.BorderColor
                    }):Play()
                    TweenService:Create(frame27, TweenInfo.new(dur * 0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 21, 0, 15)}):Play()
                    TweenService:Create(frame27, TweenInfo.new(dur * 1.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Position = arg8 and UDim2.new(1, -19, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
                    }):Play()
                    task.delay(dur * 0.45, function()
                        if frame27.Parent then
                            TweenService:Create(frame27, TweenInfo.new(dur * 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 16, 0, 16)}):Play()
                        end
                    end)
                    fn7(arg8)
                end

                if fn7 then fn8(default) end
                local function fn9() default = not default; fn8(default) end
                textButton4.MouseButton1Down:Connect(fn9)

                local functionCreate = {
                    SetStage = function(arg8) if arg8 ~= default then fn9() end end,
                    GetText = function() return textLabel7 end,
                }
                arg6.FunctionCreate = functionCreate
                arg6.Page_Name = text2
                arg6.Section_Name = text4
                tbl3:RegisterOption(arg6, fn7)
                return functionCreate
            end

            secObj.CreateButton = function(arg6, arg7, arg8)
                if arg6 == secObj then arg6, arg7 = arg7, arg8 end
                arg6 = arg6 or {}
                local title, icon = arg6.Title, arg6.Icon
                local fn7 = arg7 or function() end
                arg6.Page_Name = text2; arg6.Section_Name = text4; arg6.Button = true

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = (title or "Button") .. "_Row"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 40)

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "RowBG"
                frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                frame24.Size = UDim2.new(1, -12, 1, 0)
                frame24.BackgroundColor3 = GlassState.PanelColor
                frame24.BackgroundTransparency = GlassState.CardTransparency
                Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 8)
                CreateGlassStroke(frame24, 1, 0.12)

                local textLabel6 = Instance.new("TextLabel", frame24)
                textLabel6.Name = "TextColor"
                textLabel6.BackgroundTransparency = 1
                textLabel6.Position = UDim2.new(0, 12, 0, 0)
                textLabel6.Size = UDim2.new(1, -118, 1, 0)
                textLabel6.Font = Enum.Font.GothamSemibold
                textLabel6.Text = title or "Button"
                textLabel6.TextSize = 13
                SetTruncate(textLabel6)
                textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                textLabel6.TextColor3 = GlassState.TextColor

                local frame26 = Instance.new("Frame", frame24)
                frame26.Name = "ClickArea"
                frame26.AnchorPoint = Vector2.new(1, 0.5)
                frame26.Position = UDim2.new(1, -8, 0.5, 0)
                frame26.Size = UDim2.new(0, 96, 0, 28)
                frame26.BackgroundColor3 = GlassState.AccentColor
                frame26.BackgroundTransparency = 0.22
                Instance.new("UICorner", frame26).CornerRadius = UDim.new(0, 7)

                local btnStroke = Instance.new("UIStroke", frame26)
                btnStroke.Thickness = 1; btnStroke.Color = Color3.new(1, 1, 1); btnStroke.Transparency = 0.55

                local uiGradient6 = Instance.new("UIGradient", frame26)
                uiGradient6.Rotation = 90
                uiGradient6.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 220, 235)),
                })

                local contrastCol = GetContrastText(GlassState.AccentColor)
                local textButton4 = Instance.new("TextButton", frame26)
                textButton4.Name = "Button"
                textButton4.BackgroundTransparency = 1
                textButton4.Size = UDim2.new(1, 0, 1, 0)
                textButton4.AutoButtonColor = false
                textButton4.Font = Enum.Font.GothamBold
                textButton4.Text = "Click"
                textButton4.TextSize = 12
                textButton4.TextColor3 = contrastCol
                textButton4.ZIndex = frame26.ZIndex + 3

                local iconLblRef = nil
                if icon then
                    if typeof(icon) == "string" and string.find(icon, "rbxassetid://") == 1 then
                        local imageLabel10 = Instance.new("ImageLabel", frame26)
                        imageLabel10.BackgroundTransparency = 1
                        imageLabel10.Size = UDim2.new(0, 16, 0, 16)
                        imageLabel10.Position = UDim2.new(0, 10, 0.5, -8)
                        imageLabel10.Image = icon
                        imageLabel10.ScaleType = Enum.ScaleType.Fit
                        textButton4.Text = "Click"
                        textButton4.TextXAlignment = Enum.TextXAlignment.Left
                        textButton4.Position = UDim2.new(0, 32, 0, 0)
                        textButton4.Size = UDim2.new(1, -34, 1, 0)
                    else
                        local iconLbl = Instance.new("TextLabel", frame26)
                        iconLbl.BackgroundTransparency = 1
                        iconLbl.Size = UDim2.new(0, 18, 1, 0)
                        iconLbl.Position = UDim2.new(0, 9, 0, 0)
                        iconLbl.Font = Enum.Font.GothamBold
                        iconLbl.Text = tostring(icon)
                        iconLbl.TextSize = 13
                        iconLbl.TextColor3 = contrastCol
                        iconLblRef = iconLbl
                        textButton4.Text = "Click"
                        textButton4.TextXAlignment = Enum.TextXAlignment.Left
                        textButton4.Position = UDim2.new(0, 32, 0, 0)
                        textButton4.Size = UDim2.new(1, -34, 1, 0)
                    end
                end

                AttachClickJuice(textButton4, frame26, {HoverScale = 1.06, PressScale = 0.92, HoverTransparency = 0.80, RippleColor = Color3.new(1, 1, 1)})
                textButton4.MouseEnter:Connect(function()
                    TweenService:Create(frame24, TweenInfo.new(0.16), {BackgroundTransparency = math.max(0.15, GlassState.CardTransparency - 0.10)}):Play()
                end)
                textButton4.MouseLeave:Connect(function()
                    TweenService:Create(frame24, TweenInfo.new(0.16), {BackgroundTransparency = GlassState.CardTransparency}):Play()
                end)
                textButton4.MouseButton1Down:Connect(function() task.defer(fn7) end)

                RegisterThemeListener(function()
                    if not frame24.Parent then return false end
                    local cText = GetContrastText(GlassState.AccentColor)
                    frame24.BackgroundColor3 = GlassState.PanelColor
                    frame24.BackgroundTransparency = GlassState.CardTransparency
                    textLabel6.TextColor3 = GlassState.TextColor
                    frame26.BackgroundColor3 = GlassState.AccentColor
                    textButton4.TextColor3 = cText
                    if iconLblRef then iconLblRef.TextColor3 = cText end
                end)

                arg6.FunctionCreate = {GetText = function() return textLabel6 end}
                tbl3:RegisterOption(arg6, fn7)
            end

            secObj.CreateLabel = function(arg6, arg7)
                if arg6 == secObj then arg6 = arg7 end
                arg6 = arg6 or {}
                local v10 = tostring(arg6.Title or "Label")
                local customBgColor = arg6.Color
                local customTextColor = arg6.TextColor

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = "LabelFrame"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 0)
                frame23.AutomaticSize = Enum.AutomaticSize.Y

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "LabelBG"
                frame24.AnchorPoint = Vector2.new(0.5, 0)
                frame24.Position = UDim2.new(0.5, 0, 0, 0)
                frame24.Size = UDim2.new(1, -12, 0, 28)
                frame24.AutomaticSize = Enum.AutomaticSize.Y
                frame24.BackgroundColor3 = customBgColor or GlassState.PanelColor
                frame24.BackgroundTransparency = arg6.Invisible and 1 or GlassState.CardTransparency
                Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 8)
                local uiStroke6 = CreateGlassStroke(frame24, 1, 0.14)
                if arg6.Invisible then uiStroke6.Transparency = 1 end

                local textLabel6 = Instance.new("TextLabel", frame24)
                textLabel6.Name = "TextColor"
                textLabel6.BackgroundTransparency = 1
                textLabel6.Position = UDim2.new(0, 12, 0, 6)
                textLabel6.Size = UDim2.new(1, -24, 0, 16)
                textLabel6.Font = Enum.Font.GothamSemibold
                textLabel6.Text = v10
                textLabel6.TextSize = 13
                textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                textLabel6.AutomaticSize = Enum.AutomaticSize.Y
                textLabel6.TextWrapped = true
                textLabel6.TextColor3 = customTextColor or GlassState.TextColor
                textLabel6.TextStrokeTransparency = GetUIColor("Text Stroke Transparency", 0.85)
                if arg6.Invisible then textLabel6.TextTransparency = 1 end
                Instance.new("UIPadding", frame24).PaddingBottom = UDim.new(0, 6)

                RegisterThemeListener(function()
                    if not frame24.Parent then return false end
                    if not arg6.Invisible then
                        if not customBgColor then frame24.BackgroundColor3 = GlassState.PanelColor end
                        frame24.BackgroundTransparency = GlassState.CardTransparency
                    end
                    if not customTextColor then textLabel6.TextColor3 = GlassState.TextColor end
                end)

                local functionCreate = {
                    SetText = function(text5) textLabel6.Text = text5 end,
                    GetText = function() return textLabel6.Text end,
                    SetColor = function(textColor3) customTextColor = textColor3; textLabel6.TextColor3 = textColor3 end,
                    Highlight = function(arg7)
                        TweenService:Create(uiStroke6, TweenInfo.new(0.25), {Transparency = 0.15, Color = arg7 or GlassState.AccentColor}):Play()
                        TweenService:Create(frame24, TweenInfo.new(0.25), {BackgroundTransparency = 0.20}):Play()
                    end,
                }
                arg6.Page_Name = text2; arg6.Section_Name = text4; arg6.TextLabel = true; arg6.FunctionCreate = functionCreate
                tbl3:RegisterOption(arg6, nil)
                return functionCreate
            end

            secObj.CreateDropdown = function(arg6, arg7, arg8)
                if arg6 == secObj then arg6, arg7 = arg7, arg8 end
                arg6 = arg6 or {}
                local str2 = tostring(arg6.Title or "Dropdown")
                local list = arg6.List or {}
                local flag5 = arg6.Search or false
                local flag6 = arg6.Selected or false
                local flag7 = arg6.Slider or false
                local flag8 = arg6.SliderRelease or false
                local default = arg6.Default
                local flag9 = arg6.Priority or false
                local fn7 = arg7 or function() end
                local sortPairs = arg6.SortPairs or pairs

                local tbl7, tbl8 = {}, {}
                if flag7 and type(default) == "table" then
                    for k, v9 in sortPairs(default) do tbl7[k] = v9 end
                end

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = str2 .. "DropdownFrame"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 32)

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "Background1"
                frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                frame24.Size = UDim2.new(1, -12, 1, 0)
                frame24.ClipsDescendants = true
                frame24.BackgroundColor3 = GlassState.PanelColor
                frame24.BackgroundTransparency = GlassState.CardTransparency
                Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 8)
                CreateGlassStroke(frame24, 1, 0.12)

                local frame25 = Instance.new("Frame", frame24)
                frame25.Name = "Background2"
                frame25.Size = UDim2.new(1, 0, 0, 32)
                frame25.BackgroundColor3 = GlassState.CardColor
                frame25.BackgroundTransparency = math.clamp(GlassState.CardTransparency - 0.08, 0.12, 0.85)
                Instance.new("UICorner", frame25).CornerRadius = UDim.new(0, 8)

                local textBox3 = flag5 and Instance.new("TextBox", frame25) or Instance.new("TextLabel", frame25)
                textBox3.Name = "TextColorPlaceholder"
                textBox3.BackgroundTransparency = 1
                textBox3.Position = UDim2.new(0, 10, 0, 0)
                textBox3.Size = UDim2.new(1, -40, 1, 0)
                textBox3.Font = Enum.Font.GothamSemibold
                textBox3.Text = ""
                textBox3.TextSize = 13
                textBox3.TextXAlignment = Enum.TextXAlignment.Left
                textBox3.ClipsDescendants = true
                textBox3.TextColor3 = GlassState.TextColor

                local stringValue = Instance.new("StringValue", textBox3)
                stringValue.Value = ""

                local tbl9 = nil
                if flag9 then
                    tbl9 = {}
                    if typeof(default) == "table" then
                        for _, v9 in ipairs(default) do table.insert(tbl9, v9) end
                    end
                end

                if default and table.find(list, default) then stringValue.Value = default end
                if flag5 then
                    textBox3.PlaceholderColor3 = GetUIColor("Placeholder Text Color", Color3.fromRGB(168, 178, 194))
                    textBox3.PlaceholderText = str2 .. ": " .. tostring(default or "")
                else
                    textBox3.Text = str2 .. ": " .. tostring(default or "")
                end

                local imageLabel9 = Instance.new("ImageLabel", frame25)
                imageLabel9.Name = "ImgDrop"
                imageLabel9.AnchorPoint = Vector2.new(1, 0.5)
                imageLabel9.BackgroundTransparency = 1
                imageLabel9.Position = UDim2.new(1, -9, 0.5, 0)
                imageLabel9.Size = UDim2.new(0, 14, 0, 14)
                imageLabel9.Image = "rbxassetid://6954383209"
                imageLabel9.ImageColor3 = GetUIColor("Dropdown Icon Color", Color3.new(1, 1, 1))

                local textButton4 = Instance.new("TextButton", frame25)
                textButton4.Name = "DropdownButton"
                textButton4.BackgroundTransparency = 1
                textButton4.Size = flag5 and UDim2.new(0, 32, 0, 32) or UDim2.new(1, 0, 1, 0)
                textButton4.Position = flag5 and UDim2.new(1, -34, 0, 0) or UDim2.new(0, 0, 0, 0)
                textButton4.Text = ""
                textButton4.ZIndex = frame25.ZIndex + 3
                AttachClickJuice(textButton4, frame25, {HoverScale = 1.012, PressScale = 0.978, HoverTransparency = 0.90})

                local frame26 = Instance.new("Frame", frame24)
                frame26.Name = "Dropdownlisttt"
                frame26.BackgroundTransparency = 1
                frame26.BorderSizePixel = 0
                frame26.Position = UDim2.new(0, 0, 0, 32)
                frame26.Size = UDim2.new(1, 0, 0, 0)

                local scrollingFrame3 = Instance.new("ScrollingFrame", frame26)
                scrollingFrame3.Name = "DropdownScroll"
                scrollingFrame3.Active = true
                scrollingFrame3.BackgroundTransparency = 1
                scrollingFrame3.BorderSizePixel = 0
                scrollingFrame3.Size = UDim2.new(1, 0, 1, 0)
                scrollingFrame3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)
                scrollingFrame3.ScrollBarThickness = 4
                scrollingFrame3.ScrollBarImageTransparency = 0.45
                scrollingFrame3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                scrollingFrame3.ScrollingEnabled = true
                scrollingFrame3.VerticalScrollBarInset = Enum.ScrollBarInset.Always

                local frame27 = Instance.new("Frame", scrollingFrame3)
                frame27.Name = "ScrollContainer"
                frame27.BackgroundTransparency = 1
                frame27.Position = UDim2.new(0, 6, 0, 6)
                frame27.Size = UDim2.new(1, -14, 0, 0)
                frame27.AutomaticSize = Enum.AutomaticSize.Y

                local uiListLayout5 = Instance.new("UIListLayout", frame27)
                uiListLayout5.Name = "ScrollContainerList"
                uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                uiListLayout5.Padding = UDim.new(0, 5)
                uiListLayout5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 12 + uiListLayout5.AbsoluteContentSize.Y + 4)
                end)

                RegisterThemeListener(function()
                    if not frame24.Parent then return false end
                    frame24.BackgroundColor3 = GlassState.PanelColor
                    frame24.BackgroundTransparency = GlassState.CardTransparency
                    frame25.BackgroundColor3 = GlassState.CardColor
                    frame25.BackgroundTransparency = math.clamp(GlassState.CardTransparency - 0.08, 0.12, 0.85)
                    textBox3.TextColor3 = GlassState.TextColor
                    scrollingFrame3.ScrollBarImageColor3 = GlassState.AccentColor
                end)

                local flag10 = false
                local tbl10, tbl11 = {}, {}

                local function fn8()
                    for k in sortPairs(tbl10) do tbl10[k] = nil end
                    for _, child in sortPairs(frame27:GetChildren()) do
                        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") and not child:IsA("UIGridLayout") then
                            child.Visible = false
                        end
                    end
                    local low = string.lower(textBox3.Text)
                    if textBox3.Text ~= low then textBox3.Text = low end
                end

                local function fn9()
                    for _, v9 in sortPairs(tbl11) do
                        if string.find(v9, textBox3.Text) then table.insert(tbl10, v9) end
                    end
                    for _, v16 in sortPairs(frame27:GetChildren()) do
                        for _, v17 in sortPairs(tbl10) do
                            if v17 == v16.Name then v16.Visible = true end
                        end
                    end
                end

                local function fn10()
                    for _, v11 in next, frame27:GetChildren() do
                        if v11:IsA("Frame") then v11:Destroy() end
                    end
                end

                local tbl12 = list
                local fn11
                fn11 = function(arg8)
                    sortPairs = arg8 or sortPairs
                    fn10()
                    tbl11 = {}

                    for k, v10 in sortPairs(tbl12) do
                        if flag6 then table.insert(tbl11, string.lower(tostring(k)))
                        elseif flag7 then table.insert(tbl11, string.lower(tostring((type(v10) == "table" and v10.Title) or k or "")))
                        else table.insert(tbl11, string.lower(tostring(v10))) end
                    end

                    if flag6 then
                        for k, v10 in sortPairs(tbl12) do
                            local v11 = v10
                            local frame28 = Instance.new("Frame", frame27)
                            frame28.Name = string.lower(tostring(k)); frame28.BackgroundTransparency = 1; frame28.LayoutOrder = 1; frame28.Size = UDim2.new(1, 0, 0, 28)

                            local frame29 = Instance.new("Frame", frame28)
                            frame29.Name = "SampleItemBG"; frame29.AnchorPoint = Vector2.new(0.5, 0.5); frame29.Position = UDim2.new(0.5, 0, 0.5, 0); frame29.Size = UDim2.new(1, 0, 1, 0)
                            frame29.BackgroundColor3 = v11 and GlassState.AccentColor or Color3.new(1, 1, 1)
                            frame29.BackgroundTransparency = v11 and 0.65 or 0.94
                            Instance.new("UICorner", frame29).CornerRadius = UDim.new(0, 6)

                            local textLabel6 = Instance.new("TextLabel", frame29)
                            textLabel6.Name = "SampleItemTitle"; textLabel6.BackgroundTransparency = 1; textLabel6.Position = UDim2.new(0, 10, 0, 0); textLabel6.Size = UDim2.new(1, -40, 1, 0)
                            textLabel6.Font = Enum.Font.GothamSemibold; textLabel6.Text = tostring(k); textLabel6.TextColor3 = GlassState.TextColor; textLabel6.TextSize = 12.5; SetTruncate(textLabel6); textLabel6.TextXAlignment = Enum.TextXAlignment.Left

                            local imageButton = Instance.new("ImageButton", frame29)
                            imageButton.Name = "SampleItemCheck"; imageButton.AnchorPoint = Vector2.new(1, 0.5); imageButton.BackgroundTransparency = 1; imageButton.Position = UDim2.new(1, -6, 0.5, 0); imageButton.Size = UDim2.new(0, 18, 0, 18); imageButton.ZIndex = 2
                            imageButton.Image = "rbxassetid://3926305904"; imageButton.ImageColor3 = GlassState.AccentColor; imageButton.ImageRectOffset = Vector2.new(312, 4); imageButton.ImageRectSize = Vector2.new(24, 24)
                            imageButton.ImageTransparency = v11 and 0 or 1

                            local textButton5 = Instance.new("TextButton", frame28)
                            textButton5.Name = "SampleItemButton"; textButton5.BackgroundTransparency = 1; textButton5.Size = UDim2.new(1, 0, 1, 0); textButton5.Text = ""; textButton5.ZIndex = 3
                            AttachClickJuice(textButton5, frame29, {HoverScale = 1.015, PressScale = 0.96, NoHoverOverlay = true})

                            textButton5.MouseEnter:Connect(function()
                                if v11 then return end
                                TweenService:Create(frame29, TweenInfo.new(0.14), {BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.85}):Play()
                            end)
                            textButton5.MouseLeave:Connect(function()
                                if v11 then return end
                                TweenService:Create(frame29, TweenInfo.new(0.14), {BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94}):Play()
                            end)
                            textButton5.MouseButton1Click:Connect(function()
                                v11 = not v11
                                local dur = math.max(0.12, GlassState.AnimationSpeed * 0.8)
                                TweenService:Create(imageButton, TweenInfo.new(dur), {ImageTransparency = v11 and 0 or 1}):Play()
                                TweenService:Create(frame29, TweenInfo.new(dur), {BackgroundColor3 = v11 and GlassState.AccentColor or Color3.new(1, 1, 1), BackgroundTransparency = v11 and 0.65 or 0.94}):Play()
                                if fn7 then fn7(k, v11); tbl12[k] = v11 end
                                if flag5 then textBox3.PlaceholderText = str2 .. ": " else textBox3.Text = str2 .. ": " end
                            end)
                        end
                    elseif flag7 then
                        for k, v10 in sortPairs(tbl12) do
                            if type(v10) == "table" then
                                local text5 = tostring(v10.Title or k or "")
                                local n11, n12 = tonumber(v10.Min) or 0, tonumber(v10.Max) or 100
                                local flag11 = v10.Precise or false
                                local v11 = tonumber(v10.Default) or n11

                                local frame28 = Instance.new("Frame", frame27)
                                frame28.Name = string.lower(text5); frame28.BackgroundTransparency = 1; frame28.Size = UDim2.new(1, 0, 0, 50)

                                local frame29 = Instance.new("Frame", frame28)
                                frame29.Name = "Background1"; frame29.AnchorPoint = Vector2.new(0.5, 0.5); frame29.Position = UDim2.new(0.5, 0, 0.5, 0); frame29.Size = UDim2.new(1, 0, 1, 0)
                                frame29.BackgroundColor3 = GlassState.CardColor; frame29.BackgroundTransparency = 0.45
                                Instance.new("UICorner", frame29).CornerRadius = UDim.new(0, 7)

                                local textLabel6 = Instance.new("TextLabel", frame29)
                                textLabel6.Name = "TextColor"; textLabel6.BackgroundTransparency = 1; textLabel6.Position = UDim2.new(0, 10, 0, 2); textLabel6.Size = UDim2.new(1, -100, 0, 22)
                                textLabel6.Font = Enum.Font.GothamSemibold; textLabel6.Text = text5; textLabel6.TextSize = 12.5; SetTruncate(textLabel6); textLabel6.TextXAlignment = Enum.TextXAlignment.Left; textLabel6.TextColor3 = GlassState.TextColor

                                local frame32 = Instance.new("Frame", frame28)
                                frame32.Name = "Background2"; frame32.AnchorPoint = Vector2.new(1, 0); frame32.Position = UDim2.new(1, -8, 0, 4); frame32.Size = UDim2.new(0, 78, 0, 20)
                                frame32.BackgroundColor3 = GlassState.PanelColor; frame32.BackgroundTransparency = 0.25
                                Instance.new("UICorner", frame32).CornerRadius = UDim.new(0, 5)

                                local textBox4 = Instance.new("TextBox", frame32)
                                textBox4.Name = "TextColor"; textBox4.BackgroundTransparency = 1; textBox4.Size = UDim2.new(1, 0, 1, 0); textBox4.Font = Enum.Font.GothamBold; textBox4.Text = ""; textBox4.TextSize = 12; textBox4.TextColor3 = GlassState.AccentColor

                                local frame30 = Instance.new("Frame", frame28)
                                frame30.Name = "SliderBar"; frame30.AnchorPoint = Vector2.new(0.5, 0.5); frame30.Position = UDim2.new(0.5, 0, 0.5, 13); frame30.Size = UDim2.new(1, -20, 0, 6)
                                frame30.BackgroundColor3 = Color3.new(1, 1, 1); frame30.BackgroundTransparency = 0.85
                                Instance.new("UICorner", frame30).CornerRadius = UDim.new(1, 0)

                                local frame31 = Instance.new("Frame", frame30)
                                frame31.Name = "Bar"; frame31.BorderSizePixel = 0; frame31.Size = UDim2.new(0, 0, 1, 0); frame31.BackgroundColor3 = GlassState.AccentColor
                                Instance.new("UICorner", frame31).CornerRadius = UDim.new(1, 0)

                                local thumb = Instance.new("Frame", frame31)
                                thumb.AnchorPoint = Vector2.new(0.5, 0.5); thumb.Position = UDim2.new(1, 0, 0.5, 0); thumb.Size = UDim2.new(0, 12, 0, 12); thumb.BackgroundColor3 = Color3.new(1, 1, 1)
                                Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)

                                local textButton5 = Instance.new("TextButton", frame30)
                                textButton5.Name = "SliderButton "; textButton5.BackgroundTransparency = 1; textButton5.Position = UDim2.new(0, -6, 0, -8); textButton5.Size = UDim2.new(1, 12, 1, 16); textButton5.Text = ""
                                textButton5.MouseEnter:Connect(function() TweenService:Create(thumb, TweenInfo.new(0.14), {Size = UDim2.new(0, 15, 0, 15)}):Play() end)
                                textButton5.MouseLeave:Connect(function() TweenService:Create(thumb, TweenInfo.new(0.14), {Size = UDim2.new(0, 12, 0, 12)}):Play() end)

                                local function fn12(default2)
                                    textBox4.Text = tostring(default2); tbl12[k].Default = default2; tbl7[k] = default2
                                end

                                if v11 then
                                    v11 = math.clamp(v11, math.min(n11, n12), math.max(n11, n12))
                                    frame31.Size = UDim2.new((v11 - n11) / math.max(0.0001, (n12 - n11)), 0, 1, 0)
                                    fn12(v11)
                                end

                                local flag12, latestVal = false, v11
                                local function applySubDrag(posX)
                                    local ratio = math.clamp((posX - frame30.AbsolutePosition.X) / math.max(1, frame30.AbsoluteSize.X), 0, 1)
                                    local raw = n11 + (n12 - n11) * ratio
                                    local n15 = flag11 and tonumber(string.format("%.1f", raw)) or math.floor(raw + 0.5)
                                    latestVal = n15
                                    frame31.Size = UDim2.new(ratio, 0, 1, 0)
                                    fn12(n15)
                                    if not flag8 then fn7({Type = "SliderDropdown", KeyName = k, Value = n15, State = table.clone(tbl7)}) end
                                end

                                textButton5.InputBegan:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                        flag12 = true; applySubDrag(input.Position.X)
                                    end
                                end)
                                local sc1, sc2
                                sc1 = UserInputService.InputChanged:Connect(function(input)
                                    if not frame28.Parent then sc1:Disconnect(); sc2:Disconnect(); return end
                                    if flag12 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                                        applySubDrag(input.Position.X)
                                    end
                                end)
                                sc2 = UserInputService.InputEnded:Connect(function(input)
                                    if not frame28.Parent then sc1:Disconnect(); sc2:Disconnect(); return end
                                    if flag12 and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                                        flag12 = false
                                        if flag8 then fn7({Type = "SliderDropdown", KeyName = k, Value = latestVal, State = table.clone(tbl7)}) end
                                    end
                                end)

                                local function fn13(arg9, arg10)
                                    local num4 = tonumber(arg9)
                                    if not num4 then return end
                                    local v12 = math.clamp(num4, math.min(n11, n12), math.max(n11, n12))
                                    frame31.Size = UDim2.new((v12 - n11) / math.max(0.0001, (n12 - n11)), 0, 1, 0)
                                    fn12(v12)
                                    if arg10 then fn7({Type = "SliderDropdown", KeyName = k, Value = v12, State = table.clone(tbl7)}) end
                                end
                                textBox4.FocusLost:Connect(function() fn13(textBox4.Text, true) end)
                                tbl8[k] = {Bar = frame31, TextBox = textBox4, Min = n11, Max = n12}
                            end
                        end
                    else
                        local function fn12(arg9) return flag9 and table.find(tbl9, arg9) ~= nil end
                        local function fn13(arg9) return (not flag9) and (stringValue.Value == arg9) end

                        for _, v10 in sortPairs(tbl12) do
                            if typeof(v10) == "string" then
                                local frame28 = Instance.new("Frame", frame27)
                                frame28.Name = string.lower(v10); frame28.BackgroundTransparency = 1; frame28.LayoutOrder = 1; frame28.Size = UDim2.new(1, 0, 0, 28)

                                local frame29 = Instance.new("Frame", frame28)
                                frame29.Name = "SampleItemBG"; frame29.AnchorPoint = Vector2.new(0.5, 0.5); frame29.Position = UDim2.new(0.5, 0, 0.5, 0); frame29.Size = UDim2.new(1, 0, 1, 0)
                                frame29.BackgroundColor3 = Color3.new(1, 1, 1); frame29.BackgroundTransparency = 0.94
                                Instance.new("UICorner", frame29).CornerRadius = UDim.new(0, 6)

                                local imageButton = Instance.new("ImageButton", frame29)
                                imageButton.Name = "SampleItemCheck"; imageButton.AnchorPoint = Vector2.new(1, 0.5); imageButton.BackgroundTransparency = 1; imageButton.Position = UDim2.new(1, -6, 0.5, 0); imageButton.Size = UDim2.new(0, 18, 0, 18); imageButton.ZIndex = 2
                                imageButton.Image = "rbxassetid://3926305904"; imageButton.ImageColor3 = GlassState.AccentColor; imageButton.ImageRectOffset = Vector2.new(312, 4); imageButton.ImageRectSize = Vector2.new(24, 24); imageButton.ImageTransparency = 1

                                if flag9 then
                                    local v11 = Instance.new("TextLabel", frame29)
                                    v11.Name = "OrderLabel"; v11.AnchorPoint = Vector2.new(0, 0.5); v11.Position = UDim2.new(0, 8, 0.5, 0); v11.Size = UDim2.new(0, 20, 0, 20); v11.BackgroundTransparency = 1
                                    v11.Font = Enum.Font.GothamBold; v11.TextSize = 12; v11.TextColor3 = Color3.new(1, 1, 1); v11.TextXAlignment = Enum.TextXAlignment.Center; v11.Text = ""
                                    tbl9 = tbl9 or {}
                                    local v13 = table.find(tbl9, v10)
                                    if v13 then
                                        v11.Text = tostring(v13); frame29.BackgroundTransparency = 0.60; frame29.BackgroundColor3 = GlassState.AccentColor; imageButton.ImageTransparency = 0; frame28.LayoutOrder = v13
                                    else
                                        v11.Text = ""; if stringValue.Value ~= v10 then frame29.BackgroundTransparency = 0.94 end; imageButton.ImageTransparency = 1; frame28.LayoutOrder = 999
                                    end
                                end

                                local textLabel6 = Instance.new("TextLabel", frame29)
                                textLabel6.Name = "SampleItemTitle"; textLabel6.BackgroundTransparency = 1; textLabel6.Position = UDim2.new(0, flag9 and 30 or 10, 0, 0); textLabel6.Size = UDim2.new(1, flag9 and -60 or -40, 1, 0)
                                textLabel6.Font = Enum.Font.GothamSemibold; textLabel6.Text = v10; textLabel6.TextColor3 = GlassState.TextColor; textLabel6.TextSize = 12.5; SetTruncate(textLabel6); textLabel6.TextXAlignment = Enum.TextXAlignment.Left

                                local textButton5 = Instance.new("TextButton", frame28)
                                textButton5.Name = "SampleItemButton"; textButton5.BackgroundTransparency = 1; textButton5.Size = UDim2.new(1, 0, 1, 0); textButton5.Text = ""; textButton5.ZIndex = 3
                                AttachClickJuice(textButton5, frame29, {HoverScale = 1.015, PressScale = 0.96, NoHoverOverlay = true})

                                textButton5.MouseEnter:Connect(function()
                                    if fn12(v10) or fn13(v10) then return end
                                    TweenService:Create(frame29, TweenInfo.new(0.14), {BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.85}):Play()
                                end)
                                textButton5.MouseLeave:Connect(function()
                                    if fn12(v10) or fn13(v10) then return end
                                    TweenService:Create(frame29, TweenInfo.new(0.14), {BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94}):Play()
                                end)
                                textButton5.MouseButton1Click:Connect(function()
                                    if not flag9 then
                                        if flag5 then textBox3.PlaceholderText = str2 .. ": " .. v10; stringValue.Value = v10
                                        else textBox3.Text = str2 .. ": " .. v10; stringValue.Value = v10 end
                                        TweenService:Create(frame29, TweenInfo.new(0.16), {BackgroundColor3 = GlassState.AccentColor, BackgroundTransparency = 0.62}):Play()
                                        if fn7 then fn7(v10) end
                                        if flag5 then textBox3.Text = "" end
                                        fn11()
                                        return
                                    end
                                    local v12 = table.find(tbl9, v10)
                                    if v12 then table.remove(tbl9, v12) else table.insert(tbl9, v10) end
                                    if flag5 then textBox3.PlaceholderText = str2 .. ": " .. table.concat(tbl9, " > ")
                                    else textBox3.Text = str2 .. ": " .. table.concat(tbl9, " > ") end
                                    fn11()
                                    if fn7 then fn7(tbl9) end
                                end)

                                if stringValue.Value == v10 then
                                    frame29.BackgroundTransparency = 0.62; frame29.BackgroundColor3 = GlassState.AccentColor; imageButton.ImageTransparency = 0; frame28.LayoutOrder = 0
                                end
                            end
                        end
                    end
                end

                if flag5 then
                    textBox3:GetPropertyChangedSignal("Text"):Connect(function() fn8(); fn9() end)
                end

                if flag9 and typeof(default) == "table" then
                    local str3 = #default > 0 and table.concat(default, " > ") or "None"
                    if flag5 then textBox3.PlaceholderText = str2 .. ": " .. str3 else textBox3.Text = str2 .. ": " .. str3 end
                elseif typeof(default) == "table" then
                    if flag7 then textBox3.Text = ""; textBox3.PlaceholderText = str2 .. ": "
                    elseif flag6 then if flag5 then textBox3.PlaceholderText = str2 .. ": " else textBox3.Text = str2 .. ": " end end
                else
                    fn7(default)
                    if flag5 then textBox3.PlaceholderText = str2 .. ": " .. tostring(default or "") else textBox3.Text = str2 .. ": " .. tostring(default or "") end
                end

                textButton4.MouseButton1Click:Connect(function()
                    fn11()
                    flag10 = not flag10
                    local dur = math.max(0.16, GlassState.AnimationSpeed)
                    TweenService:Create(frame26, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = flag10 and UDim2.new(1, 0, 0, 172) or UDim2.new(1, 0, 0, 0)}):Play()
                    TweenService:Create(frame23, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = flag10 and UDim2.new(1, 0, 0, 206) or UDim2.new(1, 0, 0, 32)}):Play()
                    TweenService:Create(imageLabel9, TweenInfo.new(dur, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = flag10 and 90 or 0}):Play()
                end)

                local functionCreate = {
                    rf = fn11,
                    ClearText = function(arg8, arg9)
                        if flag9 and typeof(arg9) == "table" then
                            local str3 = #arg9 > 0 and table.concat(arg9, " > ") or "None"
                            if flag5 then textBox3.PlaceholderText = str2 .. ": " .. str3 else textBox3.Text = str2 .. ": " .. str3 end
                            return
                        end
                        if flag6 then textBox3.Text = str2 .. ": " .. tostring(arg9 or "")
                        elseif flag5 then textBox3.PlaceholderText = str2 .. ": " .. tostring(arg9 or "")
                        else textBox3.Text = str2 .. ": " .. tostring(arg9 or "") end
                    end,
                    SetValue = function(value)
                        if flag9 and typeof(value) == "table" then
                            tbl9 = table.clone(value)
                            local str3 = #tbl9 > 0 and table.concat(tbl9, " > ") or "None"
                            if flag5 then textBox3.PlaceholderText = str2 .. ": " .. str3 else textBox3.Text = str2 .. ": " .. str3 end
                            fn11()
                            return
                        end
                        if typeof(value) == "string" then
                            if table.find(tbl12, value) or tbl12[value] ~= nil then stringValue.Value = value
                            else warn("[Dropdown:SetValue] Value not found:", value); return end
                            if flag5 then textBox3.PlaceholderText = str2 .. ": " .. value else textBox3.Text = str2 .. ": " .. value end
                            fn11()
                            if fn7 then fn7(value) end
                        end
                    end,
                    SetSubValue = function(arg8, arg9, arg10)
                        if not tbl8 then return end
                        local v9 = tbl8[arg9]; if not v9 then return end
                        local num = tonumber(arg10); if not num then return end
                        local n11, n12 = v9.Min or 0, v9.Max or 100
                        local default2 = math.clamp(num, math.min(n11, n12), math.max(n11, n12))
                        tbl7[arg9] = default2
                        if type(tbl12[arg9]) == "table" then tbl12[arg9].Default = default2 end
                        v9.Bar.Size = UDim2.new((default2 - n11) / math.max(0.0001, (n12 - n11)), 0, 1, 0)
                        v9.TextBox.Text = tostring(default2)
                        if fn7 then fn7({Type = "SliderDropdown", KeyName = arg9, Value = default2, State = table.clone(tbl7)}) end
                    end,
                    GetNewList = function(arg8, arg9)
                        stringValue.Value = ""; flag10 = false
                        local dur = math.max(0.16, GlassState.AnimationSpeed)
                        TweenService:Create(frame26, TweenInfo.new(dur), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                        TweenService:Create(frame23, TweenInfo.new(dur), {Size = UDim2.new(1, 0, 0, 32)}):Play()
                        TweenService:Create(imageLabel9, TweenInfo.new(dur), {Rotation = 0}):Play()
                        tbl12 = arg9 or {}
                        fn11()
                        if flag5 then textBox3.PlaceholderText = str2 .. ": " else textBox3.Text = str2 .. ": " end
                    end,
                }
                arg6.FunctionCreate = functionCreate; arg6.Page_Name = text2; arg6.Section_Name = text4
                tbl3:RegisterOption(arg6, fn7)
                return functionCreate
            end

            secObj.CreateBind = function(arg6, arg7, arg8)
                if arg6 == secObj then arg6, arg7 = arg7, arg8 end
                arg6 = arg6 or {}
                local text5 = tostring(arg6.Title or "")
                local default = arg6.Default or arg6.Key
                local fn7 = arg7 or function() end

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = text5 .. "bguvl"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 36)

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "Background1"
                frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                frame24.Size = UDim2.new(1, -12, 1, 0)
                frame24.BackgroundColor3 = GlassState.PanelColor
                frame24.BackgroundTransparency = GlassState.CardTransparency
                Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 8)
                CreateGlassStroke(frame24, 1, 0.12)

                local textLabel6 = Instance.new("TextLabel", frame24)
                textLabel6.Name = "TextColor"
                textLabel6.BackgroundTransparency = 1
                textLabel6.Position = UDim2.new(0, 12, 0, 0)
                textLabel6.Size = UDim2.new(1, -140, 1, 0)
                textLabel6.Font = Enum.Font.GothamSemibold
                textLabel6.Text = text5
                textLabel6.TextSize = 13
                SetTruncate(textLabel6)
                textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                textLabel6.TextColor3 = GlassState.TextColor

                local frame25 = Instance.new("Frame", frame24)
                frame25.Name = "Background2"
                frame25.AnchorPoint = Vector2.new(1, 0.5)
                frame25.Position = UDim2.new(1, -8, 0.5, 0)
                frame25.Size = UDim2.new(0, 112, 0, 24)
                frame25.BackgroundColor3 = GlassState.CardColor
                frame25.BackgroundTransparency = 0.25
                Instance.new("UICorner", frame25).CornerRadius = UDim.new(0, 6)
                CreateGlassStroke(frame25, 1, 0.10)

                local textButton4 = Instance.new("TextButton", frame25)
                textButton4.Name = "Bindkey"
                textButton4.BackgroundTransparency = 1
                textButton4.Size = UDim2.new(1, 0, 1, 0)
                textButton4.Font = Enum.Font.GothamBold
                textButton4.Text = tostring(default):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", "")
                textButton4.TextSize = 12
                textButton4.TextColor3 = GlassState.AccentColor
                AttachClickJuice(textButton4, frame25, {HoverScale = 1.05, PressScale = 0.93})

                local tbl7 = {
                    [Enum.UserInputType.MouseButton1] = "Mouse1",
                    [Enum.UserInputType.MouseButton2] = "Mouse2",
                    [Enum.UserInputType.MouseButton3] = "Mouse3",
                }

                local isBinding = false
                textButton4.MouseButton1Click:Connect(function()
                    isBinding = true
                    textButton4.Text = "Press key..."
                    local connection
                    connection = UserInputService.InputBegan:Connect(function(input)
                        if tbl7[input.UserInputType] then
                            textButton4.Text = tbl7[input.UserInputType]
                            default = input.UserInputType
                        elseif input.KeyCode ~= Enum.KeyCode.Unknown then
                            textButton4.Text = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                            default = input.KeyCode
                        end
                        connection:Disconnect()
                        task.delay(0.1, function() isBinding = false end)
                    end)
                end)

                local bindConn
                bindConn = UserInputService.InputBegan:Connect(function(input)
                    if not frame23.Parent then bindConn:Disconnect(); return end
                    if isBinding or UserInputService:GetFocusedTextBox() then return end
                    if default == input.UserInputType or default == input.KeyCode then
                        fn7(default)
                    end
                end)

                RegisterThemeListener(function()
                    if not frame24.Parent then return false end
                    frame24.BackgroundColor3 = GlassState.PanelColor
                    frame24.BackgroundTransparency = GlassState.CardTransparency
                    textLabel6.TextColor3 = GlassState.TextColor
                    frame25.BackgroundColor3 = GlassState.CardColor
                    textButton4.TextColor3 = GlassState.AccentColor
                end)
            end

            secObj.CreateBox = function(arg6, arg7, arg8)
                if arg6 == secObj then arg6, arg7 = arg7, arg8 end
                arg6 = arg6 or {}
                local text5 = tostring(arg6.Title or "")
                local placeholderText = tostring(arg6.Placeholder or "")
                local text6 = arg6.Default or false
                local flag5 = arg6.Number or false
                local fn7 = arg7 or function() end

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = "BoxFrame"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 62)

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "Background1"
                frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                frame24.Size = UDim2.new(1, -12, 1, 0)
                frame24.BackgroundColor3 = GlassState.PanelColor
                frame24.BackgroundTransparency = GlassState.CardTransparency
                Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 8)
                CreateGlassStroke(frame24, 1, 0.12)

                local textLabel6 = Instance.new("TextLabel", frame24)
                textLabel6.Name = "TextColor"
                textLabel6.BackgroundTransparency = 1
                textLabel6.Position = UDim2.new(0, 12, 0, 4)
                textLabel6.Size = UDim2.new(1, -24, 0, 22)
                textLabel6.Font = Enum.Font.GothamSemibold
                textLabel6.Text = text5
                textLabel6.TextSize = 13
                SetTruncate(textLabel6)
                textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                textLabel6.TextColor3 = GlassState.TextColor

                local frame25 = Instance.new("Frame", frame24)
                frame25.Name = "Background2"
                frame25.AnchorPoint = Vector2.new(0.5, 1)
                frame25.ClipsDescendants = true
                frame25.Position = UDim2.new(0.5, 0, 1, -7)
                frame25.Size = UDim2.new(1, -18, 0, 26)
                frame25.BackgroundColor3 = GlassState.CardColor
                frame25.BackgroundTransparency = 0.35
                Instance.new("UICorner", frame25).CornerRadius = UDim.new(0, 6)
                CreateGlassStroke(frame25, 1, 0.14)

                local textBox3 = Instance.new("TextBox", frame25)
                textBox3.Name = "TextColorPlaceholder"
                textBox3.BackgroundTransparency = 1
                textBox3.Position = UDim2.new(0, 8, 0, 0)
                textBox3.Size = UDim2.new(1, -16, 1, 0)
                textBox3.Font = Enum.Font.GothamSemibold
                textBox3.PlaceholderText = placeholderText
                textBox3.Text = ""
                textBox3.TextSize = 12.5
                textBox3.TextXAlignment = Enum.TextXAlignment.Left
                textBox3.PlaceholderColor3 = GetUIColor("Placeholder Text Color", Color3.fromRGB(168, 178, 194))
                textBox3.TextColor3 = GlassState.TextColor

                local frame26 = Instance.new("Frame", frame25)
                frame26.Name = "TextNSBoxLineeeee"
                frame26.AnchorPoint = Vector2.new(0.5, 1)
                frame26.Position = UDim2.new(0.5, 0, 1, 0)
                frame26.Size = UDim2.new(0, 0, 0, 2)
                frame26.BorderSizePixel = 0
                frame26.BackgroundColor3 = GlassState.AccentColor
                frame26.BackgroundTransparency = 1
                Instance.new("UICorner", frame26).CornerRadius = UDim.new(1, 0)

                textBox3.Focused:Connect(function()
                    TweenService:Create(frame26, TweenInfo.new(math.max(0.14, GlassState.AnimationSpeed), Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0, Size = UDim2.new(1, 0, 0, 2)
                    }):Play()
                end)

                if flag5 then
                    textBox3:GetPropertyChangedSignal("Text"):Connect(function()
                        if not tonumber(textBox3.Text) then
                            textBox3.PlaceholderText = placeholderText
                            textBox3.Text = ""
                        end
                    end)
                end

                textBox3.FocusLost:Connect(function()
                    TweenService:Create(frame26, TweenInfo.new(math.max(0.14, GlassState.AnimationSpeed)), {
                        BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 2)
                    }):Play()
                    if textBox3.Text ~= "" then fn7(textBox3.Text) end
                end)

                RegisterThemeListener(function()
                    if not frame24.Parent then return false end
                    frame24.BackgroundColor3 = GlassState.PanelColor
                    frame24.BackgroundTransparency = GlassState.CardTransparency
                    textLabel6.TextColor3 = GlassState.TextColor
                    frame25.BackgroundColor3 = GlassState.CardColor
                    textBox3.TextColor3 = GlassState.TextColor
                    frame26.BackgroundColor3 = GlassState.AccentColor
                end)

                local tbl7 = {}
                if text6 then textBox3.Text = text6; fn7(text6) end
                tbl7.SetValue = function(text7) textBox3.Text = text7; fn7(text7) end

                tbl3:RegisterOption({
                    Title = arg6.Title, Default = text6, Box = true,
                    Page_Name = text2, Section_Name = text4, FunctionCreate = tbl7,
                }, fn7)
                return tbl7
            end

            secObj.CreateSlider = function(arg6, arg7, arg8)
                if arg6 == secObj then arg6, arg7 = arg7, arg8 end
                arg6 = arg6 or {}
                local text5 = tostring(arg6.Title or "")
                local n11 = tonumber(arg6.Min) or 0
                local n12 = tonumber(arg6.Max) or 100
                local flag5 = arg6.Precise or false
                local n13 = tonumber(arg6.Default) or 0
                local fn8 = arg7 or function() end

                local frame23 = Instance.new("Frame", frame20)
                frame23.Name = text5 .. "buda"
                frame23.BackgroundTransparency = 1
                frame23.Size = UDim2.new(1, 0, 0, 52)

                local frame24 = Instance.new("Frame", frame23)
                frame24.Name = "Background1"
                frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                frame24.Size = UDim2.new(1, -12, 1, 0)
                frame24.BackgroundColor3 = GlassState.PanelColor
                frame24.BackgroundTransparency = GlassState.CardTransparency
                Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 8)
                CreateGlassStroke(frame24, 1, 0.12)

                local textLabel6 = Instance.new("TextLabel", frame24)
                textLabel6.Name = "TextColor"
                textLabel6.BackgroundTransparency = 1
                textLabel6.Position = UDim2.new(0, 12, 0, 4)
                textLabel6.Size = UDim2.new(1, -120, 0, 22)
                textLabel6.Font = Enum.Font.GothamSemibold
                textLabel6.Text = text5
                textLabel6.TextSize = 13
                textLabel6.RichText = true
                SetTruncate(textLabel6)
                textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                textLabel6.TextColor3 = GlassState.TextColor

                local frame27 = Instance.new("Frame", frame24)
                frame27.Name = "Background2"
                frame27.AnchorPoint = Vector2.new(1, 0)
                frame27.Position = UDim2.new(1, -10, 0, 5)
                frame27.Size = UDim2.new(0, 84, 0, 20)
                frame27.BackgroundColor3 = GlassState.CardColor
                frame27.BackgroundTransparency = 0.30
                Instance.new("UICorner", frame27).CornerRadius = UDim.new(0, 5)
                CreateGlassStroke(frame27, 1, 0.14)

                local textBox3 = Instance.new("TextBox", frame27)
                textBox3.Name = "TextColor"
                textBox3.BackgroundTransparency = 1
                textBox3.Size = UDim2.new(1, 0, 1, 0)
                textBox3.Font = Enum.Font.GothamBold
                textBox3.Text = ""
                textBox3.TextSize = 12
                textBox3.TextColor3 = GlassState.AccentColor

                local frame25 = Instance.new("Frame", frame24)
                frame25.Name = "SliderBar"
                frame25.AnchorPoint = Vector2.new(0.5, 0.5)
                frame25.Position = UDim2.new(0.5, 0, 0.5, 13)
                frame25.Size = UDim2.new(1, -24, 0, 6)
                frame25.BackgroundColor3 = Color3.new(1, 1, 1)
                frame25.BackgroundTransparency = 0.84
                Instance.new("UICorner", frame25).CornerRadius = UDim.new(1, 0)

                local frame26 = Instance.new("Frame", frame25)
                frame26.Name = "Bar"
                frame26.BorderSizePixel = 0
                frame26.Size = UDim2.new(0, 0, 1, 0)
                frame26.BackgroundColor3 = GlassState.AccentColor
                Instance.new("UICorner", frame26).CornerRadius = UDim.new(1, 0)

                local knob = Instance.new("Frame", frame26)
                knob.Name = "Knob"
                knob.AnchorPoint = Vector2.new(0.5, 0.5)
                knob.Position = UDim2.new(1, 0, 0.5, 0)
                knob.Size = UDim2.new(0, 13, 0, 13)
                knob.BackgroundColor3 = Color3.new(1, 1, 1)
                Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

                local knobGlow = Instance.new("UIStroke", knob)
                knobGlow.Thickness = 2
                knobGlow.Color = GlassState.AccentColor
                knobGlow.Transparency = 0.35

                local textButton4 = Instance.new("TextButton", frame25)
                textButton4.Name = "SliderButton "
                textButton4.BackgroundTransparency = 1
                textButton4.Position = UDim2.new(0, -6, 0, -8)
                textButton4.Size = UDim2.new(1, 12, 1, 16)
                textButton4.Text = ""

                textButton4.MouseEnter:Connect(function()
                    TweenService:Create(knob, TweenInfo.new(0.16, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 16, 0, 16)}):Play()
                    TweenService:Create(knobGlow, TweenInfo.new(0.16), {Transparency = 0.1}):Play()
                end)
                textButton4.MouseLeave:Connect(function()
                    TweenService:Create(knob, TweenInfo.new(0.16), {Size = UDim2.new(0, 13, 0, 13)}):Play()
                    TweenService:Create(knobGlow, TweenInfo.new(0.16), {Transparency = 0.35}):Play()
                end)

                local function fn9(text6)
                    textBox3.Text = tostring(text6)
                    fn8(tonumber(text6))
                end

                if n13 then
                    n13 = math.clamp(n13, math.min(n11, n12), math.max(n11, n12))
                    frame26.Size = UDim2.new((n13 - n11) / math.max(0.0001, (n12 - n11)), 0, 1, 0)
                    fn9(n13)
                end

                local flag6 = false
                local function updateSliderDrag(posX)
                    local ratio = math.clamp((posX - frame25.AbsolutePosition.X) / math.max(1, frame25.AbsoluteSize.X), 0, 1)
                    local raw = n11 + (n12 - n11) * ratio
                    local n15 = flag5 and tonumber(string.format("%.1f", raw)) or math.floor(raw + 0.5)
                    frame26.Size = UDim2.new(ratio, 0, 1, 0)
                    pcall(function() fn9(n15) end)
                end

                textButton4.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        flag6 = true; updateSliderDrag(input.Position.X)
                    end
                end)
                local sl1, sl2
                sl1 = UserInputService.InputChanged:Connect(function(input)
                    if not frame23.Parent then sl1:Disconnect(); sl2:Disconnect(); return end
                    if flag6 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        updateSliderDrag(input.Position.X)
                    end
                end)
                sl2 = UserInputService.InputEnded:Connect(function(input)
                    if not frame23.Parent then sl1:Disconnect(); sl2:Disconnect(); return end
                    if flag6 and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                        flag6 = false
                    end
                end)

                local function fn10(arg8)
                    local numVal = tonumber(arg8)
                    if not numVal then return end
                    local clamped = math.clamp(numVal, math.min(n11, n12), math.max(n11, n12))
                    local ratio = (clamped - n11) / math.max(0.0001, (n12 - n11))
                    TweenService:Create(frame26, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(ratio, 0, 1, 0)}):Play()
                    fn9(clamped)
                end

                textBox3.FocusLost:Connect(function() fn10(textBox3.Text) end)

                RegisterThemeListener(function()
                    if not frame24.Parent then return false end
                    frame24.BackgroundColor3 = GlassState.PanelColor
                    frame24.BackgroundTransparency = GlassState.CardTransparency
                    textLabel6.TextColor3 = GlassState.TextColor
                    frame27.BackgroundColor3 = GlassState.CardColor
                    textBox3.TextColor3 = GlassState.AccentColor
                    frame26.BackgroundColor3 = GlassState.AccentColor
                    knobGlow.Color = GlassState.AccentColor
                end)

                local tbl7 = {
                    SetValue = function(arg8) fn10(arg8) end,
                    GetText = function() return textLabel6 end,
                }
                tbl3:RegisterOption({
                    Title = arg6.Title, Default = n13, Slider = true,
                    Min = n11, Max = n12, Precise = flag5,
                    Page_Name = text2, Section_Name = text4, FunctionCreate = tbl7,
                }, fn8)
                return tbl7
            end

            return secObj
        end

        return pageObj
    end

    return mainObj
end

tbl3.CreateNoti({
    Title = "UI Library",
    Desc = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
    ShowTime = 10,
}, true)

return tbl3

--3
