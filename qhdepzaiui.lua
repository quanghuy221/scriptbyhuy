local function __store_list(t, start, ...)
    for i = 1, select("#", ...) do
        t[start + i - 1] = (select(i, ...))
    end
end

if getgenv().Nousigi and game.CoreGui:FindFirstChild("Nousigi Hub GUI") then
    for i, child in ipairs(game.CoreGui:GetChildren()) do
        if string.find(child.Name, "Nousigi Hub") then
            child:Destroy()
        end
    end
end

getgenv().Nousigi = true

local tbl = {
    ["Border Color"] = Color3.fromRGB(255, 85, 85),
    ["Click Effect Color"] = Color3.fromRGB(240, 240, 240),
    ["Setting Icon Color"] = Color3.fromRGB(255, 110, 110),
    ["Logo Image"] = "rbxassetid://5009915795",
    ["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
    ["Search Icon Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["GUI Text Color"] = Color3.fromRGB(235, 235, 235),
    ["Text Color"] = Color3.fromRGB(235, 235, 235),
    ["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
    ["Title Text Color"] = Color3.fromRGB(255, 85, 85),
    ["Background Main Color"] = Color3.fromRGB(30, 30, 30),
    ["Background 1 Color"] = Color3.fromRGB(40, 40, 40),
    ["Background 1 Transparency"] = 1,
    ["Background 2 Color"] = Color3.fromRGB(50, 50, 50),
    ["Background 3 Color"] = Color3.fromRGB(60, 60, 60),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(255, 85, 85),
    ["Section Text Color"] = Color3.fromRGB(255, 85, 85),
    ["Section Underline Color"] = Color3.fromRGB(255, 85, 85),
    ["Toggle Border Color"] = Color3.fromRGB(255, 85, 85),
    ["Toggle Checked Color"] = Color3.fromRGB(235, 235, 235),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
    ["Button Color"] = Color3.fromRGB(255, 85, 85),
    ["Label Color"] = Color3.fromRGB(255, 100, 100),
    ["Dropdown Icon Color"] = Color3.fromRGB(235, 235, 235),
    ["Dropdown Selected Color"] = Color3.fromRGB(255, 85, 85),
    ["Dropdown Selected Check Color"] = Color3.fromRGB(230, 100, 100),
    ["Textbox Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Box Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Slider Line Color"] = Color3.fromRGB(70, 70, 70),
    ["Slider Highlight Color"] = Color3.fromRGB(255, 64, 64),
    ["Tween Animation 1 Speed"] = 0,
    ["Tween Animation 2 Speed"] = 0,
    ["Tween Animation 3 Speed"] = 0,
    ["Text Stroke Transparency"] = 0.5,
}

local tbl2 = {
    ["Page Selected Color"] = Color3.fromRGB(255, 214, 94),
    ["Section Underline Color"] = Color3.fromRGB(255, 200, 72),
    ["Toggle Border Color"] = Color3.fromRGB(255, 214, 94),
    ["Toggle Checked Color"] = Color3.fromRGB(250, 190, 50),
    ["Button Color"] = Color3.fromRGB(255, 214, 94),
    ["Dropdown Selected Color"] = Color3.fromRGB(255, 214, 94),
    ["Dropdown Selected Check Color"] = Color3.fromRGB(250, 190, 50),
    ["Textbox Highlight Color"] = Color3.fromRGB(255, 214, 94),
    ["Box Highlight Color"] = Color3.fromRGB(255, 214, 94),
    ["Slider Highlight Color"] = Color3.fromRGB(255, 214, 94),
    ["Background Main Color"] = Color3.fromRGB(18, 18, 22),
    ["Background 1 Color"] = Color3.fromRGB(28, 28, 34),
    ["Background 1 Transparency"] = 0.25,
    ["Background 2 Color"] = Color3.fromRGB(38, 38, 46),
    ["Background 3 Color"] = Color3.fromRGB(48, 48, 56),
    ["Background Image"] = "",
    ["GUI Text Color"] = Color3.fromRGB(235, 235, 230),
    ["Text Color"] = Color3.fromRGB(235, 235, 230),
    ["Title Text Color"] = Color3.fromRGB(255, 214, 94),
    ["Section Text Color"] = Color3.fromRGB(220, 220, 210),
    ["Placeholder Text Color"] = Color3.fromRGB(170, 170, 160),
    ["Toggle Desc Color"] = Color3.fromRGB(190, 190, 180),
    ["Label Color"] = Color3.fromRGB(240, 240, 230),
    ["Border Color"] = Color3.fromRGB(90, 90, 70),
    ["Text Stroke Transparency"] = 0.85,
    ["Setting Icon Color"] = Color3.fromRGB(220, 220, 210),
    ["Dropdown Icon Color"] = Color3.fromRGB(220, 220, 210),
    ["Search Icon Color"] = Color3.fromRGB(240, 240, 230),
    ["Search Icon Highlight Color"] = Color3.fromRGB(255, 214, 94),
    ["Logo Image"] = "rbxassetid://5009915795",
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 220),
    ["Slider Line Color"] = Color3.fromRGB(80, 80, 60),
    ["Tween Animation 1 Speed"] = 0,
    ["Tween Animation 2 Speed"] = 0,
    ["Tween Animation 3 Speed"] = 0,
}

local genv = getgenv()
local t1 = getgenv().T1
local v = t1 and tbl or tbl2
genv.UIColor = v
getgenv().UIToggled = false
local tbl3 = {}
local options = tbl3.Options
local options2 = options or {}
tbl3.Options = options2
local titleMap = tbl3._TitleMap
local titleMap2 = titleMap or {}
tbl3._TitleMap = titleMap2

tbl3.RegisterOption = function(arg, arg2, arg3)
    local title = arg2.Title
    if not title then return end
    local tbl4 = {title = title, callback = arg3}
    tbl4.Page_Name = arg2.Page_Name or ""
    tbl4.Section_Name = arg2.Section_Name or ""
    tbl4.search = arg2.Search or false
    tbl4.priority = arg2.Priority or false
    tbl4.selected = arg2.Selected or false
    tbl4.box = arg2.Box or false
    tbl4.slider = arg2.Slider or false
    tbl4.button = arg2.Button or false
    tbl4.textlabel = arg2.TextLabel or false
    tbl4.min = arg2.Min
    tbl4.max = arg2.Max
    tbl4.step = arg2.Step
    tbl4.list = arg2.List
    tbl4.value = arg2.Default
    tbl4.FunctionCreate = arg2.FunctionCreate

    if arg2.Box then tbl4.type = "box"
    elseif arg2.Button then tbl4.type = "button"
    elseif arg2.TextLabel then tbl4.type = "textlabel"
    elseif arg2.Slider and arg2.Min and arg2.Max then tbl4.type = "slider"
    elseif typeof(arg2.Default) == "boolean" then tbl4.type = "toggle"
    elseif arg2.Slider and type(arg2.List) == "table" then tbl4.type = "slider_dropdown"
    elseif arg2.Priority then tbl4.type = "priority_dropdown"
    elseif arg2.Selected then tbl4.type = "multi_toggle"
    else tbl4.type = "dropdown" end

    tbl3.Options[title] = tbl4
    tbl3._TitleMap[title] = arg2
    return tbl4
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function fn(arg, arg2)
    local flag = nil
    local v2 = nil
    local position = nil
    local position2 = nil

    arg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            flag = true
            position = input.Position
            position2 = arg2.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    flag = false
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
        if input == v2 and flag then
            local n = input.Position - position
            if not djtmemay and cac then
                TweenService:Create(arg2, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y),
                }):Play()
            elseif not djtmemay and not cac then
                arg2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
            end
        end
    end)
end

local tbl4 = {Gui = Instance.new("ScreenGui")}
tbl4.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.Gui.Name = "Nousigi Hub GUI"
tbl4.Gui.Enabled = false
getgenv().ReadyForGuiLoaded = false

spawn(function()
    repeat task.wait() until getgenv().ReadyForGuiLoaded
    if getgenv().UIToggled then tbl4.Gui.Enabled = true end
end)

tbl4.NotiGui = Instance.new("ScreenGui")
tbl4.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.NotiGui.Name = "Nousigi Hub Notification"
tbl4.HideGui = Instance.new("ScreenGui")
tbl4.HideGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.HideGui.Name = "Nousigi Hub Btn"
local textButton = Instance.new("TextButton", tbl4.HideGui)
textButton.BackgroundTransparency = 1
textButton.Text = ""
textButton.AnchorPoint = Vector2.new(0, 1)
textButton.Size = UDim2.new(0, 50, 0, 50)
textButton.Position = UDim2.new(0, 15, 1, -15)
local frame = Instance.new("Frame", textButton)
frame.AnchorPoint = Vector2.new(0, 1)
frame.Size = UDim2.new(0, 50, 0, 50)
frame.Position = UDim2.new(0, 0, 1, 0)
frame.Name = "dut dit"
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BackgroundTransparency = getgenv().UIToggled and 0 or 0.25
local imageLabel = Instance.new("ImageLabel", textButton)
imageLabel.AnchorPoint = Vector2.new(0, 0)
imageLabel.Image = getgenv().UIColor["Logo Image"]
imageLabel.BackgroundTransparency = 1
imageLabel.Size = UDim2.new(0, 30, 0, 30)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
local uiCorner = Instance.new("UICorner")
uiCorner.Parent = frame
uiCorner.CornerRadius = UDim.new(1, 0)

tbl3.ToggleUI = function()
    getgenv().UIToggled = not getgenv().UIToggled
    TweenService:Create(imageLabel, TweenInfo.new(0), {Size = UDim2.new(0, 30, 0, 30)}):Play()
    TweenService:Create(frame, TweenInfo.new(0), {BackgroundTransparency = getgenv().UIToggled and 0 or 0.25}):Play()
    if game.CoreGui:FindFirstChild("Nousigi Hub GUI") then
        for i, child in ipairs(game.CoreGui:GetChildren()) do
            if child.Name == "Nousigi Hub GUI" then
                child.Enabled = getgenv().UIToggled
            end
        end
    end
end

tbl3.DestroyUI = function()
    if game.CoreGui:FindFirstChild("Nousigi Hub GUI") then
        for i, child in ipairs(game.CoreGui:GetChildren()) do
            if string.find(child.Name, "Nousigi Hub") then child:Destroy() end
        end
    end
end

local flag = false
local v2 = nil
local position = nil
local position2 = nil
local n3 = 0

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
            if input.UserInputState == Enum.UserInputState.End then
                flag = false
                n3 = 0
            end
        end)
    end
end)

textButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flag = false
        n3 = 0
    end
end)

textButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        v2 = input
    end
end)

RunService.RenderStepped:Connect(function()
    if n3 > 0 and tick() - n3 >= 0.1 and not flag then flag = true end
    if flag and v2 then fn2(v2) end
end)

textButton.MouseButton1Click:Connect(function() tbl3.ToggleUI() end)

local frame2 = Instance.new("Frame")
local uiListLayout = Instance.new("UIListLayout")
frame2.Name = "NotiContainer"
frame2.Parent = tbl4.NotiGui
frame2.AnchorPoint = Vector2.new(1, 1)
frame2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
frame2.BackgroundTransparency = 1
frame2.Position = UDim2.new(1, -5, 1, -5)
frame2.Size = UDim2.new(0, 350, 1, -10)
uiListLayout.Name = "NotiList"
uiListLayout.Parent = frame2
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
uiListLayout.Padding = UDim.new(0, 5)
tbl4.Gui.Parent = game:GetService("CoreGui")
tbl4.NotiGui.Parent = game:GetService("CoreGui")
tbl4.HideGui.Parent = game:GetService("CoreGui")

tbl4.Getcolor = function(arg)
    return {math.floor(arg.r * 255), math.floor(arg.g * 255), math.floor(arg.b * 255)}
end

local function fn3(arg)
    local titleNameNoti = arg.Title or ""
    getgenv().TitleNameNoti = titleNameNoti
    local desc = arg.Desc
    local showTime = arg.ShowTime or 10
    local frame3 = Instance.new("Frame")
    local frame4 = Instance.new("Frame")
    local uiCorner2 = Instance.new("UICorner")
    local frame5 = Instance.new("Frame")
    local imageLabel2 = Instance.new("ImageLabel")
    local uiCorner3 = Instance.new("UICorner")
    local textLabel = Instance.new("TextLabel")
    local frame6 = Instance.new("Frame")
    local imageLabel3 = Instance.new("ImageLabel")
    local textButton2 = Instance.new("TextButton")
    local textLabel2 = Instance.new("TextLabel")
    frame3.Name = "NotiFrame"
    frame3.Parent = frame2
    frame3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame3.BackgroundTransparency = 1
    frame3.ClipsDescendants = true
    frame3.Position = UDim2.new(0, 0, 0, 0)
    frame3.Size = UDim2.new(1, 0, 0, 0)
    frame3.AutomaticSize = Enum.AutomaticSize.Y
    frame4.Name = "Noticontainer"
    frame4.Parent = frame3
    frame4.Position = UDim2.new(1, 0, 0, 0)
    frame4.Size = UDim2.new(1, 0, 1, 6)
    frame4.AutomaticSize = Enum.AutomaticSize.Y
    frame4.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
    uiCorner2.CornerRadius = UDim.new(0, 4)
    uiCorner2.Parent = frame4
    frame5.Name = "Topnoti"
    frame5.Parent = frame4
    frame5.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame5.BackgroundTransparency = 1
    frame5.Position = UDim2.new(0, 0, 0, 5)
    frame5.Size = UDim2.new(1, 0, 0, 25)
    imageLabel2.Name = "Ruafimg"
    imageLabel2.Parent = frame5
    imageLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    imageLabel2.BackgroundTransparency = 1
    imageLabel2.Position = UDim2.new(0, 5, 0, 0)
    imageLabel2.Size = UDim2.new(0, 25, 0, 25)
    imageLabel2.Image = getgenv().UIColor["Logo Image"]
    uiCorner3.CornerRadius = UDim.new(1, 0)
    uiCorner3.Name = "RuafimgCorner"
    uiCorner3.Parent = imageLabel2
    textLabel.Text = "<font color=\"rgb(" .. (tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[1]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[2]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[3])) .. ")\">QHuy Hub</font> " .. getgenv().TitleNameNoti
    textLabel.Name = "TextLabelNoti"
    textLabel.Parent = frame5
    textLabel.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 35, 0, 0)
    textLabel.Size = UDim2.new(1, -35, 1, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.RichText = true
    textLabel.TextColor3 = getgenv().UIColor["GUI Text Color"]
    frame6.Name = "CloseContainer"
    frame6.Parent = frame5
    frame6.AnchorPoint = Vector2.new(1, 0.5)
    frame6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame6.BackgroundTransparency = 1
    frame6.Position = UDim2.new(1, -4, 0.5, 0)
    frame6.Size = UDim2.new(0, 22, 0, 22)
    imageLabel3.Name = "CloseImage"
    imageLabel3.Parent = frame6
    imageLabel3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    imageLabel3.BackgroundTransparency = 1
    imageLabel3.Size = UDim2.new(1, 0, 1, 0)
    imageLabel3.Image = "rbxassetid://3926305904"
    imageLabel3.ImageRectOffset = Vector2.new(284, 4)
    imageLabel3.ImageRectSize = Vector2.new(24, 24)
    imageLabel3.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    textButton2.Parent = frame6
    textButton2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textButton2.BackgroundTransparency = 1
    textButton2.Size = UDim2.new(1, 0, 1, 0)
    textButton2.Font = Enum.Font.SourceSans
    textButton2.Text = ""

    if desc then
        textLabel2.Name = "TextColor"
        textLabel2.Parent = frame4
        textLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        textLabel2.BackgroundTransparency = 1
        textLabel2.Position = UDim2.new(0, 10, 0, 35)
        textLabel2.Size = UDim2.new(1, -15, 0, 0)
        textLabel2.Font = Enum.Font.GothamBold
        textLabel2.Text = desc
        textLabel2.TextSize = 14
        textLabel2.TextXAlignment = Enum.TextXAlignment.Left
        textLabel2.RichText = true
        textLabel2.TextColor3 = getgenv().UIColor["Text Color"]
        textLabel2.AutomaticSize = Enum.AutomaticSize.Y
        textLabel2.TextWrapped = true
    end

    local function closeNoti()
        TweenService:Create(frame4, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Position = UDim2.new(1, 0, 0, 0)}):Play()
        wait(0.25)
        frame3:Destroy()
    end

    TweenService:Create(frame4, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Position = UDim2.new(0, 0, 0, 0)}):Play()
    textButton2.MouseButton1Click:Connect(function() wait(0.25) closeNoti() end)
    spawn(function() wait(showTime) closeNoti() end)
end

tbl3.CreateNoti = function(arg, arg2)
    if type(arg) == "table" and arg.CreateNoti then arg, arg2 = arg2, nil end
    if not getgenv().Config or arg2 then
        local ok, result = pcall(function() fn3(arg) end)
        if result then
            pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "QHuy Hub", Text = arg.Desc or "", Icon = "rbxassetid://16791647668", Duration = arg.ShowTime or 10
                })
            end)
        end
    end
end

tbl3.CreateMain = function(arg, arg2)
    if type(arg) == "table" and arg.CreateMain then arg, arg2 = arg2, nil end
    local text = tostring(arg.Title) or "QHuy Hub"
    getgenv().MainDesc = arg.Desc or ""
    cac = false
    
    local frame3 = Instance.new("Frame")
    local imageLabel2 = Instance.new("ImageLabel")
    local uiCorner2 = Instance.new("UICorner")
    local frame4 = Instance.new("Frame")
    local imageLabel3 = Instance.new("ImageLabel")
    local textLabel = Instance.new("TextLabel")
    local frame5 = Instance.new("Frame")
    local uiCorner3 = Instance.new("UICorner")
    local scrollingFrame = Instance.new("ScrollingFrame")
    local uiListLayout2 = Instance.new("UIListLayout")
    local textLabel2 = Instance.new("TextLabel")
    local frame6 = Instance.new("Frame")
    local uiPageLayout = Instance.new("UIPageLayout")
    local frame7 = Instance.new("Frame")
    local frame8 = Instance.new("Frame")
    
    frame3.Name = "Main"
    frame3.Parent = tbl4.Gui
    frame3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
    frame3.BackgroundTransparency = 1
    frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    frame3.Size = UDim2.new(0, 629, 0, 359)
    fn(frame3, frame3)
    
    imageLabel2.Name = "maingui"
    imageLabel2.Parent = frame3
    imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    imageLabel2.BackgroundTransparency = 1
    imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel2.Selectable = true
    imageLabel2.Size = UDim2.new(1, 30, 1, 30)
    imageLabel2.Image = "rbxassetid://8068653048"
    imageLabel2.ScaleType = Enum.ScaleType.Slice
    imageLabel2.SliceCenter = Rect.new(15, 15, 175, 175)
    imageLabel2.SliceScale = 1.3
    imageLabel2.ImageColor3 = getgenv().UIColor["Title Text Color"]
    imageLabel2.ImageTransparency = 1
    
    textLabel.Text = "<font color=\"rgb(" .. (tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[1]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[2]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[3])) .. ")\">QHuy Hub </font> " .. getgenv().MainDesc
    
    local imageLabel4 = Instance.new("ImageLabel")
    imageLabel4.Name = "MainContainer"
    imageLabel4.Parent = frame3
    imageLabel4.BackgroundColor3 = getgenv().UIColor["Background Main Color"]
    imageLabel4.Size = UDim2.new(1, 0, 1, 0)
    getgenv().ReadyForGuiLoaded = true
    
    local imageLabel5 = Instance.new("ImageLabel")
    imageLabel5.Name = "Shadow"
    imageLabel5.Parent = frame3
    imageLabel5.BackgroundTransparency = 1
    imageLabel5.Image = "rbxassetid://5028857084"
    imageLabel5.ImageTransparency = 0.35
    imageLabel5.ScaleType = Enum.ScaleType.Slice
    imageLabel5.SliceCenter = Rect.new(24, 24, 276, 276)
    imageLabel5.Size = UDim2.new(1, 40, 1, 40)
    imageLabel5.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel5.ZIndex = imageLabel4.ZIndex - 1
    
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Parent = imageLabel4
    uiStroke.Thickness = 1
    uiStroke.Transparency = 0.35
    uiStroke.Color = getgenv().UIColor["Border Color"]
    
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Parent = imageLabel4
    uiGradient.Rotation = 90
    uiGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))})
    uiGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.92), NumberSequenceKeypoint.new(1, 0.92)})
    
    uiCorner2.CornerRadius = UDim.new(0, 5)
    uiCorner2.Name = "MainCorner"
    uiCorner2.Parent = imageLabel4
    
    frame7.Name = "Concacontainer"
    frame7.Parent = imageLabel4
    frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame7.BackgroundTransparency = 1
    frame7.ClipsDescendants = true
    frame7.Position = UDim2.new(0, 0, 0, 30)
    frame7.Size = UDim2.new(1, 0, 1, -30)
    
    frame8.Name = "Concacmain"
    frame8.Parent = frame7
    frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame8.BackgroundTransparency = 1
    frame8.Selectable = true
    frame8.Size = UDim2.new(1, 0, 1, 0)
    
    frame4.Name = "TopMain"
    frame4.Parent = imageLabel4
    frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame4.BackgroundTransparency = 1
    frame4.Size = UDim2.new(1, 0, 0, 25)
    
    local frame9 = Instance.new("Frame")
    frame9.Name = "TopStroke"
    frame9.Parent = frame4
    frame9.BackgroundColor3 = getgenv().UIColor["Border Color"]
    frame9.BackgroundTransparency = 0.6
    frame9.BorderSizePixel = 0
    frame9.Position = UDim2.new(0, 0, 1, -1)
    frame9.Size = UDim2.new(1, 0, 0, 1)
    
    local uiStroke2 = Instance.new("UIStroke")
    uiStroke2.Parent = textLabel
    uiStroke2.Thickness = 1
    uiStroke2.Transparency = 0.85
    uiStroke2.Color = Color3.new(0, 0, 0)
    
    imageLabel3.Name = "Ruafimg"
    imageLabel3.Parent = frame4
    imageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imageLabel3.BackgroundTransparency = 1
    imageLabel3.Position = UDim2.new(0, 5, 0, 0)
    imageLabel3.Size = UDim2.new(0, 25, 0, 25)
    imageLabel3.Image = getgenv().UIColor["Logo Image"]
    
    textLabel.Name = "TextLabelMain"
    textLabel.Parent = frame4
    textLabel.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 35, 0, 0)
    textLabel.Size = UDim2.new(1, -35, 1, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.RichText = true
    textLabel.TextSize = 16
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextColor3 = getgenv().UIColor["GUI Text Color"]
    textLabel.Text = "<font color=\"rgb(" .. (tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[1]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[2]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[3])) .. ")\">QHuy Hub </font> " .. getgenv().MainDesc
    
    frame5.Name = "Background1"
    frame5.Parent = frame8
    frame5.Position = UDim2.new(0, 5, 0, 0)
    frame5.Size = UDim2.new(0, 180, 0, 325)
    frame5.BackgroundTransparency = 0.1
    frame5.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
    
    local uiStroke3 = Instance.new("UIStroke")
    uiStroke3.Parent = frame5
    uiStroke3.Thickness = 1
    uiStroke3.Transparency = 0.5
    uiStroke3.Color = getgenv().UIColor["Border Color"]
    
    local uiGradient2 = Instance.new("UIGradient")
    uiGradient2.Parent = frame5
    uiGradient2.Rotation = 90
    uiGradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, getgenv().UIColor["Background 1 Color"]), ColorSequenceKeypoint.new(1, getgenv().UIColor["Background 2 Color"])})
    uiGradient2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.06), NumberSequenceKeypoint.new(1, 0.12)})
    
    local uiPadding = Instance.new("UIPadding")
    uiPadding.Parent = frame5
    uiPadding.PaddingLeft = UDim.new(0, 4)
    uiPadding.PaddingRight = UDim.new(0, 4)
    uiPadding.PaddingTop = UDim.new(0, 4)
    uiPadding.PaddingBottom = UDim.new(0, 4)
    
    uiCorner3.CornerRadius = UDim.new(0, 4)
    uiCorner3.Parent = frame5
    
    scrollingFrame.Name = "ControlList"
    scrollingFrame.Parent = frame5
    scrollingFrame.Active = true
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
    scrollingFrame.Size = UDim2.new(1, -5, 1, -30)
    scrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    
    uiListLayout2.Parent = scrollingFrame
    uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout2.Padding = UDim.new(0, 5)
    
    textLabel2.Name = "GUITextColor"
    textLabel2.Parent = frame5
    textLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Position = UDim2.new(0, 5, 0, 0)
    textLabel2.Size = UDim2.new(1, 0, 0, 25)
    textLabel2.Font = Enum.Font.GothamBold
    textLabel2.Text = text
    textLabel2.TextSize = 14
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.TextColor3 = getgenv().UIColor["GUI Text Color"]
    
    frame6.Name = "MainPage"
    frame6.Parent = frame8
    frame6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame6.BackgroundTransparency = 1
    frame6.ClipsDescendants = true
    frame6.Position = UDim2.new(0, 190, 0, 0)
    frame6.Size = UDim2.new(0, 435, 0, 325)
    
    uiPageLayout.Name = "UIPage"
    uiPageLayout.Parent = frame6
    uiPageLayout.FillDirection = Enum.FillDirection.Vertical
    uiPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiPageLayout.EasingDirection = Enum.EasingDirection.InOut
    uiPageLayout.EasingStyle = Enum.EasingStyle.Quart
    uiPageLayout.Padding = UDim.new(0, 10)
    uiPageLayout.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]
    
    local frame10 = Instance.new("Frame")
    local uiCorner4 = Instance.new("UICorner")
    local frame11 = Instance.new("Frame")
    local imageLabel6 = Instance.new("ImageLabel")
    local textBox = Instance.new("TextBox")
    
    frame10.Name = "PageSearch"
    frame10.Parent = frame5
    frame10.AnchorPoint = Vector2.new(1, 0)
    frame10.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
    frame10.Position = UDim2.new(1, -5, 0, 5)
    frame10.Size = UDim2.new(0, 170, 0, 25)
    frame10.ClipsDescendants = true
    
    uiCorner4.CornerRadius = UDim.new(0, 4)
    uiCorner4.Parent = frame10
    
    frame11.Name = "SearchFrame"
    frame11.Parent = frame10
    frame11.BackgroundTransparency = 1
    frame11.Size = UDim2.new(0, 25, 1, 0)
    
    imageLabel6.Name = "SearchIcon"
    imageLabel6.Parent = frame11
    imageLabel6.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel6.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel6.Size = UDim2.new(0, 16, 0, 16)
    imageLabel6.BackgroundTransparency = 1
    imageLabel6.Image = "rbxassetid://8154282545"
    imageLabel6.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    
    textBox.Name = "SearchBox"
    textBox.Parent = frame10
    textBox.BackgroundTransparency = 1
    textBox.Position = UDim2.new(0, 30, 0, 0)
    textBox.Size = UDim2.new(1, -30, 1, 0)
    textBox.Font = Enum.Font.GothamBold
    textBox.Text = ""
    textBox.TextSize = 14
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.PlaceholderText = "Search section..."
    textBox.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
    textBox.TextColor3 = getgenv().UIColor["Text Color"]
    
    local v5 = nil
    local getLabels
    getLabels = function(arg2)
        local tbl6 = {}
        for _, v13 in pairs(arg2:GetChildren()) do
            if v13:IsA("TextLabel") then table.insert(tbl6, v13) end
            for _, v15 in pairs(getLabels(v13)) do table.insert(tbl6, v15) end
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
                                for _, v32 in pairs(getLabels(v30)) do
                                    if string.find(string.lower(v32.Text), v6) then flag4 = true break end
                                end
                                v30.Visible = v6 == "" or flag4
                                if v30.Visible then flag3 = true end
                            end
                        end
                        v22.Visible = v6 == "" or flag3
                        if v22.Visible then flag2 = true end
                    end
                end
                v14.Visible = v6 == "" or flag2
                if v14.Visible then table.insert(tbl6, v14) end
            end
        end
        for _, child in pairs(scrollingFrame:GetChildren()) do
            if child:IsA("Frame") then
                local v13 = frame6:FindFirstChild("Page" .. child.LayoutOrder + 1)
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
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout2.AbsoluteContentSize.Y + 5)
    end)

    local layoutOrder = -1
    local layoutOrder2 = -1
    local n9 = 1

    return {
        CreatePage = function(arg2, arg3)
            if type(arg2) == "table" and arg2.CreatePage then arg2, arg3 = arg3, nil end
            local text2 = tostring(arg2.Page_Name)
            local text3 = tostring(arg2.Page_Title)
            layoutOrder2 += 1; layoutOrder += 1
            
            local frame12 = Instance.new("Frame")
            local frame13 = Instance.new("Frame")
            local uiCorner5 = Instance.new("UICorner")
            local frame14 = Instance.new("Frame")
            local frame15 = Instance.new("Frame")
            local uiCorner6 = Instance.new("UICorner")
            local frame16 = Instance.new("Frame")
            local textLabel3 = Instance.new("TextLabel")
            local textButton2 = Instance.new("TextButton")
            
            frame12.Name = text2 .. "_Control"
            frame12.Parent = scrollingFrame
            frame12.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame12.BackgroundTransparency = 1
            frame12.Size = UDim2.new(1, -10, 0, 25)
            frame12.LayoutOrder = layoutOrder
            frame13.Parent = frame12
            frame13.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame13.BackgroundTransparency = 1
            frame13.Position = UDim2.new(0, 5, 0, 0)
            frame13.Size = UDim2.new(1, -5, 1, 0)
            uiCorner5.CornerRadius = UDim.new(0, 4)
            uiCorner5.Parent = frame13
            frame14.Name = "Line"
            frame14.Parent = frame13
            frame14.AnchorPoint = Vector2.new(0, 0.5)
            frame14.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame14.BackgroundTransparency = 1
            frame14.Position = UDim2.new(0, 0, 0.5, 0)
            frame14.Size = UDim2.new(0, 14, 1, 0)
            frame15.Name = "PageInLine"
            frame15.Parent = frame14
            frame15.AnchorPoint = Vector2.new(0.5, 0.5)
            frame15.BorderSizePixel = 0
            frame15.Position = UDim2.new(0.5, 0, 0.5, 0)
            frame15.Size = UDim2.new(1, -10, 1, -10)
            frame15.BackgroundColor3 = getgenv().UIColor["Page Selected Color"]
            frame15.BackgroundTransparency = 1
            uiCorner6.Parent = frame15
            frame16.Name = "TabTitleContainer"
            frame16.Parent = frame13
            frame16.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame16.BackgroundTransparency = 1
            frame16.Position = UDim2.new(0, 15, 0, 0)
            frame16.Size = UDim2.new(1, -15, 1, 0)
            textLabel3.Name = "GUITextColor"
            textLabel3.Parent = frame16
            textLabel3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            textLabel3.BackgroundTransparency = 1
            textLabel3.Size = UDim2.new(1, 0, 1, 0)
            textLabel3.Font = Enum.Font.GothamBold
            textLabel3.Text = text2
            textLabel3.TextSize = 14
            textLabel3.TextXAlignment = Enum.TextXAlignment.Left
            textLabel3.TextColor3 = getgenv().UIColor["GUI Text Color"]
            textButton2.Name = "PageButton"
            textButton2.Parent = frame12
            textButton2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            textButton2.BackgroundTransparency = 1
            textButton2.Size = UDim2.new(1, 0, 1, 0)
            textButton2.Font = Enum.Font.SourceSans
            textButton2.Text = ""
            
            local frame17 = Instance.new("Frame")
            local uiCorner7 = Instance.new("UICorner")
            local textLabel4 = Instance.new("TextLabel")
            local scrollingFrame2 = Instance.new("ScrollingFrame")
            local uiListLayout3 = Instance.new("UIListLayout")
            local v6 = n9
            n9 += 1
            frame17.Name = "Page" .. v6
            frame17.Parent = frame6
            frame17.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
            frame17.Position = UDim2.new(0, 190, 0, 30)
            frame17.Size = UDim2.new(0, 435, 0, 325)
            frame17.LayoutOrder = layoutOrder2
            frame17.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
            local uiStroke4 = Instance.new("UIStroke")
            uiStroke4.Parent = frame17
            uiStroke4.Thickness = 1
            uiStroke4.Transparency = 0.55
            uiStroke4.Color = getgenv().UIColor["Border Color"]
            local uiGradient3 = Instance.new("UIGradient")
            uiGradient3.Parent = frame17
            uiGradient3.Rotation = 90
            uiGradient3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, getgenv().UIColor["Background 1 Color"]), ColorSequenceKeypoint.new(1, getgenv().UIColor["Background 2 Color"])})
            uiGradient3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.04), NumberSequenceKeypoint.new(1, 0.08)})
            local uiPadding2 = Instance.new("UIPadding")
            uiPadding2.Parent = frame17
            uiPadding2.PaddingLeft = UDim.new(0, 5)
            uiPadding2.PaddingRight = UDim.new(0, 5)
            uiPadding2.PaddingTop = UDim.new(0, 2)
            uiPadding2.PaddingBottom = UDim.new(0, 5)
            uiCorner7.CornerRadius = UDim.new(0, 4)
            uiCorner7.Parent = frame17
            textLabel4.Name = "GUITextColor"
            textLabel4.Parent = frame17
            textLabel4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            textLabel4.BackgroundTransparency = 1
            textLabel4.Position = UDim2.new(0, 5, 0, 0)
            textLabel4.Size = UDim2.new(1, 0, 0, 25)
            textLabel4.Font = Enum.Font.GothamBold
            textLabel4.Text = text3
            textLabel4.TextSize = 16
            textLabel4.TextXAlignment = Enum.TextXAlignment.Left
            textLabel4.TextColor3 = getgenv().UIColor["GUI Text Color"]
            scrollingFrame2.Name = "PageList"
            scrollingFrame2.Parent = frame17
            scrollingFrame2.Active = true
            scrollingFrame2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            scrollingFrame2.BackgroundTransparency = 1
            scrollingFrame2.BorderSizePixel = 0
            scrollingFrame2.Position = UDim2.new(0, 5, 0, 25)
            scrollingFrame2.Size = UDim2.new(1, -10, 1, -25)
            scrollingFrame2.ScrollBarThickness = 5
            uiListLayout3.Name = "Pagelistlayout"
            uiListLayout3.Parent = scrollingFrame2
            uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
            uiListLayout3.Padding = UDim.new(0, 5)
            uiListLayout3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, uiListLayout3.AbsoluteContentSize.Y)
            end)

            textButton2.MouseButton1Click:Connect(function()
                if uiPageLayout.CurrentPage ~= frame17 then uiPageLayout:JumpTo(frame17) end
                for _, v11 in pairs(scrollingFrame:GetChildren()) do
                    if v11:FindFirstChild("Frame") and v11.Frame:FindFirstChild("Line") and v11.Frame.Line:FindFirstChild("PageInLine") then
                        local n10 = v11.Name == text2 .. "_Control" and 0 or 1
                        TweenService:Create(v11.Frame.Line.PageInLine, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = n10}):Play()
                    end
                end
                v5 = frame17
            end)

            local pageObj = {
                CreateSection = function(text4, arg3, arg4, arg5)
                    if type(text4) == "table" and text4.CreateSection then text4, arg3, arg4, arg5 = arg3, arg4, arg5, nil end
                    local flag3 = arg3 or false
                    local frame20 = Instance.new("Frame")
                    local uiCorner9 = Instance.new("UICorner")
                    local frame21 = Instance.new("Frame")
                    local textLabel5 = Instance.new("TextLabel")
                    local frame22 = Instance.new("Frame")
                    local uiGradient4 = Instance.new("UIGradient")
                    local uiListLayout4 = Instance.new("UIListLayout")
                    
                    frame20.Name = text4 .. "_Dot"
                    frame20.Parent = scrollingFrame2
                    frame20.Size = UDim2.new(1, -5, 0, 30)
                    frame20.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
                    frame20.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    frame20.ClipsDescendants = true
                    uiCorner9.CornerRadius = UDim.new(0, 4)
                    uiCorner9.Parent = frame20
                    frame21.Name = "Topsec"
                    frame21.Parent = frame20
                    frame21.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    frame21.BackgroundTransparency = 1
                    frame21.Size = UDim2.new(0, 415, 0, 30)
                    textLabel5.Name = "Sectiontitle"
                    textLabel5.Parent = frame21
                    textLabel5.BackgroundTransparency = 1
                    textLabel5.Size = UDim2.new(1, 0, 1, 0)
                    textLabel5.Font = Enum.Font.GothamBold
                    textLabel5.Text = text4
                    textLabel5.TextSize = 14
                    textLabel5.TextColor3 = arg5 or getgenv().UIColor["Section Text Color"]
                    frame22.Name = "Linesec"
                    frame22.Parent = frame21
                    frame22.AnchorPoint = Vector2.new(0.5, 1)
                    frame22.Position = UDim2.new(0.5, 0, 1, -2)
                    frame22.Size = UDim2.new(1, -10, 0, 2)
                    frame22.BackgroundColor3 = arg5 or getgenv().UIColor["Section Underline Color"]
                    
                    local uiStroke5 = Instance.new("UIStroke")
                    uiStroke5.Parent = frame20
                    uiStroke5.Color = getgenv().UIColor["Border Color"]
                    uiStroke5.Thickness = 1
                    uiStroke5.Transparency = 0.6
                    
                    local uiGradient5 = Instance.new("UIGradient")
                    uiGradient5.Parent = frame20
                    uiGradient5.Rotation = 90
                    uiGradient5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, getgenv().UIColor["Background 2 Color"]), ColorSequenceKeypoint.new(1, getgenv().UIColor["Background 3 Color"])})
                    uiGradient5.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.05), NumberSequenceKeypoint.new(1, 0.15)})
                    
                    uiGradient4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(253, 224, 71)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 179, 8))})
                    uiGradient4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 0.8)})

                    local n10 = nil
                    local flag4 = false

                    if flag3 then
                        local textButton4 = Instance.new("TextButton")
                        textButton4.Parent = frame21
                        textButton4.AnchorPoint = Vector2.new(1, 0.5)
                        textButton4.BackgroundTransparency = 1
                        textButton4.Position = UDim2.new(1, -5, 0.5, 0)
                        textButton4.Size = UDim2.new(0, 20, 0, 20)
                        textButton4.ZIndex = 2
                        
                        local frame23 = Instance.new("Frame")
                        frame23.Parent = frame21
                        frame23.AnchorPoint = Vector2.new(1, 0.5)
                        frame23.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        frame23.Position = UDim2.new(1, -12, 0.5, 0)
                        frame23.Size = UDim2.new(0, 20, 0, 20)
                        local uiCorner10 = Instance.new("UICorner")
                        uiCorner10.CornerRadius = UDim.new(0, 4)
                        uiCorner10.Parent = frame23

                        local imageButton = Instance.new("ImageButton")
                        imageButton.Parent = frame23
                        imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
                        imageButton.BackgroundTransparency = 1
                        imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
                        imageButton.Size = UDim2.new(1, -4, 1, -4)
                        imageButton.Image = "rbxassetid://3926307971"
                        imageButton.ImageRectOffset = Vector2.new(84, 44)
                        imageButton.ImageRectSize = Vector2.new(36, 36)
                        imageButton.ImageTransparency = 1
                        
                        local imageButton2 = Instance.new("ImageButton")
                        imageButton2.Parent = frame23
                        imageButton2.AnchorPoint = Vector2.new(0.5, 0.5)
                        imageButton2.BackgroundTransparency = 1
                        imageButton2.Position = UDim2.new(0.5, 0, 0.5, 0)
                        imageButton2.Size = UDim2.new(1, -4, 1, -4)
                        imageButton2.Image = "rbxassetid://3926307971"
                        imageButton2.ImageRectOffset = Vector2.new(564, 44)
                        imageButton2.ImageRectSize = Vector2.new(36, 36)
                        imageButton2.ImageTransparency = 0

                        textButton4.MouseButton1Down:Connect(function()
                            flag4 = not flag4
                            TweenService:Create(imageButton, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"] / 2), {ImageTransparency = flag4 and 0 or 1}):Play()
                            wait(getgenv().UIColor["Tween Animation 1 Speed"] / 4)
                            TweenService:Create(imageButton2, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"] / 2), {ImageTransparency = flag4 and 1 or 0}):Play()
                            TweenService:Create(frame20, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Size = UDim2.new(1, -5, 0, flag4 and n10 or 30)}):Play()
                        end)
                    end

                    if arg4 then
                        local frame23 = Instance.new("Frame")
                        frame23.Name = "SectionGap"
                        frame23.Parent = scrollingFrame2
                        frame23.Size = UDim2.new(1, -5, 0, 30)
                        frame23.Transparency = 1
                    end

                    uiGradient4.Parent = frame22
                    uiListLayout4.Name = "SectionList"
                    uiListLayout4.Parent = frame20
                    uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                    uiListLayout4.Padding = UDim.new(0, 5)

                    uiListLayout4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                        if not flag3 then frame20.Size = UDim2.new(1, -5, 0, uiListLayout4.AbsoluteContentSize.Y + 5) end
                        n10 = uiListLayout4.AbsoluteContentSize.Y + 5
                        if flag4 then TweenService:Create(frame20, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Size = UDim2.new(1, -5, 0, n10)}):Play() end
                    end)

                    local sectionObj = {}
                    
                    sectionObj.CreateToggle = function(arg6, arg7)
                        if type(arg6) == "table" and arg6.CreateToggle then arg6, arg7 = arg7, nil end
                        local text5 = tostring(arg6.Title)
                        local desc2 = arg6.Desc
                        local default = arg6.Default
                        if default == nil then default = false end
                        local fn7 = arg7 or function() end
                        
                        local frame23 = Instance.new("Frame")
                        local frame24 = Instance.new("Frame")
                        local frame25 = Instance.new("Frame")
                        local frame26 = Instance.new("Frame")
                        local frame27 = Instance.new("Frame")
                        local textLabel6 = Instance.new("TextLabel")
                        local textLabel7 = Instance.new("TextLabel")
                        local frame28 = Instance.new("Frame")
                        local uiCorner10 = Instance.new("UICorner")
                        local textButton4 = Instance.new("TextButton")
                        local uiListLayout5 = Instance.new("UIListLayout")
                        
                        frame23.Name = "ToggleFrame"
                        frame23.Parent = frame20
                        frame23.BackgroundTransparency = 1
                        frame23.Size = UDim2.new(1, 0, 0, 0)
                        frame23.AutomaticSize = Enum.AutomaticSize.Y
                        frame24.Name = "TogFrame1"
                        frame24.Parent = frame23
                        frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                        frame24.BackgroundTransparency = 1
                        frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                        frame24.Size = UDim2.new(1, -10, 0, 0)
                        frame24.AutomaticSize = Enum.AutomaticSize.Y
                        frame25.Name = "checkbox"
                        frame25.Parent = frame24
                        frame25.AnchorPoint = Vector2.new(1, 0.5)
                        frame25.BackgroundColor3 = getgenv().UIColor["Toggle Border Color"]
                        frame25.Position = UDim2.new(1, -5, 0.5, 3)
                        frame25.Size = UDim2.new(0, 22.5, 0, 22.5)
                        frame26.Name = "checkbox2"
                        frame26.Parent = frame25
                        frame26.AnchorPoint = Vector2.new(0.5, 0.5)
                        frame26.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                        frame26.Position = UDim2.new(0.5, 0, 0.5, 0)
                        frame26.Size = UDim2.new(0, 18, 0, 18)
                        local uiCorner11 = Instance.new("UICorner")
                        uiCorner11.CornerRadius = UDim.new(0, 4)
                        uiCorner11.Parent = frame25
                        frame27.Name = "check"
                        frame27.Parent = frame26
                        frame27.AnchorPoint = Vector2.new(0, 1)
                        frame27.BackgroundColor3 = getgenv().UIColor["Toggle Checked Color"]
                        frame27.Position = UDim2.new(0, 0, 1, 0)
                        
                        local n11 = 5
                        if desc2 then
                            n11 = 0
                            textLabel6.Name = "ToggleDesc"
                            textLabel6.Parent = frame24
                            textLabel6.BackgroundTransparency = 1
                            textLabel6.Position = UDim2.new(0, 15, 0, 20)
                            textLabel6.Size = UDim2.new(1, -50, 0, 0)
                            textLabel6.Font = Enum.Font.GothamBlack
                            textLabel6.Text = desc2
                            textLabel6.TextSize = 13
                            textLabel6.TextWrapped = true
                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                            textLabel6.AutomaticSize = Enum.AutomaticSize.Y
                            textLabel6.TextColor3 = getgenv().UIColor["Toggle Desc Color"]
                        end
                        
                        textLabel7.Name = "TextColor"
                        textLabel7.Parent = frame24
                        textLabel7.BackgroundTransparency = 1
                        textLabel7.Position = UDim2.new(0, 10, 0, n11)
                        textLabel7.Size = UDim2.new(1, -10, 0, 20)
                        textLabel7.Font = Enum.Font.GothamBlack
                        textLabel7.Text = text5
                        textLabel7.TextSize = 14
                        textLabel7.TextXAlignment = Enum.TextXAlignment.Left
                        textLabel7.AutomaticSize = Enum.AutomaticSize.Y
                        textLabel7.TextColor3 = getgenv().UIColor["Text Color"]
                        
                        frame28.Name = "Background1"
                        frame28.Parent = frame24
                        frame28.Size = UDim2.new(1, 0, 1, 6)
                        frame28.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                        frame28.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                        uiCorner10.CornerRadius = UDim.new(0, 4)
                        uiCorner10.Parent = frame28
                        
                        textButton4.Name = "ToggleButton"
                        textButton4.Parent = frame24
                        textButton4.BackgroundTransparency = 1
                        textButton4.AnchorPoint = Vector2.new(1, 0.5)
                        textButton4.Size = UDim2.new(0, 25, 0, 25)
                        textButton4.Position = UDim2.new(1, -5, 0.5, 3)
                        textButton4.Text = ""
                        
                        uiListLayout5.Parent = frame23
                        uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                        uiListLayout5.Padding = UDim.new(0, 5)

                        local function updateToggle(arg8)
                            local udim26 = arg8 and UDim2.new(0.8, 0, 0.8, 0) or UDim2.new(0, 0, 0, 0)
                            TweenService:Create(frame27, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Size = udim26, Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5)}):Play()
                            if type(fn7) == "function" then fn7(arg8) end
                        end

                        if fn7 then updateToggle(default) end
                        textButton4.MouseButton1Down:Connect(function()
                            default = not default
                            updateToggle(default)
                        end)

                        local functionCreate = {
                            SetStage = function(arg8) if arg8 ~= default then default = not default updateToggle(default) end end,
                            Set = function(arg8) if arg8 ~= default then default = not default updateToggle(default) end end,
                        }
                        arg6.Page_Name = text2
                        arg6.Section_Name = text4
                        tbl3:RegisterOption(arg6, arg7)
                        return functionCreate
                    end
                    
                    sectionObj.CreateButton = function(arg6, arg7)
                        if type(arg6) == "table" and arg6.CreateButton then arg6, arg7 = arg7, nil end
                        local title = arg6.Title
                        local fn7 = arg7 or function() end
                        
                        local frame23 = Instance.new("Frame")
                        local frame24 = Instance.new("Frame")
                        local textLabel6 = Instance.new("TextLabel")
                        local textButton4 = Instance.new("TextButton")
                        
                        frame23.Parent = frame20
                        frame23.BackgroundTransparency = 1
                        frame23.Size = UDim2.new(1, 0, 0, 40)
                        
                        frame24.Parent = frame23
                        frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                        frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                        frame24.Size = UDim2.new(1, -10, 1, 0)
                        frame24.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                        frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                        Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 10)
                        
                        textLabel6.Parent = frame24
                        textLabel6.BackgroundTransparency = 1
                        textLabel6.Position = UDim2.new(0, 12, 0, 0)
                        textLabel6.Size = UDim2.new(1, -110, 1, 0)
                        textLabel6.Font = Enum.Font.GothamBold
                        textLabel6.Text = title or "Button"
                        textLabel6.TextSize = 14
                        textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                        textLabel6.TextColor3 = getgenv().UIColor["GUI Text Color"]
                        
                        textButton4.Parent = frame24
                        textButton4.BackgroundTransparency = 1
                        textButton4.Size = UDim2.new(1, 0, 1, 0)
                        textButton4.Text = "Click"
                        textButton4.Font = Enum.Font.GothamBold
                        textButton4.TextColor3 = getgenv().UIColor["Button Color"]
                        
                        textButton4.MouseButton1Down:Connect(function()
                            if type(fn7) == "function" then task.defer(fn7) end
                        end)
                        
                        arg6.Page_Name = text2
                        arg6.Section_Name = text4
                        arg6.Button = true
                        tbl3:RegisterOption(arg6, fn7)
                        return {SetText = function(txt) textLabel6.Text = txt end}
                    end
                    
                    sectionObj.CreateLabel = function(arg6)
                        if type(arg6) == "table" and arg6.CreateLabel then arg6 = arg6.Title end
                        local frame23 = Instance.new("Frame")
                        local frame24 = Instance.new("Frame")
                        local textLabel6 = Instance.new("TextLabel")
                        
                        frame23.Parent = frame20
                        frame23.BackgroundTransparency = 1
                        frame23.Size = UDim2.new(1, 0, 0, 0)
                        frame23.AutomaticSize = Enum.AutomaticSize.Y
                        
                        frame24.Parent = frame23
                        frame24.AnchorPoint = Vector2.new(0.5, 0)
                        frame24.Position = UDim2.new(0.5, 0, 0, 0)
                        frame24.Size = UDim2.new(1, -10, 0, -10)
                        frame24.AutomaticSize = Enum.AutomaticSize.Y
                        frame24.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                        frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                        Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 6)
                        
                        textLabel6.Parent = frame24
                        textLabel6.BackgroundTransparency = 1
                        textLabel6.Position = UDim2.new(0, 12, 0, 6)
                        textLabel6.Size = UDim2.new(1, -24, 1, -12)
                        textLabel6.Font = Enum.Font.GothamSemibold
                        textLabel6.Text = type(arg6) == "table" and arg6.Title or tostring(arg6 or "Label")
                        textLabel6.TextSize = 14
                        textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                        textLabel6.AutomaticSize = Enum.AutomaticSize.Y
                        textLabel6.TextWrapped = true
                        textLabel6.TextColor3 = getgenv().UIColor["Label Color"]
                        
                        arg6.Page_Name = text2
                        arg6.Section_Name = text4
                        arg6.TextLabel = true
                        tbl3:RegisterOption(arg6, nil)
                        return {
                            SetText = function(txt) textLabel6.Text = txt end,
                            GetText = function() return textLabel6.Text end
                        }
                    end
                    
                    sectionObj.CreateDropdown = function(arg6, arg7)
                        if type(arg6) == "table" and arg6.CreateDropdown then arg6, arg7 = arg7, nil end
                        local str2 = tostring(arg6.Title)
                        local list = arg6.List
                        local search = arg6.Search or false
                        local selected = arg6.Selected or false
                        local slider = arg6.Slider or false
                        local sliderRelease = arg6.SliderRelease or false
                        local default = arg6.Default
                        local priority = arg6.Priority or false
                        local fn7 = arg7 or function() end
                        local sortPairs = arg6.SortPairs or pairs
                        
                        local frame23 = Instance.new("Frame")
                        local frame24 = Instance.new("Frame")
                        local frame25 = Instance.new("Frame")
                        local imageLabel9 = Instance.new("ImageLabel")
                        local textButton4 = Instance.new("TextButton")
                        local frame26 = Instance.new("Frame")
                        local scrollingFrame3 = Instance.new("ScrollingFrame")
                        local frame27 = Instance.new("Frame")
                        local uiListLayout5 = Instance.new("UIListLayout")
                        
                        local textBox3
                        if search then textBox3 = Instance.new("TextBox") else textBox3 = Instance.new("TextLabel") end
                        
                        frame23.Parent = frame20
                        frame23.BackgroundTransparency = 1
                        frame23.Size = UDim2.new(1, 0, 0, 25)
                        
                        frame24.Parent = frame23
                        frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                        frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                        frame24.Size = UDim2.new(1, -10, 1, 0)
                        frame24.ClipsDescendants = true
                        frame24.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                        frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                        Instance.new("UICorner", frame24).CornerRadius = UDim.new(0, 4)
                        
                        frame25.Parent = frame24
                        frame25.Size = UDim2.new(1, 0, 0, 25)
                        frame25.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                        frame25.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                        
                        textBox3.Parent = frame25
                        textBox3.BackgroundTransparency = 1
                        textBox3.Position = UDim2.new(0, 10, 0, 0)
                        textBox3.Size = UDim2.new(1, -40, 1, 0)
                        textBox3.Font = Enum.Font.GothamBlack
                        textBox3.Text = ""
                        textBox3.TextSize = 14
                        textBox3.TextXAlignment = Enum.TextXAlignment.Left
                        textBox3.TextColor3 = getgenv().UIColor["Text Color"]
                        
                        local stringValue = Instance.new("StringValue", textBox3)
                        stringValue.Value = ""
                        if default and table.find(list, default) then stringValue.Value = default end
                        
                        if selected then
                            if search then textBox3.PlaceholderText = str2 .. ": " else textBox3.Text = str2 .. ": " end
                        elseif search then
                            textBox3.PlaceholderText = str2 .. ": " .. tostring(default or "")
                        else
                            textBox3.Text = str2 .. ": " .. tostring(default or "")
                        end
                        
                        imageLabel9.Parent = frame25
                        imageLabel9.AnchorPoint = Vector2.new(1, 0.5)
                        imageLabel9.BackgroundTransparency = 1
                        imageLabel9.Position = UDim2.new(1, -6, 0.5, 0)
                        imageLabel9.Size = UDim2.new(0, 15, 0, 15)
                        imageLabel9.Image = "rbxassetid://6954383209"
                        imageLabel9.ImageColor3 = getgenv().UIColor["Dropdown Icon Color"]
                        
                        textButton4.Parent = frame25
                        textButton4.BackgroundTransparency = 1
                        textButton4.Size = search and UDim2.new(0, 30, 0, 30) or UDim2.new(1, 0, 1, 0)
                        textButton4.Position = search and UDim2.new(1, -35, 0, 0) or UDim2.new(0, 0, 0, 0)
                        textButton4.Text = ""
                        
                        frame26.Parent = frame24
                        frame26.BackgroundTransparency = 1
                        frame26.Position = UDim2.new(0, 0, 0, 25)
                        frame26.Size = UDim2.new(1, 0, 0, 25)
                        
                        scrollingFrame3.Parent = frame26
                        scrollingFrame3.Active = true
                        scrollingFrame3.BackgroundTransparency = 1
                        scrollingFrame3.Size = UDim2.new(1, 0, 1, 0)
                        scrollingFrame3.ScrollBarThickness = 5
                        
                        frame27.Parent = scrollingFrame3
                        frame27.BackgroundTransparency = 1
                        frame27.Position = UDim2.new(0, 5, 0, 5)
                        frame27.Size = UDim2.new(1, -15, 1, -5)
                        
                        uiListLayout5.Parent = frame27
                        uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                        uiListLayout5.Padding = UDim.new(0, 5)
                        
                        uiListLayout5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                            scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 10 + uiListLayout5.AbsoluteContentSize.Y + 5)
                        end)

                        local flag10 = false
                        local tbl12 = list
                        
                        local function refreshList()
                            for _, child in pairs(frame27:GetChildren()) do
                                if child:IsA("Frame") then child:Destroy() end
                            end
                            
                            for k, v10 in sortPairs(tbl12) do
                                if selected then
                                    local isSelected = v10
                                    local frame28 = Instance.new("Frame", frame27)
                                    frame28.Name = string.lower(k)
                                    frame28.BackgroundTransparency = 1
                                    frame28.Size = UDim2.new(1, 0, 0, 25)
                                    
                                    local frame29 = Instance.new("Frame", frame28)
                                    frame29.AnchorPoint = Vector2.new(0.5, 0.5)
                                    frame29.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    frame29.Size = UDim2.new(1, 0, 1, 0)
                                    frame29.BackgroundColor3 = isSelected and getgenv().UIColor["Dropdown Selected Check Color"] or Color3.fromRGB(255, 255, 255)
                                    frame29.BackgroundTransparency = isSelected and 0.5 or 1
                                    
                                    local textLabel6 = Instance.new("TextLabel", frame29)
                                    textLabel6.BackgroundTransparency = 1
                                    textLabel6.Position = UDim2.new(0, 10, 0, 0)
                                    textLabel6.Size = UDim2.new(1, -40, 0, 25)
                                    textLabel6.Font = Enum.Font.GothamBlack
                                    textLabel6.Text = k
                                    textLabel6.TextSize = 14
                                    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                    textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    
                                    local imageButton = Instance.new("ImageButton", frame29)
                                    imageButton.AnchorPoint = Vector2.new(1, 0.5)
                                    imageButton.BackgroundTransparency = 1
                                    imageButton.Position = UDim2.new(1, 0, 0.5, 0)
                                    imageButton.Size = UDim2.new(0, 25, 0, 25)
                                    imageButton.Image = "rbxassetid://3926305904"
                                    imageButton.ImageColor3 = getgenv().UIColor["Dropdown Selected Check Color"]
                                    imageButton.ImageRectOffset = Vector2.new(312, 4)
                                    imageButton.ImageRectSize = Vector2.new(24, 24)
                                    imageButton.ImageTransparency = isSelected and 0 or 1
                                    
                                    local textButton5 = Instance.new("TextButton", frame28)
                                    textButton5.BackgroundTransparency = 1
                                    textButton5.Size = UDim2.new(1, 0, 1, 0)
                                    textButton5.Text = ""
                                    
                                    textButton5.MouseButton1Click:Connect(function()
                                        isSelected = not isSelected
                                        TweenService:Create(imageButton, TweenInfo.new(0.2), {ImageTransparency = isSelected and 0 or 1}):Play()
                                        TweenService:Create(frame29, TweenInfo.new(0.2), {
                                            BackgroundColor3 = isSelected and getgenv().UIColor["Dropdown Selected Check Color"] or Color3.fromRGB(255, 255, 255),
                                            BackgroundTransparency = isSelected and 0.5 or 1
                                        }):Play()
                                        if type(fn7) == "function" then fn7(k, isSelected) end
                                        tbl12[k] = isSelected
                                    end)
                                elseif slider then
                                    local text5 = tostring(v10.Title)
                                    local n11 = tonumber(v10.Min) or 0
                                    local n12 = tonumber(v10.Max) or 100
                                    local v11 = tonumber(v10.Default) or n11
                                    
                                    local frame28 = Instance.new("Frame", frame27)
                                    frame28.BackgroundTransparency = 1
                                    frame28.Size = UDim2.new(1, 0, 0, 50)
                                    
                                    local frame29 = Instance.new("Frame", frame28)
                                    frame29.AnchorPoint = Vector2.new(0.5, 0.5)
                                    frame29.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    frame29.Size = UDim2.new(1, -10, 1, 0)
                                    frame29.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                                    frame29.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                                    
                                    local textLabel6 = Instance.new("TextLabel", frame29)
                                    textLabel6.BackgroundTransparency = 1
                                    textLabel6.Position = UDim2.new(0, 10, 0, 0)
                                    textLabel6.Size = UDim2.new(1, -10, 0, 25)
                                    textLabel6.Font = Enum.Font.GothamBlack
                                    textLabel6.Text = text5
                                    textLabel6.TextSize = 14
                                    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                    textLabel6.TextColor3 = getgenv().UIColor["Text Color"]
                                    
                                    local frame30 = Instance.new("Frame", frame28)
                                    frame30.AnchorPoint = Vector2.new(0.5, 0.5)
                                    frame30.Position = UDim2.new(0.5, 0, 0.5, 14)
                                    frame30.Size = UDim2.new(1, -20, 0, 6)
                                    frame30.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                                    
                                    local frame31 = Instance.new("Frame", frame30)
                                    frame31.BorderSizePixel = 0
                                    frame31.Size = UDim2.new(0, 0, 1, 0)
                                    frame31.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                                    
                                    local textBox4 = Instance.new("TextBox", frame28)
                                    textBox4.AnchorPoint = Vector2.new(1, 0)
                                    textBox4.Position = UDim2.new(1, -10, 0, 5)
                                    textBox4.Size = UDim2.new(0, 150, 0, 25)
                                    textBox4.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                                    textBox4.Font = Enum.Font.GothamBold
                                    textBox4.Text = tostring(v11)
                                    textBox4.TextSize = 14
                                    textBox4.TextColor3 = getgenv().UIColor["Text Color"]
                                    
                                    local function updateSlider(val)
                                        textBox4.Text = tostring(val)
                                        tbl12[k].Default = val
                                        if type(fn7) == "function" then fn7(k, v10) end
                                    end
                                    
                                    frame31.Size = UDim2.new(1 - (n12 - v11) / (n12 - n11), 0, 0, 6)
                                    
                                    textBox4.FocusLost:Connect(function()
                                        local val = tonumber(textBox4.Text) or v11
                                        val = math.clamp(val, n11, n12)
                                        frame31.Size = UDim2.new(1 - (n12 - val) / (n12 - n11), 0, 0, 6)
                                        updateSlider(val)
                                    end)
                                else
                                    local frame28 = Instance.new("Frame", frame27)
                                    frame28.BackgroundTransparency = 1
                                    frame28.Size = UDim2.new(1, 0, 0, 25)
                                    
                                    local frame29 = Instance.new("Frame", frame28)
                                    frame29.AnchorPoint = Vector2.new(0.5, 0.5)
                                    frame29.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    frame29.Size = UDim2.new(1, 0, 1, 0)
                                    frame29.BackgroundTransparency = 1
                                    
                                    local textLabel6 = Instance.new("TextLabel", frame29)
                                    textLabel6.BackgroundTransparency = 1
                                    textLabel6.Position = UDim2.new(0, 10, 0, 0)
                                    textLabel6.Size = UDim2.new(1, -40, 0, 25)
                                    textLabel6.Font = Enum.Font.GothamBlack
                                    textLabel6.Text = v10
                                    textLabel6.TextSize = 14
                                    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                    textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    
                                    local textButton5 = Instance.new("TextButton", frame28)
                                    textButton5.BackgroundTransparency = 1
                                    textButton5.Size = UDim2.new(1, 0, 1, 0)
                                    textButton5.Text = ""
                                    
                                    textButton5.MouseButton1Click:Connect(function()
                                        if search then textBox3.PlaceholderText = str2 .. ": " .. v10 else textBox3.Text = str2 .. ": " .. v10 end
                                        stringValue.Value = v10
                                        if type(fn7) == "function" then fn7(v10) end
                                    end)
                                end
                            end
                        end
                        
                        refreshList()
                        
                        textButton4.MouseButton1Click:Connect(function()
                            flag10 = not flag10
                            TweenService:Create(frame26, TweenInfo.new(0.2), {Size = flag10 and UDim2.new(1, 0, 0, 170) or UDim2.new(1, 0, 0, 0)}):Play()
                            TweenService:Create(frame23, TweenInfo.new(0.2), {Size = flag10 and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 25)}):Play()
                            TweenService:Create(imageLabel9, TweenInfo.new(0.2), {Rotation = flag10 and 90 or 0}):Play()
                        end)
                        
                        arg6.Page_Name = text2
                        arg6.Section_Name = text4
                        arg6.FunctionCreate = {GetValue = function() return stringValue.Value end, SetValue = function(v) stringValue.Value = v textBox3.Text = str2 .. ": " .. v end}
                        tbl3:RegisterOption(arg6, arg7)
                        return arg6.FunctionCreate
                    end
                    
                    -- Alias functions to prevent "nil" errors
                    sectionObj.CreateSlider = function(arg6, arg7)
                        arg6.Slider = true
                        return sectionObj.CreateDropdown(arg6, arg7)
                    end
                    sectionObj.CreateTextBox = function(arg6, arg7)
                        return sectionObj.CreateDropdown(arg6, arg7)
                    end
                    sectionObj.CreateKeybind = function(arg6, arg7)
                        return sectionObj.CreateDropdown(arg6, arg7)
                    end

                    return sectionObj
                end
            }
            return pageObj
        end
    }
end

tbl3.CreateNoti({
    Title = "Notification",
    Desc = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
    ShowTime = 10
}, true)

return tbl3
