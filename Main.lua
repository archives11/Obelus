-- perplex ui
-- made by Portal (give credit)
-- do not publish or take credit




LoadedTime = tick()

local LocalPlayer = game.Players.LocalPlayer

function Alive(Player)
	if
		Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and
			Player.Character:FindFirstChild("Humanoid") ~= nil and
			Player.Character:FindFirstChild("Head") ~= nil
	 then
		return true
	end
	return false
end

settings = {
	enabled = false, -- / true / false
	minCameraDistance = 1, -- / any number--Memelouse#3150
	hatTransparency = .35, -- / 0 - 1 (0 being invisible)
	circleTransparency = 1, -- / 0 - 1 (0 being invisible)
	height = .75, -- / any number
	radius = 1, -- /-- any number
	sides = 25, -- / any number
	rainbow = false, -- / true / false
	color = Color3.fromRGB(128, 18, 255), -- / 0-255,0-255,0-255
	offset = Vector3.new(0, .75, 0) -- / number,number,number (studs offset from head center)
}

local runservice = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local tau = math.pi * 2
local drawings = {}

for i = 1, settings.sides do
	drawings[i] = {Drawing.new("Line"), Drawing.new("Triangle")}
	drawings[i][1].ZIndex = 2
	drawings[i][1].Thickness = 2
	drawings[i][2].ZIndex = 1
	drawings[i][2].Filled = true
end

runservice.RenderStepped:Connect(
	function()
		local pass =
			settings.enabled and lplr.Character and lplr.Character:FindFirstChild("Head") ~= nil and
			(camera.CFrame.p - camera.Focus.p).magnitude > settings.minCameraDistance and
			lplr.Character.Humanoid.Health > 0
		for i = 1, #drawings do
			local line, triangle = drawings[i][1], drawings[i][2]
			if pass then
				local color =
					settings.rainbow and Color3.fromHSV((tick() % 5 / 5 - (i / #drawings)) % 1, .5, 1) or
					settings.color
				local pos = lplr.Character.Head.Position + settings.offset
				local topWorld = pos + Vector3.new(0, settings.height, 0)

				local last, next = (i / settings.sides) * tau, ((i + 1) / settings.sides) * tau
				local lastWorld =
					pos + (Vector3.new(math.cos(last), 0, math.sin(last)) * settings.radius)
				local nextWorld =
					pos + (Vector3.new(math.cos(next), 0, math.sin(next)) * settings.radius)
				local lastScreen = camera:WorldToViewportPoint(lastWorld)
				local nextScreen = camera:WorldToViewportPoint(nextWorld)
				local topScreen = camera:WorldToViewportPoint(topWorld)

				line.From = Vector2.new(lastScreen.X, lastScreen.Y)
				line.To = Vector2.new(nextScreen.X, nextScreen.Y)
				line.Color = color
				line.Transparency = settings.circleTransparency
				line.Visible = true

				triangle.PointA = Vector2.new(topScreen.X, topScreen.Y)
				triangle.PointB = line.From
				triangle.PointC = line.To
				triangle.Color = color
				triangle.Transparency = settings.hatTransparency
				triangle.Visible = true
			else
				line.Visible = false
				triangle.Visible = false
			end
		end
	end
)



























































local Library = {};
do
	Library = {
		Open = true;
		Folders = {
			main = "test";
			configs = "test/Configs";
		};
		Accent = Color3.fromRGB(76, 162, 252);
		Pages = {};
		Sections = {};
		Flags = {};
		UnNamedFlags = 0;
		ThemeObjects = {};
		Instances = {};
		Holder = nil;
		PageHolder = nil;
		Gradient = nil;
		UIGradient = nil;
		CopiedColor = Color3.new(1,1,1);
		CopiedAlpha = 0;
		AllowedCharacters = {
			[1] = ' ',
			[2] = '!',
			[3] = '"',
			[4] = '#',
			[5] = '$',
			[6] = '%',
			[7] = '&',
			[8] = "'",
			[9] = '(',
			[10] = ')',
			[11] = '*',
			[12] = '+',
			[13] = ',',
			[14] = '-',
			[15] = '.',
			[16] = '/',
			[17] = '0',
			[18] = '1',
			[19] = '2',
			[20] = '3',
			[21] = '4',
			[22] = '5',
			[23] = '6',
			[24] = '7',
			[25] = '8',
			[26] = '9',
			[27] = ':',
			[28] = ';',
			[29] = '<',
			[30] = '=',
			[31] = '>',
			[32] = '?',
			[33] = '@',
			[34] = 'A',
			[35] = 'B',
			[36] = 'C',
			[37] = 'D',
			[38] = 'E',
			[39] = 'F',
			[40] = 'G',
			[41] = 'H',
			[42] = 'I',
			[43] = 'J',
			[44] = 'K',
			[45] = 'L',
			[46] = 'M',
			[47] = 'N',
			[48] = 'O',
			[49] = 'P',
			[50] = 'Q',
			[51] = 'R',
			[52] = 'S',
			[53] = 'T',
			[54] = 'U',
			[55] = 'V',
			[56] = 'W',
			[57] = 'X',
			[58] = 'Y',
			[59] = 'Z',
			[60] = '[',
			[61] = "\\",
			[62] = ']',
			[63] = '^',
			[64] = '_',
			[65] = '`',
			[66] = 'a',
			[67] = 'b',
			[68] = 'c',
			[69] = 'd',
			[70] = 'e',
			[71] = 'f',
			[72] = 'g',
			[73] = 'h',
			[74] = 'i',
			[75] = 'j',
			[76] = 'k',
			[77] = 'l',
			[78] = 'm',
			[79] = 'n',
			[80] = 'o',
			[81] = 'p',
			[82] = 'q',
			[83] = 'r',
			[84] = 's',
			[85] = 't',
			[86] = 'u',
			[87] = 'v',
			[88] = 'w',
			[89] = 'x',
			[90] = 'y',
			[91] = 'z',
			[92] = '{',
			[93] = '|',
			[94] = '}',
			[95] = '~'
		};
		ShiftCharacters = {
			["1"] = "!",
			["2"] = "@",
			["3"] = "#",
			["4"] = "$",
			["5"] = "%",
			["6"] = "^",
			["7"] = "&",
			["8"] = "*",
			["9"] = "(",
			["0"] = ")",
			["-"] = "_",
			["="] = "+",
			["["] = "{",
			["\\"] = "|",
			[";"] = ":",
			["'"] = "\"",
			[","] = "<",
			["."] = ">",
			["/"] = "?",
			["`"] = "~"
		};
		Keys = {
			[Enum.KeyCode.LeftShift] = "LShift",
			[Enum.KeyCode.RightShift] = "RShift",
			[Enum.KeyCode.LeftControl] = "LCtrl",
			[Enum.KeyCode.RightControl] = "RCtrl",
			[Enum.KeyCode.LeftAlt] = "LAlt",
			[Enum.KeyCode.RightAlt] = "RAlt",
			[Enum.KeyCode.CapsLock] = "Caps",
			[Enum.KeyCode.One] = "1",
			[Enum.KeyCode.Two] = "2",
			[Enum.KeyCode.Three] = "3",
			[Enum.KeyCode.Four] = "4",
			[Enum.KeyCode.Five] = "5",
			[Enum.KeyCode.Six] = "6",
			[Enum.KeyCode.Seven] = "7",
			[Enum.KeyCode.Eight] = "8",
			[Enum.KeyCode.Nine] = "9",
			[Enum.KeyCode.Zero] = "0",
			[Enum.KeyCode.KeypadOne] = "Num1",
			[Enum.KeyCode.KeypadTwo] = "Num2",
			[Enum.KeyCode.KeypadThree] = "Num3",
			[Enum.KeyCode.KeypadFour] = "Num4",
			[Enum.KeyCode.KeypadFive] = "Num5",
			[Enum.KeyCode.KeypadSix] = "Num6",
			[Enum.KeyCode.KeypadSeven] = "Num7",
			[Enum.KeyCode.KeypadEight] = "Num8",
			[Enum.KeyCode.KeypadNine] = "Num9",
			[Enum.KeyCode.KeypadZero] = "Num0",
			[Enum.KeyCode.Minus] = "-",
			[Enum.KeyCode.Equals] = "=",
			[Enum.KeyCode.Tilde] = "~",
			[Enum.KeyCode.LeftBracket] = "[",
			[Enum.KeyCode.RightBracket] = "]",
			[Enum.KeyCode.RightParenthesis] = ")",
			[Enum.KeyCode.LeftParenthesis] = "(",
			[Enum.KeyCode.Semicolon] = ",",
			[Enum.KeyCode.Quote] = "'",
			[Enum.KeyCode.BackSlash] = "\\",
			[Enum.KeyCode.Comma] = ",",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Slash] = "/",
			[Enum.KeyCode.Asterisk] = "*",
			[Enum.KeyCode.Plus] = "+",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Backquote] = "`",
			[Enum.UserInputType.MouseButton1] = "MB1",
			[Enum.UserInputType.MouseButton2] = "MB2",
			[Enum.UserInputType.MouseButton3] = "MB3"
		};
		Connections = {};
        Font = Enum.Font.SourceSans;
		FontSize = 13;
		Notifs = {};
		KeyList = nil;
		UIKey = Enum.KeyCode.End;
		ScreenGUI = nil;
	}

	-- // Ignores
	local Flags = {}; -- Ignore
	local Dropdowns = {}; -- Ignore
	local Pickers = {}; -- Ignore
	local VisValues = {}; -- Ignore
    local Find = table.find; 

	-- // Extension
	Library.__index = Library
	Library.Pages.__index = Library.Pages
	Library.Sections.__index = Library.Sections
	local LocalPlayer = game:GetService('Players').LocalPlayer;
	local Mouse = LocalPlayer:GetMouse();

	-- // Misc Functions
	do
		function Library:Connection(Signal, Callback)
			local Con = Signal:Connect(Callback)
			return Con
		end
		--
		function Library:Disconnect(Connection)
			Connection:Disconnect()
		end
		--
		function Library:Round(Number, Float)
			return Float * math.floor(Number / Float)
		end
		--
		function Library.NextFlag()
			Library.UnNamedFlags = Library.UnNamedFlags + 1
			return string.format("%.14g", Library.UnNamedFlags)
		end
		--
		function Library:RGBA(r, g, b, alpha)
			local rgb = Color3.fromRGB(r, g, b)
			local mt = table.clone(getrawmetatable(rgb))

			setreadonly(mt, false)
			local old = mt.__index

			mt.__index = newcclosure(function(self, key)
				if key:lower() == "transparency" then
					return alpha
				end

				return old(self, key)
			end)

			setrawmetatable(rgb, mt)

			return rgb
		end
		--
		function Library:GetConfig()
			local Config = ""
			for Index, Value in pairs(self.Flags) do
				if
					Index ~= "ConfigConfig_List"
					and Index ~= "ConfigConfig_Load"
					and Index ~= "ConfigConfig_Save"
				then
					local Value2 = Value
					local Final = ""
					--
					if typeof(Value2) == "Color3" then
						local hue, sat, val = Value2:ToHSV()
						--
						Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, 1)
					elseif typeof(Value2) == "table" and Value2.Color and Value2.Transparency then
						local hue, sat, val = Value2.Color:ToHSV()
						--
						Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, Value2.Transparency)
					elseif typeof(Value2) == "table" and Value.Mode then
						local Values = Value.current
						--
						Final = ("key(%s,%s,%s)"):format(Values[1] or "nil", Values[2] or "nil", Value.Mode)
					elseif Value2 ~= nil then
						if typeof(Value2) == "boolean" then
							Value2 = ("bool(%s)"):format(tostring(Value2))
						elseif typeof(Value2) == "table" then
							local New = "table("
							--
							for Index2, Value3 in pairs(Value2) do
								New = New .. Value3 .. ","
							end
							--
							if New:sub(#New) == "," then
								New = New:sub(0, #New - 1)
							end
							--
							Value2 = New .. ")"
						elseif typeof(Value2) == "string" then
							Value2 = ("string(%s)"):format(Value2)
						elseif typeof(Value2) == "number" then
							Value2 = ("number(%s)"):format(Value2)
						end
						--
						Final = Value2
					end
					--
					Config = Config .. Index .. ": " .. tostring(Final) .. "\n"
				end
			end
			--
			return Config
		end
		--
		function Library:LoadConfig(Config)
			local Table = string.split(Config, "\n")
			local Table2 = {}
			for Index, Value in pairs(Table) do
				local Table3 = string.split(Value, ":")
				--
				if Table3[1] ~= "ConfigConfig_List" and #Table3 >= 2 then
					local Value = Table3[2]:sub(2, #Table3[2])
					--
					if Value:sub(1, 3) == "rgb" then
						local Table4 = string.split(Value:sub(5, #Value - 1), ",")
						--
						Value = Table4
					elseif Value:sub(1, 3) == "key" then
						local Table4 = string.split(Value:sub(5, #Value - 1), ",")
						--
						if Table4[1] == "nil" and Table4[2] == "nil" then
							Table4[1] = nil
							Table4[2] = nil
						end
						--
						Value = Table4
					elseif Value:sub(1, 4) == "bool" then
						local Bool = Value:sub(6, #Value - 1)
						--
						Value = Bool == "true"
					elseif Value:sub(1, 5) == "table" then
						local Table4 = string.split(Value:sub(7, #Value - 1), ",")
						--
						Value = Table4
					elseif Value:sub(1, 6) == "string" then
						local String = Value:sub(8, #Value - 1)
						--
						Value = String
					elseif Value:sub(1, 6) == "number" then
						local Number = tonumber(Value:sub(8, #Value - 1))
						--
						Value = Number
					end
					--
					Table2[Table3[1]] = Value
				end
			end
			--
			for i, v in pairs(Table2) do
				if Flags[i] then
					if typeof(Flags[i]) == "table" then
						Flags[i]:Set(v)
					else
						Flags[i](v)
					end
				end
			end
		end
		--
		function Library:SetOpen(bool)
			if typeof(bool) == 'boolean' then
				Library.Open = bool;
				Library.Holder.Visible = bool;
			end
		end;
		--
		function Library:ChangeAccent(Color)
			Library.Accent = Color

			for obj, theme in next, Library.ThemeObjects do
				if theme:IsA("Frame") or theme:IsA("TextButton") then
					theme.BackgroundColor3 = Color
				elseif theme:IsA("TextLabel") then
					theme.TextColor3 = Color
				elseif theme:IsA("TextButton") and theme.BackgroundTransparency == 1 then
					theme.TextColor3 = Color
				end
			end

			--Library.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color	),ColorSequenceKeypoint.new(1,Color3.new(0.04313725605607033, 0.04313725605607033, 0.04313725605607033)	)}
		end
		--
		function Library:IsMouseOverFrame(Frame)
			local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

			if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
				and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

				return true;
			end;
		end;
		function Library:KeybindList()
			local KeyList = {Keybinds = {}};
			Library.KeyList = KeyList
			--
			local PlaceHolderUI = Instance.new("ScreenGui", game.CoreGui);

			local KeyOutline = Instance.new('Frame', PlaceHolderUI)
			local KeyInline = Instance.new('Frame', KeyOutline)
			local KeyAccent = Instance.new('Frame', KeyInline)
			local KeyHolder = Instance.new('Frame', KeyInline)
			local UIListLayout = Instance.new('UIListLayout', KeyHolder)
			local KeyTitle = Instance.new('TextLabel', KeyInline)
			local LineThing = Instance.new('Frame', KeyInline)
			--
			KeyOutline.Name = "KeyOutline"
			KeyOutline.Position = UDim2.new(0.01,0,0.5,0)
			KeyOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			KeyOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			KeyOutline.AnchorPoint = Vector2.new(0.009999999776482582,0.5)
			KeyOutline.AutomaticSize = Enum.AutomaticSize.XY
			--
			KeyInline.Name = "KeyInline"
			KeyInline.Position = UDim2.new(0,1,0,1)
			KeyInline.Size = UDim2.new(0,-2,0,-2)
			KeyInline.BackgroundColor3 = Color3.new(0.0745,0.0745,0.0745)
			KeyInline.BorderSizePixel = 0
			KeyInline.BorderColor3 = Color3.new(0,0,0)
			KeyInline.AutomaticSize = Enum.AutomaticSize.XY
			--
			KeyAccent.Name = "KeyAccent"
			KeyAccent.Size = UDim2.new(1,0,0,1)
			KeyAccent.BackgroundColor3 = Color3.new(0.3333,0.6667,1)
			KeyAccent.BorderSizePixel = 0
			KeyAccent.BorderColor3 = Color3.new(0,0,0)
			--
			KeyHolder.Name = "KeyHolder"
			KeyHolder.Position = UDim2.new(0,0,0,22)
			KeyHolder.BackgroundColor3 = Color3.new(1,1,1)
			KeyHolder.BackgroundTransparency = 1
			KeyHolder.BorderSizePixel = 0
			KeyHolder.BorderColor3 = Color3.new(0,0,0)
			KeyHolder.AutomaticSize = Enum.AutomaticSize.XY
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			--
			KeyTitle.Name = "KeyTitle"
			KeyTitle.Size = UDim2.new(1,0,0,20)
			KeyTitle.BackgroundColor3 = Color3.new(1,1,1)
			KeyTitle.BackgroundTransparency = 1
			KeyTitle.BorderSizePixel = 0
			KeyTitle.BorderColor3 = Color3.new(0,0,0)
			KeyTitle.Text = "Keybinds"
			KeyTitle.TextColor3 = Color3.new(1,1,1)
			KeyTitle.Font = Library.Font
			KeyTitle.TextSize = 12
			KeyTitle.TextStrokeTransparency = 0
			--
			LineThing.Name = "LineThing"
			LineThing.Position = UDim2.new(0,0,0,20)
			LineThing.Size = UDim2.new(1,0,0,1)
			LineThing.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			LineThing.BorderSizePixel = 0
			LineThing.BorderColor3 = Color3.new(0,0,0)
			-- Functions
			function KeyList:SetVisible(State)
				KeyOutline.Visible = State;
			end;
			--
			function KeyList:NewKey(Name, Key, Mode)
				local KeyValue = {}
				--
				local NewValue = Instance.new('TextLabel', KeyHolder)
				--
				NewValue.Name = "NewValue"
				NewValue.Size = UDim2.new(0,0,0,15)
				NewValue.BackgroundColor3 = Color3.new(1,1,1)
				NewValue.BackgroundTransparency = 1
				NewValue.BorderSizePixel = 0
				NewValue.BorderColor3 = Color3.new(0,0,0)
				NewValue.Text = tostring(" ["..Key.."] " .. Name .. " (" .. Mode ..") ")
				NewValue.TextColor3 = Color3.new(1,1,1)
				NewValue.Font = Library.Font
				NewValue.TextSize = 12
				NewValue.AutomaticSize = Enum.AutomaticSize.X
				NewValue.TextXAlignment = Enum.TextXAlignment.Left
				NewValue.Visible = false
				--
				function KeyValue:SetVisible(State)
					NewValue.Visible = State;
				end;
				--
				function KeyValue:Update(NewName, NewKey, NewMode)
					NewValue.Text = tostring(" ["..NewName.."] " .. NewKey .. " (" .. NewMode ..") ")
				end;
				return KeyValue
			end;
			return KeyList
		end
	end

	-- // Colorpicker Element
	do
		function Library:NewPicker(name, default, defaultalpha, parent, count, flag, callback)
			-- // Instances
			local Icon = Instance.new('TextButton', parent)
			local IconInline = Instance.new('Frame', Icon)
			local ColorWindow = Instance.new('Frame', parent)
			local WindowInline = Instance.new('Frame', ColorWindow)
			local Color = Instance.new('TextButton', WindowInline)
			local Sat = Instance.new('ImageLabel', Color)
			local Val = Instance.new('ImageLabel', Color)
			local Pointer = Instance.new('Frame', Color)
			local Container = Instance.new('Frame', Color)
			local ColorOutline = Instance.new('Frame', Color)
			local UIStroke = Instance.new('UIStroke', ColorOutline)
			local Hue = Instance.new('ImageButton', Color)
			local HueOutline = Instance.new('Frame', Hue)
			local UIStroke2 = Instance.new('UIStroke', HueOutline)
			local Alpha = Instance.new('ImageButton', Color)
			local AlphaOutline = Instance.new('Frame', Alpha)
			local UIStroke3 = Instance.new('UIStroke', AlphaOutline)
			local HueSlide = Instance.new('Frame', Hue)
			local AlphaSlide = Instance.new('Frame', Alpha)
			local ModeOutline = Instance.new('Frame', parent)
			local ModeInline = Instance.new('Frame', ModeOutline)
			local UIListLayout = Instance.new('UIListLayout', ModeInline)
			local Hold = Instance.new('TextButton', ModeInline)
			local Toggle = Instance.new('TextButton', ModeInline)
			--
			Icon.Name = "Icon"
			Icon.Position = UDim2.new(1, - (count * 20) - (count * 6),0.5,0)
			Icon.Size = UDim2.new(0,20,0,10)
			Icon.BackgroundColor3 = Color3.fromRGB(45,45,45)
			Icon.BorderColor3 = Color3.fromRGB(10,10,10)
			Icon.AnchorPoint = Vector2.new(1,0.5)
			Icon.AutoButtonColor = false
			Icon.Text = ""
			--
			IconInline.Name = "IconInline"
			IconInline.Position = UDim2.new(0,1,0,1)
			IconInline.Size = UDim2.new(1,-2,1,-2)
			IconInline.BackgroundColor3 = default
			IconInline.BorderSizePixel = 0
			--
			ColorWindow.Name = "ColorWindow"
			ColorWindow.Position = UDim2.new(1,-2,1,2)
			ColorWindow.Size = UDim2.new(0,206,0,170)
			ColorWindow.BackgroundColor3 = Color3.fromRGB(45,45,45)
			ColorWindow.BorderColor3 = Color3.fromRGB(10,10,10)
			ColorWindow.AnchorPoint = Vector2.new(1,0)
			ColorWindow.ZIndex = 100
			ColorWindow.Visible = false
			--
			WindowInline.Name = "WindowInline"
			WindowInline.Position = UDim2.new(0,1,0,1)
			WindowInline.Size = UDim2.new(1,-2,1,-2)
			WindowInline.BackgroundColor3 = Color3.fromRGB(20,20,20)
			WindowInline.BorderSizePixel = 0;
			WindowInline.ZIndex = 100
			--
			Color.Name = "Color"
			Color.Position = UDim2.new(0,8,0,10)
			Color.Size = UDim2.new(0,150,0,150)
			Color.BackgroundColor3 = default
			Color.BorderColor3 = Color3.new(0,0,0)
			Color.Text = ""
			Color.TextColor3 = Color3.new(0,0,0)
			Color.AutoButtonColor = false
			Color.Font = Enum.Font.SourceSans
			Color.TextSize = 14
            Color.ZIndex = 100
			--
			Sat.Name = "Sat"
			Sat.Size = UDim2.new(1,0,1,0)
			Sat.BackgroundColor3 = Color3.new(1,1,1)
			Sat.BackgroundTransparency = 1
			Sat.BorderSizePixel = 0
			Sat.BorderColor3 = Color3.new(0,0,0)
			Sat.Image = "http://www.roblox.com/asset/?id=14684562507"
            Sat.ZIndex = 100
			--
			Val.Name = "Val"
			Val.Size = UDim2.new(1,0,1,0)
			Val.BackgroundColor3 = Color3.new(1,1,1)
			Val.BackgroundTransparency = 1
			Val.BorderSizePixel = 0
			Val.BorderColor3 = Color3.new(0,0,0)
			Val.Image = "http://www.roblox.com/asset/?id=14684563800"
            Val.ZIndex = 100
			--
			Pointer.Name = "Pointer"
			Pointer.Position = UDim2.new(1,0,1,0)
			Pointer.Size = UDim2.new(0,1,0,1)
			Pointer.BackgroundColor3 = Color3.new(1,1,1)
			Pointer.BorderColor3 = Color3.new(0,0,0)
            Pointer.ZIndex = 100
			--
			Container.Name = "Container"
			Container.Position = UDim2.new(0,-2,1,5)
			Container.Size = UDim2.new(0,189,0,55)
			Container.BackgroundColor3 = Color3.new(1,1,1)
			Container.BackgroundTransparency = 1
			Container.BorderColor3 = Color3.new(0,0,0)
            Container.ZIndex = 100
			--
			ColorOutline.Name = "ColorOutline"
			ColorOutline.Position = UDim2.new(0,-1,0,-1)
			ColorOutline.Size = UDim2.new(1,2,1,2)
			ColorOutline.BackgroundColor3 = Color3.new(1,1,1)
			ColorOutline.BackgroundTransparency = 1
			ColorOutline.BorderSizePixel = 0
			ColorOutline.BorderColor3 = Color3.new(0,0,0)
            ColorOutline.ZIndex = 100
			--
			UIStroke.Color = Color3.fromRGB(45,45,45)
			--
			Hue.Name = "Hue"
			Hue.Position = UDim2.new(1,10,0,0)
			Hue.Size = UDim2.new(0,10,1,0)
			Hue.BackgroundColor3 = Color3.new(1,1,1)
			Hue.BorderColor3 = Color3.new(0,0,0)
			Hue.Image = "http://www.roblox.com/asset/?id=14684557999"
			Hue.AutoButtonColor = false
            Hue.ZIndex = 100
			--
			HueOutline.Name = "HueOutline"
			HueOutline.Position = UDim2.new(0,-1,0,-1)
			HueOutline.Size = UDim2.new(1,2,1,2)
			HueOutline.BackgroundColor3 = Color3.new(1,1,1)
			HueOutline.BackgroundTransparency = 1
			HueOutline.BorderSizePixel = 0
			HueOutline.BorderColor3 = Color3.new(0,0,0)
            HueOutline.ZIndex = 100
			--
			UIStroke2.Color = Color3.fromRGB(45,45,45)
			--
			Alpha.Name = "Alpha"
			Alpha.Position = UDim2.new(1,30,0,0)
			Alpha.Size = UDim2.new(0,10,1,0)
			Alpha.BackgroundColor3 = Color3.new(1,1,1)
			Alpha.BorderColor3 = Color3.new(0,0,0)
			Alpha.Image = "http://www.roblox.com/asset/?id=14684560169"
			Alpha.AutoButtonColor = false
            Alpha.ZIndex = 100
			--
			AlphaOutline.Name = "AlphaOutline"
			AlphaOutline.Position = UDim2.new(0,-1,0,-1)
			AlphaOutline.Size = UDim2.new(1,2,1,2)
			AlphaOutline.BackgroundColor3 = Color3.new(1,1,1)
			AlphaOutline.BackgroundTransparency = 1
			AlphaOutline.BorderSizePixel = 0
			AlphaOutline.BorderColor3 = Color3.new(0,0,0)
            AlphaOutline.ZIndex = 100
			--
			UIStroke3.Color = Color3.fromRGB(45,45,45)
			--
			HueSlide.Name = "HueSlide"
			HueSlide.Size = UDim2.new(1,0,0,3)
			HueSlide.BackgroundColor3 = Color3.new(1,1,1)
			HueSlide.BorderColor3 = Color3.new(0,0,0)
			--
			AlphaSlide.Name = "AlphaSlide"
			AlphaSlide.Size = UDim2.new(1,0,0,3)
			AlphaSlide.BackgroundColor3 = Color3.new(1,1,1)
			AlphaSlide.BorderColor3 = Color3.new(0,0,0)
            AlphaSlide.ZIndex = 100
			--
			ModeOutline.Name = "ModeOutline"
			ModeOutline.Position = UDim2.new(1,65,0.5,0)
			ModeOutline.Size = UDim2.new(0,60,0,12)
			ModeOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			ModeOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			ModeOutline.AnchorPoint = Vector2.new(1,0.5)
			ModeOutline.AutomaticSize = Enum.AutomaticSize.Y
			ModeOutline.Visible = false
            ModeOutline.ZIndex = 100
			--
			ModeInline.Name = "ModeInline"
			ModeInline.Position = UDim2.new(0,1,0,1)
			ModeInline.Size = UDim2.new(1,-2,1,-2)
			ModeInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			ModeInline.BorderSizePixel = 0
			ModeInline.BorderColor3 = Color3.new(0,0,0)
            ModeInline.ZIndex = 100
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			--
			Hold.Name = "Hold"
			Hold.Size = UDim2.new(1,0,0,15)
			Hold.BackgroundColor3 = Color3.new(1,1,1)
			Hold.BackgroundTransparency = 1
			Hold.BorderSizePixel = 0
			Hold.BorderColor3 = Color3.new(0,0,0)
			Hold.Text = "Copy"
			Hold.TextColor3 = Color3.fromRGB(145,145,145)
			Hold.AutoButtonColor = false
			Hold.Font = Library.Font
			Hold.TextSize = Library.FontSize
			Hold.TextStrokeTransparency = 0
            Hold.ZIndex = 100
			--
			Toggle.Name = "Toggle"
			Toggle.Size = UDim2.new(1,0,0,15)
			Toggle.BackgroundColor3 = Color3.new(1,1,1)
			Toggle.BackgroundTransparency = 1
			Toggle.BorderSizePixel = 0
			Toggle.BorderColor3 = Color3.new(0,0,0)
			Toggle.Text = "Paste"
			Toggle.TextColor3 = Color3.fromRGB(145,145,145)
			Toggle.AutoButtonColor = false
			Toggle.Font = Library.Font
			Toggle.TextSize = Library.FontSize
			Toggle.TextStrokeTransparency = 0
            Toggle.ZIndex = 100

			Library:Connection(Icon.MouseEnter, function()
				Icon.BorderColor3 = Library.Accent
			end)
			--
			Library:Connection(Icon.MouseLeave, function()
				Icon.BorderColor3 = Color3.fromRGB(10,10,10)
			end)

			-- // Connections
			local mouseover = false
			local hue, sat, val = default:ToHSV()
			local hsv = default:ToHSV()
			local alpha = defaultalpha
			local oldcolor = hsv
			local slidingsaturation = false
			local slidinghue = false
			local slidingalpha = false

			local function update()
				local real_pos = game:GetService("UserInputService"):GetMouseLocation()
				local mouse_position = Vector2.new(real_pos.X, real_pos.Y - 40)
				local relative_palette = (mouse_position - Color.AbsolutePosition)
				local relative_hue     = (mouse_position - Hue.AbsolutePosition)
				local relative_opacity = (mouse_position - Alpha.AbsolutePosition)
				--
				if slidingsaturation then
					sat = math.clamp(1 - relative_palette.X / Color.AbsoluteSize.X, 0, 1)
					val = math.clamp(1 - relative_palette.Y / Color.AbsoluteSize.Y, 0, 1)
				elseif slidinghue then
					hue = math.clamp(relative_hue.Y / Hue.AbsoluteSize.Y, 0, 1)
				elseif slidingalpha then
					alpha = math.clamp(relative_opacity.Y / Alpha.AbsoluteSize.Y, 0, 1)
				end

				hsv = Color3.fromHSV(hue, sat, val)
				Pointer.Position = UDim2.new(math.clamp(1 - sat, 0.005, 0.995), 0, math.clamp(1 - val, 0.005, 0.995), 0)
				Color.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
				Alpha.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
				IconInline.BackgroundColor3 = hsv

				HueSlide.Position = UDim2.new(0,0,math.clamp(hue, 0.005, 0.995),0)
				AlphaSlide.Position = UDim2.new(0,0,math.clamp(alpha, 0.005, 0.995),0)

				if flag then
					Library.Flags[flag] = Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha)
				end

				callback(Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha))
			end

			local function set(color, a)
				if type(color) == "table" then
					a = color[4]
					color = Color3.fromHSV(color[1], color[2], color[3])
				end
				if type(color) == "string" then
					color = Color3.fromHex(color)
				end

				local oldcolor = hsv
				local oldalpha = alpha

				hue, sat, val = color:ToHSV()
				alpha = a or 1
				hsv = Color3.fromHSV(hue, sat, val)

				if hsv ~= oldcolor then
					IconInline.BackgroundColor3 = hsv
					Color.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
					Pointer.Position = UDim2.new(math.clamp(1 - sat, 0.005, 0.995), 0, math.clamp(1 - val, 0.005, 0.995), 0)
					Alpha.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
					HueSlide.Position = UDim2.new(0,0,math.clamp(hue, 0.005, 0.995),0)
					AlphaSlide.Position = UDim2.new(0,0,math.clamp(alpha, 0.005, 0.995),0)

					if flag then
						Library.Flags[flag] = Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha)
					end

					callback(Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha))
				end
			end

			Flags[flag] = set

			set(default, defaultalpha)

			Sat.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidingsaturation = true
					update()
				end
			end)

			Sat.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidingsaturation = false
					update()
				end
			end)

			Hue.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidinghue = true
					update()
				end
			end)

			Hue.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidinghue = false
					update()
				end
			end)

			Alpha.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidingalpha = true
					update()
				end
			end)

			Alpha.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidingalpha = false
					update()
				end
			end)

			Library:Connection(game:GetService("UserInputService").InputChanged, function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if slidingalpha then
						update()
					end

					if slidinghue then
						update()
					end

					if slidingsaturation then
						update()
					end
				end
			end)

			Icon.MouseButton1Down:Connect(function()
				ColorWindow.Visible = not ColorWindow.Visible
				parent.ZIndex = ColorWindow.Visible and 5 or 1

				if slidinghue then
					slidinghue = false
				end

				if slidingsaturation then
					slidingsaturation = false
				end

				if slidingalpha then
					slidingalpha = false
				end
			end)
			
			Library:Connection(Icon.MouseButton2Down, function()
				ModeOutline.Visible = not ModeOutline.Visible
			end)
			--
			Library:Connection(Hold.MouseButton1Down, function()
				Library.CopiedColor = hsv
				Library.CopiedAlpha = alpha
			end)
			--
			Library:Connection(Toggle.MouseButton1Down, function()
				set(Library.CopiedColor or Color3.new(1,1,1), Library.CopiedAlpha or 0)
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if ModeOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Library:IsMouseOverFrame(ModeOutline) then
						ModeOutline.Visible = false
					end
				end
			end)

			local colorpickertypes = {}

			function colorpickertypes:Set(color, newalpha)
				set(color, newalpha)
			end

			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if ColorWindow.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Library:IsMouseOverFrame(ColorWindow) and not Library:IsMouseOverFrame(Icon) then
						ColorWindow.Visible = false
						parent.ZIndex = 1
					end
				end
			end)

			return colorpickertypes, ColorWindow
		end
	end

	-- // Library Functions
	do
		local Pages = Library.Pages;
		local Sections = Library.Sections;
		--
		function Library:Window(Options)
			local Window = {
				Pages = {};
				Sections = {};
				Elements = {};
				Dragging = { false, UDim2.new(0, 0, 0, 0) };
				Size = Options.Size or Options.size or UDim2.new(0, 550,0, 600);
			};
			--
			local ScreenGui = Instance.new('ScreenGui', game.CoreGui)
			local Outline = Instance.new('Frame', ScreenGui)
			local Inline = Instance.new('Frame', Outline)
			local Accent = Instance.new('Frame', Inline)
			local HolderOutline = Instance.new('Frame', Inline)
			local HolderInline = Instance.new('Frame', HolderOutline)
			local Tabs = Instance.new('Frame', HolderInline)
			local UIListLayout = Instance.new('UIListLayout', Tabs)
			local DragButton = Instance.new('TextButton', Outline)
			local KeybindList = Library:KeybindList()
			--
			ScreenGui.DisplayOrder = 2
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(0.5,0,0.5,0)
			Outline.Size = Window.Size
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			Outline.AnchorPoint = Vector2.new(0.5,0.5)
			Library.Holder = Outline
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Accent.Name = "Accent"
			Accent.Size = UDim2.new(1,0,0,1)
			Accent.BackgroundColor3 = Library.Accent
			Accent.BorderSizePixel = 0
			Accent.BorderColor3 = Color3.new(0,0,0)
			table.insert(Library.ThemeObjects, Accent)
			--
			HolderOutline.Name = "HolderOutline"
			HolderOutline.Position = UDim2.new(0,7,0,11)
			HolderOutline.Size = UDim2.new(1,-14,1,-18)
			HolderOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			HolderOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			--
			HolderInline.Name = "HolderInline"
			HolderInline.Position = UDim2.new(0,1,0,1)
			HolderInline.Size = UDim2.new(1,-2,1,-2)
			HolderInline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
			HolderInline.BorderSizePixel = 0
			HolderInline.BorderColor3 = Color3.new(0,0,0)
			--
			Tabs.Name = "Tabs"
			Tabs.Size = UDim2.new(1,0,0,22)
			Tabs.BackgroundColor3 = Color3.new(1,1,1)
			Tabs.BackgroundTransparency = 1
			Tabs.BorderSizePixel = 0
			Tabs.BorderColor3 = Color3.new(0,0,0)
			--
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			--
			DragButton.Name = "DragButton"
			DragButton.Size = UDim2.new(1,0,0,10)
			DragButton.BackgroundColor3 = Color3.new(1,1,1)
			DragButton.BackgroundTransparency = 1
			DragButton.BorderSizePixel = 0
			DragButton.BorderColor3 = Color3.new(0,0,0)
			DragButton.Text = ""
			DragButton.TextColor3 = Color3.new(0,0,0)
			DragButton.AutoButtonColor = false
			DragButton.Font = Enum.Font.SourceSans
			DragButton.TextSize = 14
			
			local WOutline = Instance.new('Frame', ScreenGui)
            local WInline = Instance.new('Frame', WOutline)
            local WAccent = Instance.new('Frame', WInline)
            local WText1 = Instance.new('TextLabel', WInline)
            local WText2 = Instance.new('TextLabel', WInline)
            local WTextGradient = Instance.new('UIGradient', WText2)
            local WText3 = Instance.new('TextLabel', WInline)
            
            WOutline.Name = "Outline"
            WOutline.Position = UDim2.new(0.04,0,0.04,0)
            WOutline.Size = UDim2.new(0,220,0,20)
            WOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            WOutline.BorderSizePixel = 1
            WOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            WOutline.AnchorPoint = Vector2.new(0.04,0.04)
            WOutline.Visible = false
	        Library.Watermark = WOutline
            WInline.Name = "Inline"
            WInline.Position = UDim2.new(0,1,0,1)
            WInline.Size = UDim2.new(1,-2,1,-2)
            WInline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
            WInline.BorderSizePixel = 0
            WInline.BorderColor3 = Color3.new(0,0,0)
            WAccent.Name = "Accent"
            WAccent.Size = UDim2.new(1,0,0,1)
            WAccent.BackgroundColor3 = Color3.new(0.3333,0.6667,1)
            WAccent.BorderSizePixel = 0
            WAccent.BorderColor3 = Color3.new(0,0,0)
            WText1.Name = "Text1"
            WText1.Position = UDim2.new(0,4,0,0)
            WText1.Size = UDim2.new(1,-8,1,0)
            WText1.BackgroundColor3 = Color3.new(1,1,1)
            WText1.BackgroundTransparency = 1
            WText1.BorderSizePixel = 0
            WText1.BorderColor3 = Color3.new(0,0,0)
            WText1.Text = "xyn | portal"
            WText1.TextColor3 = Color3.new(1,1,1)
            WText1.Font = Library.Font
            WText1.TextSize = 12
            WText1.TextXAlignment = Enum.TextXAlignment.Left
            WText1.TextStrokeTransparency = 0
            WText2.Name = "Text2"
            WText2.Position = UDim2.new(0,93,0,0)
            WText2.Size = UDim2.new(1,-8,1,0)
            WText2.BackgroundColor3 = Color3.new(1,1,1)
            WText2.BackgroundTransparency = 1
            WText2.BorderSizePixel = 0
            WText2.BorderColor3 = Color3.new(0,0,0)
            WText2.Text = "BETA"
            WText2.TextColor3 = Color3.new(1,1,1)
            WText2.Font = Library.Font
            WText2.TextSize = 12
            WText2.TextXAlignment = Enum.TextXAlignment.Left
            WText2.TextStrokeTransparency = 0
            WTextGradient.Name = "TextGradient"
            WTextGradient.Rotation = 0
            WText3.Name = "Text3"
            WText3.Position = UDim2.new(0,4,0,0)
            WText3.Size = UDim2.new(1,-8,1,0)
            WText3.BackgroundColor3 = Color3.new(1,1,1)
            WText3.BackgroundTransparency = 1
            WText3.BorderSizePixel = 0
            WText3.BorderColor3 = Color3.new(0,0,0)
            WText3.Text = "Bad Business"
            WText3.TextColor3 = Color3.new(1,1,1)
            WText3.Font = Library.Font
            WText3.TextSize = 12
            WText3.TextXAlignment = Enum.TextXAlignment.Right
            WText3.TextStrokeTransparency = 0
			

 
 

           
            
			
			-- // Elements
			Window.Elements = {
				TabHolder = Tabs,
				Holder = HolderInline
			}

			-- // Dragging
			Library:Connection(DragButton.MouseButton1Down, function()
				local Location = game:GetService("UserInputService"):GetMouseLocation()
				Window.Dragging[1] = true
				Window.Dragging[2] = UDim2.new(0, Location.X - Outline.AbsolutePosition.X, 0, Location.Y - Outline.AbsolutePosition.Y)
			end)
			Library:Connection(game:GetService("UserInputService").InputEnded, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and Window.Dragging[1] then
					local Location = game:GetService("UserInputService"):GetMouseLocation()
					Window.Dragging[1] = false
					Window.Dragging[2] = UDim2.new(0, 0, 0, 0)
				end
			end)
			Library:Connection(game:GetService("UserInputService").InputChanged, function(Input)
				local Location = game:GetService("UserInputService"):GetMouseLocation()
				local ActualLocation = nil

				-- Dragging
				if Window.Dragging[1] then
					Outline.Position = UDim2.new(
						0,
						Location.X - Window.Dragging[2].X.Offset + (Outline.Size.X.Offset * Outline.AnchorPoint.X),
						0,
						Location.Y - Window.Dragging[2].Y.Offset + (Outline.Size.Y.Offset * Outline.AnchorPoint.Y)
					)
				end
			end)
			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if Input.KeyCode == Library.UIKey then
					Library:SetOpen(not Library.Open)
				end
			end)

			-- // Functions
			function Window:UpdateTabs()
				for Index, Page in pairs(Window.Pages) do
					Page.Elements.Button.Size = UDim2.new(1/#Window.Pages,0,1,0)
					Page:Turn(Page.Open)
				end
			end

			-- // Returns
			Library.Holder = Outline
			return setmetatable(Window, Library)
		end
		--
		function Library:Page(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Page = {
				Name = Properties.Name or "Page",
				Window = self,
				Open = false,
				Sections = {},
				Elements = {},
                Weapons = {},
                Icons = Properties.Weapons or Properties.weapons or false,
			}
			--
			local TabButton = Instance.new('TextButton', Page.Window.Elements.TabHolder)
			local TabAccent = Instance.new('Frame', TabButton)
			local TabLine = Instance.new('Frame', TabButton)
            local WeaponOutline = Instance.new("Frame", Page.Window.Elements.Holder)
            local WeaponInline = Instance.new("Frame", WeaponOutline)
            local UIListLayout3 = Instance.new("UIListLayout", WeaponInline)
            local Left = Instance.new('Frame', Page.Window.Elements.Holder)
            local Right = Instance.new('Frame', Page.Window.Elements.Holder)
            local UIListLayout = Instance.new('UIListLayout', Left)
            local UIListLayout_2 = Instance.new('UIListLayout', Right)
            Left.Name = "Left"
            Left.Position = UDim2.new(0,5,0,35)
            Left.Size = UDim2.new(0.485,-3,1,-40)
            Left.BackgroundColor3 = Color3.new(1,1,1)
            Left.BorderSizePixel = 0
            Left.BackgroundTransparency = 1
            Left.BorderColor3 = Color3.new(0,0,0)
            Left.Visible = false
            Left.ZIndex = 3
            --
            Right.Name = "Right"
            Right.Position = UDim2.new(1,-5,0,35)
            Right.Size = UDim2.new(0.485,-3,1,-40)
            Right.BackgroundColor3 = Color3.new(1,1,1)
            Right.BorderSizePixel = 0
            Right.BorderColor3 = Color3.new(0,0,0)
            Right.AnchorPoint = Vector2.new(1,0)
            Right.Visible = false
            Right.BackgroundTransparency = 1
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0,12)
            --
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0,12)
			--
			TabButton.Name = "TabButton"
			TabButton.Size = UDim2.new(0.25,0,1,0)
			TabButton.BackgroundColor3 = Color3.new(1,1,1)
			TabButton.BackgroundTransparency = 1
			TabButton.BorderSizePixel = 0
			TabButton.BorderColor3 = Color3.new(0,0,0)
			TabButton.Text = Page.Name
			TabButton.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			TabButton.AutoButtonColor = false
			TabButton.Font = Library.Font
			TabButton.TextSize = Library.FontSize
			TabButton.TextStrokeTransparency = 0
			TabButton.LineHeight = 1.1
			--
			TabAccent.Name = "TabAccent"
			TabAccent.Size = UDim2.new(1,0,0,1)
			TabAccent.BackgroundColor3 = Library.Accent
			TabAccent.BorderSizePixel = 0
			TabAccent.BorderColor3 = Color3.new(0,0,0)
			TabAccent.Visible = false
			table.insert(Library.ThemeObjects, TabAccent)
			--
			TabLine.Name = "TabLine"
			TabLine.Position = UDim2.new(0,0,1,-1)
			TabLine.Size = UDim2.new(1,0,0,1)
			TabLine.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			TabLine.BorderSizePixel = 0
			TabLine.BorderColor3 = Color3.new(0,0,0)

            WeaponOutline.Name = "WeaponOutline"
            WeaponOutline.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            WeaponOutline.BorderColor3 = Color3.fromRGB(10, 10, 10)
            WeaponOutline.Position = UDim2.new(0, 5, 0, 25)
            WeaponOutline.Size = UDim2.new(1, -10, 0, 40)
            WeaponOutline.Visible = false
            
            WeaponInline.Name = "WeaponInline"
            WeaponInline.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            WeaponInline.BorderColor3 = Color3.fromRGB(0, 0, 0)
            WeaponInline.BorderSizePixel = 0
            WeaponInline.Position = UDim2.new(0, 1, 0, 1)
            WeaponInline.Size = UDim2.new(1, -2, 1, -2)
            
            UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
			
			function Page:Turn(bool)
				Page.Open = bool
				if not Page.Icons then
                    Left.Visible = Page.Open
				    Right.Visible = Page.Open
                else
                    WeaponOutline.Visible = Page.Open
                    for Index, Weapon in pairs(Page.Weapons) do
                        Weapon:Turn(Weapon.Open)
                    end
                end
				TabAccent.Visible = Page.Open
				TabLine.Visible = not Page.Open
				TabButton.TextColor3 = Page.Open and Color3.fromRGB(255,255,255) or Color3.fromRGB(145,145,145)
			end
			--
			Library:Connection(TabButton.MouseButton1Down, function()
				if not Page.Open then
					Page:Turn(true)
					for _, Pages in pairs(Page.Window.Pages) do
						if Pages.Open and Pages ~= Page then
							Pages:Turn(false)
						end
					end
				end
			end)
			--
			Library:Connection(TabButton.MouseEnter, function() 
				if not Page.Open then
					TabButton.TextColor3 = Library.Accent
				end
			end)
			--
			Library:Connection(TabButton.MouseLeave, function() 
				if not Page.Open then
					TabButton.TextColor3 = Color3.fromRGB(145,145,145)
				end
			end)

            -- // Functions
			function Page:UpdateWeapons()
				for Index, Weapon in pairs(Page.Weapons) do
					Weapon.Elements.Button.Size = UDim2.new(1/#Page.Weapons,0,1,0)
					Weapon:Turn(Weapon.Open)
				end
			end

			-- // Elements
			Page.Elements = {
                Left = Page.Icons and nil or Left,
				Right = Page.Icons and nil or Right,
				Button = TabButton,
                WeaponOutline = WeaponOutline,
                WeaponInline = WeaponInline,
			}

			-- // Drawings
			if #Page.Window.Pages == 0 then
				Page:Turn(true)
			end
			Page.Window.Pages[#Page.Window.Pages + 1] = Page
			Page.Window:UpdateTabs()
			return setmetatable(Page, Library.Pages)
		end
        --
        function Pages:Weapon(Properties)
            if not Properties then
				Properties = {}
			end
			--
			local Weapon = {
				Icon = Properties.Icon or Properties.icon or "rbxassetid://11127408662",
				Window = self,
				Open = false,
				Sections = {},
				Elements = {},
			}
			--
            --Weapon.Window.Elements.WeaponOutline.Visible = true

			local Left = Instance.new('Frame', Weapon.Window.Window.Elements.Holder)
			local Right = Instance.new('Frame', Weapon.Window.Window.Elements.Holder)
			local UIListLayout = Instance.new('UIListLayout', Left)
			local UIListLayout_2 = Instance.new('UIListLayout', Right)
            local New = Instance.new("ImageButton")
			--
			New.Name = "New"
            New.Parent = Weapon.Window.Elements.WeaponInline
            New.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            New.BackgroundTransparency = 1.000
            New.BorderColor3 = Color3.fromRGB(0, 0, 0)
            New.BorderSizePixel = 0
            New.Size = UDim2.new(0.200000003, 0, 1, 0)
            New.Image = Weapon.Icon
            New.ScaleType = Enum.ScaleType.Fit
			--
			Left.Name = "Left"
			Left.Position = UDim2.new(0,5,0,75)
			Left.Size = UDim2.new(0.485,-3,1, -80)
			Left.BackgroundColor3 = Color3.new(1,1,1)
			Left.BorderSizePixel = 0
			Left.BackgroundTransparency = 1
			Left.BorderColor3 = Color3.new(0,0,0)
			Left.Visible = false
			Left.ZIndex = 3
			--
			Right.Name = "Right"
			Right.Position = UDim2.new(1,-5,0,75)
			Right.Size = UDim2.new(0.485,-3,1, -80)
			Right.BackgroundColor3 = Color3.new(1,1,1)
			Right.BorderSizePixel = 0
			Right.BorderColor3 = Color3.new(0,0,0)
			Right.AnchorPoint = Vector2.new(1,0)
			Right.Visible = false
			Right.BackgroundTransparency = 1
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0,12)
			--
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0,12)
			
			function Weapon:Turn(bool)
				Weapon.Open = bool
				Left.Visible = Weapon.Open and Weapon.Window.Open
				Right.Visible = Weapon.Open and Weapon.Window.Open
				New.ImageColor3 = Weapon.Open and Color3.new(1,1,1) or Color3.fromRGB(145,145,145)
			end
			--
			Library:Connection(New.MouseButton1Down, function()
				if not Weapon.Open then
					Weapon:Turn(true)
					for _, Weapons in pairs(Weapon.Window.Weapons) do
						if Weapons.Open and Weapons ~= Weapon then
							Weapons:Turn(false)
						end
					end
				end
			end)
			--

			-- // Elements
			Weapon.Elements = {
				Left = Left,
				Right = Right,
				Button = New
			}

			-- // Drawings
			if #Weapon.Window.Weapons == 0 then
				Weapon:Turn(true)
			end
			Weapon.Window.Weapons[#Weapon.Window.Weapons + 1] = Weapon
			Weapon.Window:UpdateWeapons()
			return setmetatable(Weapon, Library.Pages)
        end
		--
		function Pages:Section(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Section = {
				Name = Properties.Name or "Section",
				Page = self,
				Side = (Properties.side or Properties.Side or "left"):lower(),
				ZIndex = Properties.ZIndex or 1, -- Idfk why
				Elements = {},
				Content = {},
			}
			--
			local SectionOutline = Instance.new('Frame', Section.Side == "left" and Section.Page.Elements.Left or Section.Side == "right" and Section.Page.Elements.Right)
			local SectionInline = Instance.new('Frame', SectionOutline)
			local Container = Instance.new('Frame', SectionInline)
			local UIListLayout = Instance.new('UIListLayout', Container)
			local Space = Instance.new('Frame', Container)
			local SectionAccent = Instance.new('Frame', SectionInline)
			local Title = Instance.new('TextLabel', SectionOutline)
			local TextBorder = Instance.new('Frame', SectionOutline)	
			--
			SectionOutline.Name = "SectionOutline"
			SectionOutline.Size = UDim2.new(1,0,0,20)
			SectionOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			SectionOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			SectionOutline.AutomaticSize = Enum.AutomaticSize.Y
			SectionOutline.ZIndex = Section.ZIndex
			--
			
			--
			SectionInline.Name = "SectionInline"
			SectionInline.Position = UDim2.new(0,1,0,1)
			SectionInline.Size = UDim2.new(1,-2,1,-2)
			SectionInline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
			SectionInline.BorderSizePixel = 0
			SectionInline.BorderColor3 = Color3.new(0,0,0)
			--
			Container.Name = "Container"
			Container.Position = UDim2.new(0,7,0,10)
			Container.Size = UDim2.new(1,-14,1,-10)
			Container.BackgroundColor3 = Color3.new(1,1,1)
			Container.BackgroundTransparency = 1
			Container.BorderSizePixel = 0
			Container.BorderColor3 = Color3.new(0,0,0)
			Container.AutomaticSize = Enum.AutomaticSize.Y
			--
			Space.Name = "Space"
			Space.Position = UDim2.new(0,0,1,0)
			Space.Size = UDim2.new(1,0,0,1)
			Space.BackgroundColor3 = Color3.new(1,1,1)
			Space.BackgroundTransparency = 1
			Space.BorderSizePixel = 0
			Space.BorderColor3 = Color3.new(0,0,0)
			Space.LayoutOrder = 1000
			--
			SectionAccent.Name = "SectionAccent"
			SectionAccent.Size = UDim2.new(1,0,0,1)
			SectionAccent.BackgroundColor3 = Library.Accent
			SectionAccent.BorderSizePixel = 0
			SectionAccent.BorderColor3 = Color3.new(0,0,0)
			table.insert(Library.ThemeObjects, SectionAccent)
			table.insert(Library.ThemeObjects, SectionAccent)
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,10,0,-8)
			Title.Size = UDim2.new(0,100,0,16)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.TextColor3 = Color3.new(1,1,1)
			Title.Font = Library.Font
			Title.TextSize = Library.FontSize
			Title.ZIndex = 3
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Text = Section.Name
			Title.TextStrokeTransparency = 0
			--
			TextBorder.Name = "TextBorder"
			TextBorder.Position = UDim2.new(0,6,0,-2)
			TextBorder.Size = UDim2.new(0,Title.TextBounds.X + 8,0,4)
			TextBorder.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
			TextBorder.BorderSizePixel = 0
			TextBorder.BorderColor3 = Color3.new(0,0,0)
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0,10)
			
			-- // Elements
			Section.Elements = {
				SectionContent = Container;
				SectionHolder = SectionOutline;
			}

			-- // Returning
			Section.Page.Sections[#Section.Page.Sections + 1] = Section
			wait(0.01)
			TextBorder.Size = UDim2.new(0,Title.TextBounds.X + 8,0,4)
			return setmetatable(Section, Library.Sections)
		end
		--
		function Sections:Toggle(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Toggle = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Risk = Properties.Risk or false,
				Name = Properties.Name or "Toggle",
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or false
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Toggled = false,
				Colorpickers = 0,
			}
			--
			local NewToggle = Instance.new('TextButton', Toggle.Section.Elements.SectionContent)
			local Outline = Instance.new('Frame', NewToggle)
			local Inline = Instance.new('Frame', Outline)
			local Title = Instance.new('TextLabel', NewToggle)
			--
			NewToggle.Name = "NewToggle"
			NewToggle.Size = UDim2.new(1,0,0,10)
			NewToggle.BackgroundColor3 = Color3.new(1,1,1)
			NewToggle.BackgroundTransparency = 1
			NewToggle.BorderSizePixel = 0
			NewToggle.BorderColor3 = Color3.new(0,0,0)
			NewToggle.Text = ""
			NewToggle.TextColor3 = Color3.new(0,0,0)
			NewToggle.AutoButtonColor = false
			NewToggle.Font = Enum.Font.SourceSans
			NewToggle.TextSize = 14
			--
			Outline.Name = "Outline"
			Outline.Size = UDim2.new(0,10,0,10)
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,15,0,0)
			Title.Size = UDim2.new(1,0,0,10)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.TextColor3 = Toggle.Risk and Color3.fromRGB(158, 158, 24) or Color3.new(0.5686,0.5686,0.5686)
			Title.Font = Library.Font
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Text = Toggle.Name
			Title.TextStrokeTransparency = 0
			
			-- // Functions
			local function SetState()
				Toggle.Toggled = not Toggle.Toggled
				if Toggle.Toggled then
					table.insert(Library.ThemeObjects, Inline)
					Inline.BackgroundColor3 = Library.Accent
					if Toggle.Risk then
						Title.TextColor3 = Color3.fromRGB(227, 227, 34)
					else
						Title.TextColor3 = Color3.fromRGB(255,255,255)
					end
				else
					table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Inline))
					Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
					if Toggle.Risk then
						Title.TextColor3 = Color3.fromRGB(158, 158, 24)
					else
						Title.TextColor3 = Color3.fromRGB(145,145,145)
					end
				end
				Library.Flags[Toggle.Flag] = Toggle.Toggled
				Toggle.Callback(Toggle.Toggled)
			end
			--
			Library:Connection(NewToggle.MouseButton1Down, SetState)
			Library:Connection(NewToggle.MouseEnter, function()
				if not Toggle.Toggled then
					table.insert(Library.ThemeObjects, Title)
					Title.TextColor3 = Library.Accent
				end
			end)
			--
			Library:Connection(NewToggle.MouseLeave, function()
				if not Toggle.Toggled then
				    table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
					if Toggle.Risk then
						Title.TextColor3 = Color3.fromRGB(158, 158, 24)
					else
						Title.TextColor3 = Color3.fromRGB(145,145,145)
					end
				else
					table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
				end
			end)
			
			function Toggle:Keybind(Properties)
				local Properties = Properties or {}
				local Keybind = {
					Section = self,
					State = (
						Properties.state
							or Properties.State
							or Properties.def
							or Properties.Def
							or Properties.default
							or Properties.Default
							or nil
					),
					Mode = (Properties.mode or Properties.Mode or "Toggle"),
					Callback = (
						Properties.callback
							or Properties.Callback
							or Properties.callBack
							or Properties.CallBack
							or function() end
					),
					Flag = (
						Properties.flag
							or Properties.Flag
							or Properties.pointer
							or Properties.Pointer
							or Library.NextFlag()
					),
					Binding = nil,
				}
				local Key
				local State = false
				--
				local Outline = Instance.new('TextButton', NewToggle)
				local Inline = Instance.new('Frame', Outline)
				local Value = Instance.new('TextLabel', Inline)
				local ModeOutline = Instance.new('Frame', NewToggle)
				local ModeInline = Instance.new('Frame', ModeOutline)
				local UIListLayout = Instance.new('UIListLayout', ModeInline)
				local Hold = Instance.new('TextButton', ModeInline)
				local Toggle = Instance.new('TextButton', ModeInline)
				local Always = Instance.new('TextButton', ModeInline)
				local ListValue = Library.KeyList:NewKey(tostring(Keybind.State):gsub("Enum.KeyCode.", ""), Title.Text, Keybind.Mode)
				--
				Outline.Name = "Outline"
				Outline.Position = UDim2.new(1,0,0.5,0)
				Outline.Size = UDim2.new(0,40,0,12)
				Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
				Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
				Outline.AnchorPoint = Vector2.new(1,0.5)
				Outline.Text = ""
				Outline.AutoButtonColor = false
				--
				Inline.Name = "Inline"
				Inline.Position = UDim2.new(0,1,0,1)
				Inline.Size = UDim2.new(1,-2,1,-2)
				Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
				Inline.BorderSizePixel = 0
				Inline.BorderColor3 = Color3.new(0,0,0)
				--
				Value.Name = "Value"
				Value.Size = UDim2.new(1,0,1,0)
				Value.BackgroundColor3 = Color3.new(1,1,1)
				Value.BackgroundTransparency = 1
				Value.BorderSizePixel = 0
				Value.BorderColor3 = Color3.new(0,0,0)
				Value.Text = "MB2"
				Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
				Value.Font = Library.Font
				Value.TextSize = Library.FontSize
				Value.TextStrokeTransparency = 0
				--
				ModeOutline.Name = "ModeOutline"
				ModeOutline.Position = UDim2.new(1,65,0.5,0)
				ModeOutline.Size = UDim2.new(0,60,0,12)
				ModeOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
				ModeOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
				ModeOutline.AnchorPoint = Vector2.new(1,0.5)
				ModeOutline.AutomaticSize = Enum.AutomaticSize.Y
				ModeOutline.Visible = false
				--
				ModeInline.Name = "ModeInline"
				ModeInline.Position = UDim2.new(0,1,0,1)
				ModeInline.Size = UDim2.new(1,-2,1,-2)
				ModeInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
				ModeInline.BorderSizePixel = 0
				ModeInline.BorderColor3 = Color3.new(0,0,0)
				--
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				--
				Hold.Name = "Hold"
				Hold.Size = UDim2.new(1,0,0,15)
				Hold.BackgroundColor3 = Color3.new(1,1,1)
				Hold.BackgroundTransparency = 1
				Hold.BorderSizePixel = 0
				Hold.BorderColor3 = Color3.new(0,0,0)
				Hold.Text = "Hold"
				Hold.TextColor3 = Keybind.Mode == "Hold" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
				Hold.AutoButtonColor = false
				Hold.Font = Library.Font
				Hold.TextSize = Library.FontSize
				Hold.TextStrokeTransparency = 0
				--
				Toggle.Name = "Toggle"
				Toggle.Size = UDim2.new(1,0,0,15)
				Toggle.BackgroundColor3 = Color3.new(1,1,1)
				Toggle.BackgroundTransparency = 1
				Toggle.BorderSizePixel = 0
				Toggle.BorderColor3 = Color3.new(0,0,0)
				Toggle.Text = "Toggle"
				Toggle.TextColor3 = Keybind.Mode == "Toggle" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
				Toggle.AutoButtonColor = false
				Toggle.Font = Library.Font
				Toggle.TextSize = Library.FontSize
				Toggle.TextStrokeTransparency = 0
				--
				Always.Name = "Always"
				Always.Size = UDim2.new(1,0,0,15)
				Always.BackgroundColor3 = Color3.new(1,1,1)
				Always.BackgroundTransparency = 1
				Always.BorderSizePixel = 0
				Always.BorderColor3 = Color3.new(0,0,0)
				Always.Text = "Always"
				Always.TextColor3 = Keybind.Mode == "Always" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
				Always.AutoButtonColor = false
				Always.Font = Library.Font
				Always.TextSize = Library.FontSize
				Always.TextStrokeTransparency = 0

				-- // Functions
				local function set(newkey)
					if string.find(tostring(newkey), "Enum") then
						if c then
							c:Disconnect()
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = false
							end
							Keybind.Callback(false)
						end
						if tostring(newkey):find("Enum.KeyCode.") then
							newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
						elseif tostring(newkey):find("Enum.UserInputType.") then
							newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
						end
						if newkey == Enum.KeyCode.Backspace then
							Key = nil

							local text = "None"

							Value.Text = text
							ListValue:Update(text, Title.Text, Keybind.Mode)
						elseif newkey ~= nil then
							Key = newkey

							local text = (Library.Keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))

							Value.Text = text
							ListValue:Update(text, Title.Text, Keybind.Mode)
						end

						Library.Flags[Keybind.Flag .. "_KEY"] = newkey
					elseif table.find({ "Always", "Toggle", "Hold" }, newkey) then
						Library.Flags[Keybind.Flag .. "_KEY STATE"] = newkey
						Keybind.Mode = newkey
						ListValue:Update((Library.Keys[Key] or tostring(Key):gsub("Enum.KeyCode.", "")), Title.Text, Keybind.Mode)
						if Keybind.Mode == "Always" then
							State = true
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = State
							end
							Keybind.Callback(true)
							ListValue:SetVisible(true)
						end
					else
						State = newkey
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = newkey
						end
						Keybind.Callback(newkey)
					end
				end
				--
				set(Keybind.State)
				set(Keybind.Mode)
				Outline.MouseButton1Click:Connect(function()
					if not Keybind.Binding then

						Value.Text = "..."

						Keybind.Binding = Library:Connection(
							game:GetService("UserInputService").InputBegan,
							function(input, gpe)
								set(
									input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode
										or input.UserInputType
								)
								Library:Disconnect(Keybind.Binding)
								task.wait()
								Keybind.Binding = nil
							end
						)
					end
				end)
				--
				Library:Connection(game:GetService("UserInputService").InputBegan, function(inp)
					if (inp.KeyCode == Key or inp.UserInputType == Key) and not Keybind.Binding then
						if Keybind.Mode == "Hold" then
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = true
							end
							c = Library:Connection(game:GetService("RunService").RenderStepped, function()
								if Keybind.Callback then
									Keybind.Callback(true)
								end
							end)
							ListValue:SetVisible(true)
						elseif Keybind.Mode == "Toggle" then
							State = not State
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = State
							end
							Keybind.Callback(State)
							ListValue:SetVisible(State)
						end
					end
				end)
				--
				Library:Connection(game:GetService("UserInputService").InputEnded, function(inp)
					if Keybind.Mode == "Hold" then
						if Key ~= "" or Key ~= nil then
							if inp.KeyCode == Key or inp.UserInputType == Key then
								if c then
									c:Disconnect()
									if Keybind.Flag then
										Library.Flags[Keybind.Flag] = false
									end
									if Keybind.Callback then
										Keybind.Callback(false)
									end
									ListValue:SetVisible(false)
								end
							end
						end
					end
				end)
				Library:Connection(Outline.MouseEnter, function()
					Outline.BorderColor3 = Library.Accent
				end)
				--
				Library:Connection(Outline.MouseLeave, function()
					Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
				end)
				--
				Library:Connection(Outline.MouseButton2Down, function()
					ModeOutline.Visible = not ModeOutline.Visible
				end)
				--
				Library:Connection(Hold.MouseButton1Down, function()
					set("Hold")
					Hold.TextColor3 = Color3.new(1,1,1)
					Toggle.TextColor3 = Color3.fromRGB(145,145,145)
					Always.TextColor3 = Color3.fromRGB(145,145,145)
				end)
				--
				Library:Connection(Toggle.MouseButton1Down, function()
					set("Toggle")
					Hold.TextColor3 = Color3.fromRGB(145,145,145)
					Toggle.TextColor3 = Color3.new(1,1,1)
					Always.TextColor3 = Color3.fromRGB(145,145,145)
				end)
				--
				Library:Connection(Always.MouseButton1Down, function()
					set("Always")
					Hold.TextColor3 = Color3.fromRGB(145,145,145)
					Toggle.TextColor3 = Color3.fromRGB(145,145,145)
					Always.TextColor3 = Color3.new(1,1,1)
				end)
				--
				Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
					if ModeOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if not Library:IsMouseOverFrame(ModeOutline) then
							ModeOutline.Visible = false
						end
					end
				end)
				--
				Library.Flags[Keybind.Flag .. "_KEY"] = Keybind.State
				Library.Flags[Keybind.Flag .. "_KEY STATE"] = Keybind.Mode
				Flags[Keybind.Flag] = set
				Flags[Keybind.Flag .. "_KEY"] = set
				Flags[Keybind.Flag .. "_KEY STATE"] = set
				--
				function Keybind:Set(key)
					set(key)
				end

				-- // Returning
				return Keybind
			end
			
			function Toggle:Colorpicker(Properties)
				local Properties = Properties or {}
				local Colorpicker = {
					State = (
						Properties.state
							or Properties.State
							or Properties.def
							or Properties.Def
							or Properties.default
							or Properties.Default
							or Color3.fromRGB(255, 0, 0)
					),
					Alpha = (
						Properties.alpha
							or Properties.Alpha
							or Properties.transparency
							or Properties.Transparency
							or 1
					),
					Callback = (
						Properties.callback
							or Properties.Callback
							or Properties.callBack
							or Properties.CallBack
							or function() end
					),
					Flag = (
						Properties.flag
							or Properties.Flag
							or Properties.pointer
							or Properties.Pointer
							or Library.NextFlag()
					),
				}
				-- // Functions
				Toggle.Colorpickers = Toggle.Colorpickers + 1
				local colorpickertypes = Library:NewPicker(
					"",
					Colorpicker.State,
					Colorpicker.Alpha,
					NewToggle,
					Toggle.Colorpickers - 1,
					Colorpicker.Flag,
					Colorpicker.Callback
				)

				function Colorpicker:Set(color)
					colorpickertypes:set(color)
				end

				-- // Returning
				return Colorpicker
			end
			
			-- // Misc Functions
			function Toggle.Set(bool)
				bool = type(bool) == "boolean" and bool or false
				if Toggle.Toggled ~= bool then
					SetState()
				end
			end
			Toggle.Set(Toggle.State)
			Library.Flags[Toggle.Flag] = Toggle.State
			Flags[Toggle.Flag] = Toggle.Set

			-- // Returning
			return Toggle
		end
		--
		function Sections:Slider(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Slider = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = Properties.Name or nil,
				Min = (Properties.min or Properties.Min or Properties.minimum or Properties.Minimum or 0),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or 10
				),
				Max = (Properties.max or Properties.Max or Properties.maximum or Properties.Maximum or 100),
				Sub = (
					Properties.suffix
						or Properties.Suffix
						or Properties.ending
						or Properties.Ending
						or Properties.prefix
						or Properties.Prefix
						or Properties.measurement
						or Properties.Measurement
						or ""
				),
				Decimals = (Properties.decimals or Properties.Decimals or 1),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Disabled = (Properties.Disabled or Properties.disable or nil),
			}
			local TextValue = ("[value]" .. Slider.Sub)
			--
			local NewSlider = Instance.new('TextButton', Slider.Section.Elements.SectionContent)
			local Outline = Instance.new('Frame', NewSlider)
			local Inline = Instance.new('Frame', Outline)
			local Accent = Instance.new('TextButton', Inline)
			local Add = Instance.new('TextButton', Outline)
			local Subtract = Instance.new('TextButton', Outline)
			local Title = Instance.new('TextLabel', NewSlider)
			local Value = Instance.new('TextLabel', NewSlider)
			--
			NewSlider.Name = "NewSlider"
			NewSlider.Size = UDim2.new(1,0,0,22)
			NewSlider.BackgroundColor3 = Color3.new(1,1,1)
			NewSlider.BackgroundTransparency = 1
			NewSlider.BorderSizePixel = 0
			NewSlider.BorderColor3 = Color3.new(0,0,0)
			NewSlider.Text = ""
			NewSlider.TextColor3 = Color3.new(0,0,0)
			NewSlider.AutoButtonColor = false
			NewSlider.Font = Enum.Font.SourceSans
			NewSlider.TextSize = 14
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(0,15,1,0)
			Outline.Size = UDim2.new(1,-30,0,7)
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			Outline.AnchorPoint = Vector2.new(0,1)
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Accent.Name = "Accent"
			Accent.Size = UDim2.new(0,0,1,0)
			Accent.BackgroundColor3 = Library.Accent
			Accent.BorderSizePixel = 0
			Accent.BorderColor3 = Color3.new(0,0,0)
			Accent.Text = ""
			Accent.TextColor3 = Color3.new(0,0,0)
			Accent.AutoButtonColor = false
			Accent.Font = Enum.Font.SourceSans
			Accent.TextSize = 14
			table.insert(Library.ThemeObjects, Accent)
			table.insert(Library.ThemeObjects, Accent)
			--
			Add.Name = "Add"
			Add.Position = UDim2.new(1,5,0.5,0)
			Add.Size = UDim2.new(0,10,0,10)
			Add.BackgroundColor3 = Color3.new(1,1,1)
			Add.BackgroundTransparency = 1
			Add.BorderSizePixel = 0
			Add.BorderColor3 = Color3.new(0,0,0)
			Add.AnchorPoint = Vector2.new(0,0.5)
			Add.Text = "+"
			Add.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Add.AutoButtonColor = false
			Add.Font = Library.Font
			Add.TextSize = Library.FontSize
			Add.TextStrokeTransparency = 0
			--
			Subtract.Name = "Subtract"
			Subtract.Position = UDim2.new(0,-15,0.5,0)
			Subtract.Size = UDim2.new(0,10,0,10)
			Subtract.BackgroundColor3 = Color3.new(1,1,1)
			Subtract.BackgroundTransparency = 1
			Subtract.BorderSizePixel = 0
			Subtract.BorderColor3 = Color3.new(0,0,0)
			Subtract.AnchorPoint = Vector2.new(0,0.5)
			Subtract.Text = "-"
			Subtract.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Subtract.AutoButtonColor = false
			Subtract.Font = Library.Font
			Subtract.TextSize = Library.FontSize
			Subtract.TextStrokeTransparency = 0
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,15,0,0)
			Title.Size = UDim2.new(1,0,0,10)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Title.Font = Library.Font
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Text = Slider.Name
			Title.TextStrokeTransparency = 0
			--
			Value.Name = "Value"
			Value.Position = UDim2.new(0,15,0,0)
			Value.Size = UDim2.new(1,-30,0,10)
			Value.BackgroundColor3 = Color3.new(1,1,1)
			Value.BackgroundTransparency = 1
			Value.BorderSizePixel = 0
			Value.BorderColor3 = Color3.new(0,0,0)
			Value.TextColor3 = Color3.new(1,1,1)
			Value.Font = Library.Font
			Value.TextSize = Library.FontSize
			Value.TextXAlignment = Enum.TextXAlignment.Right
			Value.TextStrokeTransparency = 0
			
			-- // Functions
			local Sliding = false
			local Val = Slider.State
			local function Set(value)
				value = math.clamp(Library:Round(value, Slider.Decimals), Slider.Min, Slider.Max)

				local sizeX = ((value - Slider.Min) / (Slider.Max - Slider.Min))
				Accent.Size = UDim2.new(sizeX, 0, 1, 0)
				--Value.Text = TextValue:gsub("%[value%]", string.format("%.14g", value))
				if Slider.Disabled and value == Slider.Min then
					Value.Text = Slider.Disabled
				else
					Value.Text = TextValue:gsub("%[value%]", string.format("%.14g", value))
				end
				Val = value

				Library.Flags[Slider.Flag] = value
				Slider.Callback(value)
			end				
			--
			local function Slide(input)
				local sizeX = (input.Position.X - Outline.AbsolutePosition.X) / Outline.AbsoluteSize.X
				local value = ((Slider.Max - Slider.Min) * sizeX) + Slider.Min
				Set(value)
			end
			--
			Library:Connection(NewSlider.InputBegan, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = true
					Slide(input)
				end
			end)
			Library:Connection(NewSlider.InputEnded, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = false
				end
			end)
			Library:Connection(Accent.InputBegan, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = true
					Slide(input)
				end
			end)
			Library:Connection(Accent.InputEnded, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = false
				end
			end)
			Library:Connection(game:GetService("UserInputService").InputChanged, function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if Sliding then
						Slide(input)
					end
				end
			end)
			Library:Connection(NewSlider.MouseEnter, function()
				table.insert(Library.ThemeObjects, Title)
				Title.TextColor3 = Library.Accent
			end)
			--
			Library:Connection(NewSlider.MouseLeave, function()
				table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
				Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			end)
			--
			Library:Connection(Add.MouseButton1Down, function()
				Set(Val + 1)
			end)
			--
			Library:Connection(Subtract.MouseButton1Down, function()
				Set(Val - 1)
			end)
			--
			function Slider:Set(Value)
				Set(Value)
			end
			--
			Flags[Slider.Flag] = Set
			Library.Flags[Slider.Flag] = Slider.State
			Set(Slider.State)

			-- // Returning
			return Slider
		end
		--
		function Sections:Dropdown(Properties)
			local Properties = Properties or {};
			local Dropdown = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Open = false,
				Name = Properties.Name or Properties.name or nil,
				Options = (Properties.options or Properties.Options or Properties.values or Properties.Values or {
					"1",
					"2",
					"3",
				}),
				Max = (Properties.Max or Properties.max or nil),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or nil
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				OptionInsts = {},
			}
			--
			local NewDrop = Instance.new('Frame', Dropdown.Section.Elements.SectionContent)
			local Outline = Instance.new('TextButton', NewDrop)
			local Inline = Instance.new('Frame', Outline)
			local Value = Instance.new('TextLabel', Inline)
			local Icon = Instance.new('TextLabel', Inline)
			local Title = Instance.new('TextLabel', NewDrop)
			local ContainerOutline = Instance.new('Frame', NewDrop)
			local ContainerInline = Instance.new('Frame', ContainerOutline)
			local UIListLayout = Instance.new('UIListLayout', ContainerInline)
			--
			NewDrop.Name = "NewDrop"
			NewDrop.Size = UDim2.new(1,0,0,30)
			NewDrop.BackgroundColor3 = Color3.new(1,1,1)
			NewDrop.BackgroundTransparency = 1
			NewDrop.BorderSizePixel = 0
			NewDrop.BorderColor3 = Color3.new(0,0,0)
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(0,15,1,0)
			Outline.Size = UDim2.new(1,-30,0,16)
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			Outline.AnchorPoint = Vector2.new(0,1)
			Outline.Text = ""
			Outline.AutoButtonColor = false
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Value.Name = "Value"
			Value.Position = UDim2.new(0,2,0,0)
			Value.Size = UDim2.new(1,-30,1,0)
			Value.BackgroundColor3 = Color3.new(1,1,1)
			Value.BackgroundTransparency = 1
			Value.BorderSizePixel = 0
			Value.BorderColor3 = Color3.new(0,0,0)
			Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Value.Font = Library.Font
			Value.TextSize = Library.FontSize
			Value.TextXAlignment = Enum.TextXAlignment.Left
			Value.TextStrokeTransparency = 0
            Value.TextWrapped = true
			--
			Icon.Name = "Icon"
			Icon.Position = UDim2.new(0,-5,0,0)
			Icon.Size = UDim2.new(1,0,1,0)
			Icon.BackgroundColor3 = Color3.new(1,1,1)
			Icon.BackgroundTransparency = 1
			Icon.BorderSizePixel = 0
			Icon.BorderColor3 = Color3.new(0,0,0)
			Icon.Text = "+"
			Icon.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Icon.Font = Library.Font
			Icon.TextSize = Library.FontSize
			Icon.TextXAlignment = Enum.TextXAlignment.Right
			Icon.TextStrokeTransparency = 0
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,15,0,0)
			Title.Size = UDim2.new(1,0,0,10)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Title.Font = Library.Font
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.TextStrokeTransparency = 0
			Title.Text = Dropdown.Name
			--
			ContainerOutline.Name = "ContainerOutline"
			ContainerOutline.Position = UDim2.new(0,15,1,2)
			ContainerOutline.Size = UDim2.new(1,-30,0,10)
			ContainerOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			ContainerOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			ContainerOutline.Visible = false
			ContainerOutline.AutomaticSize = Enum.AutomaticSize.Y
			ContainerOutline.ZIndex = 5
			--
			ContainerInline.Name = "ContainerInline"
			ContainerInline.Position = UDim2.new(0,1,0,1)
			ContainerInline.Size = UDim2.new(1,-2,1,-2)
			ContainerInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			ContainerInline.BorderSizePixel = 0
			ContainerInline.BorderColor3 = Color3.new(0,0,0)
			ContainerInline.ZIndex = 6;
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			-- // Connections
			Library:Connection(Outline.MouseButton1Down, function()
				ContainerOutline.Visible = not ContainerOutline.Visible
				if ContainerOutline.Visible then
					NewDrop.ZIndex = 2
					Icon.Text = "-"
				else
					NewDrop.ZIndex = 1
					Icon.Text = "+"
				end
			end)
			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if ContainerOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Library:IsMouseOverFrame(ContainerOutline) and not Library:IsMouseOverFrame(NewDrop) then
						ContainerOutline.Visible = false
						NewDrop.ZIndex = 1
						Icon.Text = "+"
					end
				end
			end)
			Library:Connection(NewDrop.MouseEnter, function()
				Outline.BorderColor3 = Library.Accent
				table.insert(Library.ThemeObjects, Title)
				Title.TextColor3 = Library.Accent
			end)
			--
			Library:Connection(NewDrop.MouseLeave, function()
				Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
				table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
				Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			end)
			--
			local chosen = Dropdown.Max and {} or nil
			--
			local function handleoptionclick(option, button, text)
				button.MouseButton1Down:Connect(function()
					if Dropdown.Max then
						if table.find(chosen, option) then
							table.remove(chosen, table.find(chosen, option))

							local textchosen = {}
							local cutobject = false

							for _, opt in next, chosen do
								table.insert(textchosen, opt)
							end

							Value.Text = #chosen == 0 and "" or table.concat(textchosen, ",") .. (cutobject and ", ..." or "")

							text.TextColor3 = Color3.fromRGB(145,145,145)

							Library.Flags[Dropdown.Flag] = chosen
							Dropdown.Callback(chosen)
						else
							if #chosen == Dropdown.Max then
								Dropdown.OptionInsts[chosen[1]].text.TextColor3 = Color3.fromRGB(145,145,145)
								table.remove(chosen, 1)
							end

							table.insert(chosen, option)

							local textchosen = {}
							local cutobject = false

							for _, opt in next, chosen do
								table.insert(textchosen, opt)
							end

							Value.Text = #chosen == 0 and "" or table.concat(textchosen, ",") .. (cutobject and ", ..." or "")

							text.TextColor3 = Color3.fromRGB(255,255,255)

							Library.Flags[Dropdown.Flag] = chosen
							Dropdown.Callback(chosen)
						end
					else
						for opt, tbl in next, Dropdown.OptionInsts do
							if opt ~= option then
								tbl.text.TextColor3 = Color3.fromRGB(145,145,145)
							end
						end
						chosen = option
						Value.Text = option
						text.TextColor3 = Color3.fromRGB(255,255,255)
						Library.Flags[Dropdown.Flag] = option
						Dropdown.Callback(option)
					end
				end)
			end
			--
			local function createoptions(tbl)
				for _, option in next, tbl do
					Dropdown.OptionInsts[option] = {}
					local NewOption = Instance.new('TextButton', ContainerInline)
					local OptionName = Instance.new('TextLabel', NewOption)
					NewOption.Name = "NewOption"
					NewOption.Size = UDim2.new(1,0,0,15)
					NewOption.BackgroundColor3 = Color3.new(1,1,1)
					NewOption.BackgroundTransparency = 1
					NewOption.BorderSizePixel = 0
					NewOption.BorderColor3 = Color3.new(0,0,0)
					NewOption.Text = ""
					NewOption.TextColor3 = Color3.new(0,0,0)
					NewOption.AutoButtonColor = false
					NewOption.Font = Enum.Font.SourceSans
					NewOption.TextSize = 14
					NewOption.ZIndex = 7;
					Dropdown.OptionInsts[option].button = NewOption
					--
					OptionName.Name = "OptionName"
					OptionName.Position = UDim2.new(0,2,0,0)
					OptionName.Size = UDim2.new(1,0,1,0)
					OptionName.BackgroundColor3 = Color3.new(1,1,1)
					OptionName.BackgroundTransparency = 1
					OptionName.BorderSizePixel = 0
					OptionName.BorderColor3 = Color3.new(0,0,0)
					OptionName.Text = option
					OptionName.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
					OptionName.Font = Library.Font
					OptionName.TextSize = Library.FontSize
					OptionName.TextXAlignment = Enum.TextXAlignment.Left
					OptionName.TextStrokeTransparency = 0
					OptionName.ZIndex = 8;
					Dropdown.OptionInsts[option].text = OptionName

					handleoptionclick(option, NewOption, OptionName)
				end
			end
			createoptions(Dropdown.Options)
			--
			local set
			set = function(option)
				if Dropdown.Max then
					table.clear(chosen)
					option = type(option) == "table" and option or {}

					for opt, tbl in next, Dropdown.OptionInsts do
						if not table.find(option, opt) then
							tbl.text.TextColor3 = Color3.fromRGB(145,145,145)
						end
					end

					for i, opt in next, option do
						if table.find(Dropdown.Options, opt) and #chosen < Dropdown.Max then
							table.insert(chosen, opt)
							Dropdown.OptionInsts[opt].text.TextColor3 = Color3.fromRGB(255,255,255)
						end
					end

					local textchosen = {}
					local cutobject = false

					for _, opt in next, chosen do
						table.insert(textchosen, opt)
					end

					Value.Text = #chosen == 0 and "" or table.concat(textchosen, ",") .. (cutobject and ", ..." or "")

					Library.Flags[Dropdown.Flag] = chosen
					Dropdown.Callback(chosen)
				end
			end
			--
			function Dropdown:Set(option)
				if Dropdown.Max then
					set(option)
				else
					for opt, tbl in next, Dropdown.OptionInsts do
						if opt ~= option then
							tbl.text.TextColor3 = Color3.fromRGB(145,145,145)
						end
					end
					if table.find(Dropdown.Options, option) then
						chosen = option
						Value.Text = option
						Dropdown.OptionInsts[option].text.TextColor3 = Color3.fromRGB(255,255,255)
						Library.Flags[Dropdown.Flag] = chosen
						Dropdown.Callback(chosen)
					else
						chosen = nil
						Value.Text = ""
						Library.Flags[Dropdown.Flag] = chosen
						Dropdown.Callback(chosen)
					end
				end
			end
			--
			function Dropdown:Refresh(tbl)
				for _, opt in next, Dropdown.OptionInsts do
					coroutine.wrap(function()
						opt.button:Destroy()
					end)()
				end
				table.clear(Dropdown.OptionInsts)

				createoptions(tbl)

				if Dropdown.Max then
					table.clear(chosen)
				else
					chosen = nil
				end

				Library.Flags[Dropdown.Flag] = chosen
				Dropdown.Callback(chosen)
			end

			-- // Returning
			if Dropdown.Max then
				Flags[Dropdown.Flag] = set
			else
				Flags[Dropdown.Flag] = Dropdown
			end
			Dropdown:Set(Dropdown.State)
			return Dropdown
		end
		--
		function Sections:Keybind(Properties)
			local Properties = Properties or {}
			local Keybind = {
				Section = self,
				Name = Properties.name or Properties.Name or "Keybind",
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or nil
				),
				Mode = (Properties.mode or Properties.Mode or "Toggle"),
				UseKey = (Properties.UseKey or false),
				Ignore = (Properties.ignore or Properties.Ignore or false),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Binding = nil,
			}
			local Key
			local State = false
			--
			local NewKey = Instance.new('Frame', Keybind.Section.Elements.SectionContent)
			local Outline = Instance.new('TextButton', NewKey)
			local Inline = Instance.new('Frame', Outline)
			local Value = Instance.new('TextLabel', Inline)
			local Title = Instance.new('TextLabel', NewKey)
			local ModeOutline = Instance.new('Frame', NewKey)
			local ModeInline = Instance.new('Frame', ModeOutline)
			local UIListLayout = Instance.new('UIListLayout', ModeInline)
			local Hold = Instance.new('TextButton', ModeInline)
			local Toggle = Instance.new('TextButton', ModeInline)
			local Always = Instance.new('TextButton', ModeInline)
			local ListValue = Library.KeyList:NewKey(tostring(Keybind.State):gsub("Enum.KeyCode.", ""), Keybind.Name, Keybind.Mode)
			--
			NewKey.Name = "NewKey"
			NewKey.Size = UDim2.new(1,0,0,12)
			NewKey.BackgroundColor3 = Color3.new(1,1,1)
			NewKey.BackgroundTransparency = 1
			NewKey.BorderSizePixel = 0
			NewKey.BorderColor3 = Color3.new(0,0,0)
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(1,0,0.5,0)
			Outline.Size = UDim2.new(0,40,0,12)
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			Outline.AnchorPoint = Vector2.new(1,0.5)
			Outline.Text = ""
			Outline.AutoButtonColor = false
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Value.Name = "Value"
			Value.Size = UDim2.new(1,0,1,0)
			Value.BackgroundColor3 = Color3.new(1,1,1)
			Value.BackgroundTransparency = 1
			Value.BorderSizePixel = 0
			Value.BorderColor3 = Color3.new(0,0,0)
			Value.Text = "MB2"
			Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Value.Font = Library.Font
			Value.TextSize = Library.FontSize
			Value.TextStrokeTransparency = 0
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,15,0,0)
			Title.Size = UDim2.new(1,0,0,10)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Title.Font = Library.Font
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Text = Keybind.Name
			Title.TextStrokeTransparency = 0
			--
			ModeOutline.Name = "ModeOutline"
			ModeOutline.Position = UDim2.new(1,65,0.5,0)
			ModeOutline.Size = UDim2.new(0,60,0,12)
			ModeOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			ModeOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			ModeOutline.AnchorPoint = Vector2.new(1,0.5)
			ModeOutline.AutomaticSize = Enum.AutomaticSize.Y
			ModeOutline.Visible = false
			--
			ModeInline.Name = "ModeInline"
			ModeInline.Position = UDim2.new(0,1,0,1)
			ModeInline.Size = UDim2.new(1,-2,1,-2)
			ModeInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			ModeInline.BorderSizePixel = 0
			ModeInline.BorderColor3 = Color3.new(0,0,0)
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			--
			Hold.Name = "Hold"
			Hold.Size = UDim2.new(1,0,0,15)
			Hold.BackgroundColor3 = Color3.new(1,1,1)
			Hold.BackgroundTransparency = 1
			Hold.BorderSizePixel = 0
			Hold.BorderColor3 = Color3.new(0,0,0)
			Hold.Text = "Hold"
			Hold.TextColor3 = Keybind.Mode == "Hold" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
			Hold.AutoButtonColor = false
			Hold.Font = Library.Font
			Hold.TextSize = Library.FontSize
			Hold.TextStrokeTransparency = 0
			--
			Toggle.Name = "Toggle"
			Toggle.Size = UDim2.new(1,0,0,15)
			Toggle.BackgroundColor3 = Color3.new(1,1,1)
			Toggle.BackgroundTransparency = 1
			Toggle.BorderSizePixel = 0
			Toggle.BorderColor3 = Color3.new(0,0,0)
			Toggle.Text = "Toggle"
			Toggle.TextColor3 = Keybind.Mode == "Toggle" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
			Toggle.AutoButtonColor = false
			Toggle.Font = Library.Font
			Toggle.TextSize = Library.FontSize
			Toggle.TextStrokeTransparency = 0
			--
			Always.Name = "Always"
			Always.Size = UDim2.new(1,0,0,15)
			Always.BackgroundColor3 = Color3.new(1,1,1)
			Always.BackgroundTransparency = 1
			Always.BorderSizePixel = 0
			Always.BorderColor3 = Color3.new(0,0,0)
			Always.Text = "Always"
			Always.TextColor3 = Keybind.Mode == "Always" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
			Always.AutoButtonColor = false
			Always.Font = Library.Font
			Always.TextSize = Library.FontSize
			Always.TextStrokeTransparency = 0
			
			-- // Functions
			local function set(newkey)
				if string.find(tostring(newkey), "Enum") then
					if c then
						c:Disconnect()
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = false
						end
						Keybind.Callback(false)
					end
					if tostring(newkey):find("Enum.KeyCode.") then
						newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
					elseif tostring(newkey):find("Enum.UserInputType.") then
						newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
					end
					if newkey == Enum.KeyCode.Backspace then
						Key = nil
						if Keybind.UseKey then
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = Key
							end
							Keybind.Callback(Key)
						end
						local text = "None"

						Value.Text = text
						ListValue:Update(text, Keybind.Name, Keybind.Mode)
					elseif newkey ~= nil then
						Key = newkey
						if Keybind.UseKey then
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = Key
							end
							Keybind.Callback(Key)
						end
						local text = (Library.Keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))

						Value.Text = text
						ListValue:Update(text, Keybind.Name, Keybind.Mode)
					end

					Library.Flags[Keybind.Flag .. "_KEY"] = newkey
				elseif table.find({ "Always", "Toggle", "Hold" }, newkey) then
					if not Keybind.UseKey then
						Library.Flags[Keybind.Flag .. "_KEY STATE"] = newkey
						Keybind.Mode = newkey
						ListValue:Update((Library.Keys[Key] or tostring(Key):gsub("Enum.KeyCode.", "")), Toggle.Name, Keybind.Mode)
						if Keybind.Mode == "Always" then
							State = true
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = State
							end
							Keybind.Callback(true)
							ListValue:SetVisible(true)
						end
					end
				else
					State = newkey
					if Keybind.Flag then
						Library.Flags[Keybind.Flag] = newkey
					end
					Keybind.Callback(newkey)
				end
			end
			--
			set(Keybind.State)
			set(Keybind.Mode)
			Outline.MouseButton1Click:Connect(function()
				if not Keybind.Binding then

					Value.Text = "..."

					Keybind.Binding = Library:Connection(
						game:GetService("UserInputService").InputBegan,
						function(input, gpe)
							set(
								input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode
									or input.UserInputType
							)
							Library:Disconnect(Keybind.Binding)
							task.wait()
							Keybind.Binding = nil
						end
					)
				end
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputBegan, function(inp)
				if (inp.KeyCode == Key or inp.UserInputType == Key) and not Keybind.Binding and not Keybind.UseKey then
					if Keybind.Mode == "Hold" then
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = true
						end
						c = Library:Connection(game:GetService("RunService").RenderStepped, function()
							if Keybind.Callback then
								Keybind.Callback(true)
							end
						end)
						ListValue:SetVisible(true)
					elseif Keybind.Mode == "Toggle" then
						State = not State
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = State
						end
						Keybind.Callback(State)
						ListValue:SetVisible(State)
					end
				end
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputEnded, function(inp)
				if Keybind.Mode == "Hold" and not Keybind.UseKey then
					if Key ~= "" or Key ~= nil then
						if inp.KeyCode == Key or inp.UserInputType == Key then
							if c then
								c:Disconnect()
								if Keybind.Flag then
									Library.Flags[Keybind.Flag] = false
								end
								if Keybind.Callback then
									Keybind.Callback(false)
								end
								ListValue:SetVisible(false)
							end
						end
					end
				end
			end)
			Library:Connection(Outline.MouseEnter, function()
				Outline.BorderColor3 = Library.Accent
			end)
			--
			Library:Connection(Outline.MouseLeave, function()
				Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			end)
			--
			Library:Connection(Outline.MouseButton2Down, function()
				ModeOutline.Visible = not ModeOutline.Visible
			end)
			--
			Library:Connection(NewKey.MouseEnter, function()
				table.insert(Library.ThemeObjects, Title)
				Title.TextColor3 = Library.Accent
			end)
			--
			Library:Connection(NewKey.MouseLeave, function()
				table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
				Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			end)
			--
			Library:Connection(Hold.MouseButton1Down, function()
				set("Hold")
				Hold.TextColor3 = Color3.new(1,1,1)
				Toggle.TextColor3 = Color3.fromRGB(145,145,145)
				Always.TextColor3 = Color3.fromRGB(145,145,145)
			end)
			--
			Library:Connection(Toggle.MouseButton1Down, function()
				set("Toggle")
				Hold.TextColor3 = Color3.fromRGB(145,145,145)
				Toggle.TextColor3 = Color3.new(1,1,1)
				Always.TextColor3 = Color3.fromRGB(145,145,145)
			end)
			--
			Library:Connection(Always.MouseButton1Down, function()
				set("Always")
				Hold.TextColor3 = Color3.fromRGB(145,145,145)
				Toggle.TextColor3 = Color3.fromRGB(145,145,145)
				Always.TextColor3 = Color3.new(1,1,1)
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if ModeOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Library:IsMouseOverFrame(ModeOutline) then
						ModeOutline.Visible = false
					end
				end
			end)
			--
			Library.Flags[Keybind.Flag .. "_KEY"] = Keybind.State
			Library.Flags[Keybind.Flag .. "_KEY STATE"] = Keybind.Mode
			Flags[Keybind.Flag] = set
			Flags[Keybind.Flag .. "_KEY"] = set
			Flags[Keybind.Flag .. "_KEY STATE"] = set
			--
			function Keybind:Set(key)
				set(key)
			end

			-- // Returning
			return Keybind
		end
		--
		function Sections:Colorpicker(Properties)
			local Properties = Properties or {}
			local Colorpicker = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = (Properties.Name or "Colorpicker"),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or Color3.fromRGB(255, 0, 0)
				),
				Alpha = (
					Properties.alpha
						or Properties.Alpha
						or Properties.transparency
						or Properties.Transparency
						or 1
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Colorpickers = 0,
			}
			--
			local NewToggle = Instance.new('Frame', Colorpicker.Section.Elements.SectionContent)
			local TextLabel = Instance.new('TextLabel', NewToggle)
			--
			NewToggle.Name = "NewToggle"
			NewToggle.Size = UDim2.new(1,0,0,10)
			NewToggle.BackgroundColor3 = Color3.new(1,1,1)
			NewToggle.BackgroundTransparency = 1
			NewToggle.BorderSizePixel = 0
			NewToggle.BorderColor3 = Color3.new(0,0,0)
			--
			TextLabel.Position = UDim2.new(0,15,0,0)
			TextLabel.Size = UDim2.new(0,100,1,0)
			TextLabel.BackgroundColor3 = Color3.new(1,1,1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.BorderColor3 = Color3.new(0,0,0)
			TextLabel.Text = Colorpicker.Name
			TextLabel.TextColor3 = Color3.fromRGB(145, 145, 145)
			TextLabel.Font = Library.Font
			TextLabel.TextSize = Library.FontSize
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.TextStrokeTransparency = 0
			
			Library:Connection(NewToggle.MouseEnter, function()
				table.insert(Library.ThemeObjects, TextLabel)
				TextLabel.TextColor3 = Library.Accent
			end)
			--
			Library:Connection(NewToggle.MouseLeave, function()
				table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, TextLabel))
				TextLabel.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			end)

			-- // Functions
			Colorpicker.Colorpickers = Colorpicker.Colorpickers + 1
			local colorpickertypes = Library:NewPicker(
				Colorpicker.Name,
				Colorpicker.State,
				Colorpicker.Alpha,
				NewToggle,
				Colorpicker.Colorpickers - 1,
				Colorpicker.Flag,
				Colorpicker.Callback
			)

			function Colorpicker:Set(color)
				colorpickertypes:set(color, false, true)
			end

			-- // Returning
			return Colorpicker
		end
		--
		function Sections:Textbox(Properties)
			local Properties = Properties or {}
			local Textbox = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = (Properties.Name or Properties.name or "textbox"),
				Placeholder = (
					Properties.placeholder
						or Properties.Placeholder
						or Properties.holder
						or Properties.Holder
						or ""
				),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or ""
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
			}
			--
			local NewDrop = Instance.new('Frame', Textbox.Section.Elements.SectionContent)
			local Outline = Instance.new('TextButton', NewDrop)
			local Inline = Instance.new('Frame', Outline)
			local Value = Instance.new('TextBox', Inline)
			local Title = Instance.new('TextLabel', NewDrop)
			--
			NewDrop.Name = "NewDrop"
			NewDrop.Size = UDim2.new(1,0,0,30)
			NewDrop.BackgroundColor3 = Color3.new(1,1,1)
			NewDrop.BackgroundTransparency = 1
			NewDrop.BorderSizePixel = 0
			NewDrop.BorderColor3 = Color3.new(0,0,0)
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(0,15,1,0)
			Outline.Size = UDim2.new(1,-30,0,16)
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			Outline.AnchorPoint = Vector2.new(0,1)
			Outline.Text = ""
			Outline.AutoButtonColor = false
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Value.Name = "Value"
			Value.Position = UDim2.new(0,2,0,0)
			Value.Size = UDim2.new(1,0,1,0)
			Value.BackgroundColor3 = Color3.new(1,1,1)
			Value.BackgroundTransparency = 1
			Value.BorderSizePixel = 0
			Value.BorderColor3 = Color3.new(0,0,0)
			Value.TextColor3 = Color3.fromRGB(145,145,145)
			Value.Font = Library.Font
			Value.TextSize = Library.FontSize
			Value.TextXAlignment = Enum.TextXAlignment.Left
			Value.TextStrokeTransparency = 0
			Value.TextWrapped = true
			Value.Text = Textbox.State
			Value.ClearTextOnFocus = false
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,15,0,0)
			Title.Size = UDim2.new(1,0,0,10)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Title.Font = Library.Font
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.TextStrokeTransparency = 0
			Title.Text = Textbox.Name
			
			-- // Connections
			Library:Connection(NewDrop.MouseEnter, function()
				Outline.BorderColor3 = Library.Accent
				table.insert(Library.ThemeObjects, Title)
				Title.TextColor3 = Library.Accent
			end)
			--
			Library:Connection(NewDrop.MouseLeave, function()
				Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
				table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
				Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			end)
			Value.FocusLost:Connect(function()
				Textbox.Callback(Value.Text)
				Library.Flags[Textbox.Flag] = Value.Text
			end)
			--
			local function set(str)
				Value.Text = str
				Library.Flags[Textbox.Flag] = str
				Textbox.Callback(str)
			end

			-- // Return
			Flags[Textbox.Flag] = set
			return Textbox
		end
		--
		function Sections:Button(Properties)
			local Properties = Properties or {}
			local Button = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = Properties.Name or "button",
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
			}
			--
			local NewButton = Instance.new('TextButton', Button.Section.Elements.SectionContent)
			local Outline = Instance.new('Frame', NewButton)
			local Inline = Instance.new('Frame', Outline)
			local Value = Instance.new('TextLabel', Inline)
			--
			NewButton.Name = "NewButton"
			NewButton.Size = UDim2.new(1,0,0,14)
			NewButton.BackgroundColor3 = Color3.new(1,1,1)
			NewButton.BackgroundTransparency = 1
			NewButton.BorderSizePixel = 0
			NewButton.BorderColor3 = Color3.new(0,0,0)
			NewButton.Text = ""
			NewButton.TextColor3 = Color3.new(0,0,0)
			NewButton.AutoButtonColor = false
			NewButton.Font = Enum.Font.SourceSans
			NewButton.TextSize = 14
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(0,15,1,0)
			Outline.Size = UDim2.new(1,-30,0,14)
			Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
			Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			Outline.AnchorPoint = Vector2.new(0,1)
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			--
			Value.Name = "Value"
			Value.Size = UDim2.new(1,0,1,0)
			Value.BackgroundColor3 = Color3.new(1,1,1)
			Value.BackgroundTransparency = 1
			Value.BorderSizePixel = 0
			Value.BorderColor3 = Color3.new(0,0,0)
			Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			Value.Font = Library.Font
			Value.TextSize = Library.FontSize
			Value.Text = Button.Name
			Value.TextStrokeTransparency = 0
			
			Library:Connection(NewButton.MouseEnter, function()
				Outline.BorderColor3 = Library.Accent
			end)
			--
			Library:Connection(NewButton.MouseLeave, function()
				Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
			end)
			--
			Library:Connection(NewButton.MouseButton1Down, function()
				Button.Callback()
				Value.TextColor3 = Library.Accent
			end)
			--
			Library:Connection(NewButton.MouseButton1Up, function()
				Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
			end)
		end
		--
        function Sections:Label(Properties) -- fuck finobe
			local Properties = Properties or {}
			local Label = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = Properties.Name or "label",
                Centered = Properties.Centered or false,
			}
            local NewButton = Instance.new('TextLabel', Label.Section.Elements.SectionContent) -- ya im lazy
            --
			NewButton.Name = "NewButton"
			NewButton.Size = UDim2.new(1,0,0,12)
			NewButton.BackgroundColor3 = Color3.new(1,1,1)
			NewButton.BackgroundTransparency = 1
			NewButton.BorderSizePixel = 0
			NewButton.BorderColor3 = Color3.new(0,0,0)
			NewButton.Text = Label.Name
			NewButton.TextColor3 = Color3.fromRGB(255,255,255)
			NewButton.Font = Library.Font
            NewButton.TextStrokeTransparency = 0
            NewButton.TextStrokeColor3 = Color3.new(0,0,0)
			NewButton.TextSize = Library.FontSize
            NewButton.TextXAlignment = Label.Centered and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
        end
	end
end

-- Local Variables
local Flags = Library.Flags
local Pointers = Library.Pointers
local Utility = Library.Utility

getfenv(0)["Library"] = Library;
getfenv(0)["Flags"] = Flags;
getfenv(0)["Pointers"] = Pointers;

LPH_NO_VIRTUALIZE = function(...) return (...) end;
LPH_ENCSTR = function(...) return (...) end; 
LPH_CRASH = function(...) return (...) end; 

__newindex = function() 
	LPH_CRASH() 
end 

hookfunction = function() 
	LPH_CRASH() 
end

clonefunction = function()
	LPH_CRASH() 
end 

__metatable = function()
	LPH_CRASH() 
end 

getupvalue = function()
	LPH_CRASH()
end 

clonefunction = function()
	LPH_CRASH()
end 

local font = Enum.Font.SourceSans;
Library:ChangeAccent(Color3.fromRGB(9, 121, 105));
local InputService = game:GetService("UserInputService");
local TeleportService = game:GetService("TeleportService");
local RunService = game:GetService("RunService");
local Workspace = game:GetService("Workspace");
local Lighting = game:GetService("Lighting");
local Players = game:GetService("Players");
local HttpService = game:GetService("HttpService");
local StarterGui = game:GetService("StarterGui");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local VirtualUser = game:GetService("VirtualUser");
local PathFindingService = game:GetService("PathfindingService");
local utility = {Circle = nil, bodyParts = {}, target = nil, angle = 0, drawings = {}, folders = {}}
local framework = {connections = {}}
local flags = Library.Flags
local ESP = {}
local IgnoreList = {} 
local misc_flags = {resolver = false, cframe = false, target = false, speed = false, fly = false}
local HitReg = {}
local Visuals = {   
    ["Drawings"] = {},
	["Bases"] = {},
	["Base"] = {},
	["Settings"] = { 
		["Line"] = {
		    Thickness = 1,
		    Color = Color3.fromRGB(0, 255, 0)
	    },
		["Text"] = {
			Size = 13,
			Center = true,
			Outline = true,
			Font = Drawing.Fonts.Plex,
			Color = Color3.fromRGB(255, 255, 255)
		},
		["Square"] = {
			Thickness = 1,
			Color = Color3.fromRGB(255, 255, 255),
			Filled = false,
		},
		["Triangle"] = {
			Color = Color3.fromRGB(255, 255, 255),
			Filled = true,
			Visible = false,
			Thickness = 1,
		},
		["Image"] = {
			Transparency = 1,
			Data = game:HttpGet("https://raw.githubusercontent.com/portallol/luna/main/Gradient.png")
		}
	},
}
local NovaPart = game:GetObjects("rbxassetid://14745759584")[1]; NovaPart.Parent = ReplicatedStorage;
local Nova = NovaPart.Attachment 
local sfx = {["Bameware"] = "3124331820",["Skeet"] = "4753603610",["Bonk"] = "3765689841",["Lazer Beam"] = "130791043",["Windows XP Error"] = "160715357",["TF2 Hitsound"] = "3455144981",["TF2 Critical"] = "296102734",["TF2 Bat"] = "3333907347",['Bow Hit'] = "1053296915",['Bow'] = "3442683707",['OSU'] = "7147454322",['Minecraft Hit'] = "4018616850",['Steve'] = "5869422451",['1nn'] = "7349055654",['Rust'] = "5043539486",["TF2 Pan"] = "3431749479",["Neverlose"] = "8679627751",["Mario"] = "5709456554",}
local sfx_names = {"Bameware", "Skeet", "Bonk", "Lazer Beam", "Windows XP Error", "TF2 Hitsound", "TF2 Critical", "TF2 Bat", "Bow Hit", "Bow", "OSU", "Minecraft Hit", "Steve", "1nn", "Rust", "TF2 Pan", "Neverlose", "Mario"}
local LocalPlayer = Players.LocalPlayer; 
local Mouse, Camera = LocalPlayer:GetMouse(), Workspace.Camera
local viewportSize = Camera.ViewportSize
local hitmodule = game:GetObjects("rbxassetid://7255773215")[1]; hitmodule.Parent = ReplicatedStorage
local Math = loadstring(game:HttpGet("https://raw.githubusercontent.com/f1nobe7650/Lynx/main/Math.lua"))(); 
local NewVector2, NewVector3 = Vector2.new, Vector3.new
local Floor = math.floor 
local Find = table.find
local Round = math.round
local Cos = math.cos
local Sin = math.sin
local Pi = math.pi 
local Sqrt = math.sqrt
local Lighting_Save = {["ColorShift_Bottom"] = Lighting.ColorShift_Bottom, ["Ambient"]=Lighting.Ambient, ["OutdoorAmbient"]=Lighting.OutdoorAmbient, ["ColorShift_Top"]=Lighting.ColorShift_Top, ["FogColor"]=Lighting.FogColor, ["FogEnd"]=Lighting.FogEnd, ["FogStart"]=Lighting.FogStart, ["ClockTime"]=Lighting.ClockTime, ["Brightness"]=Lighting.Brightness}
local IgnoreList = {}
local Tween = {};
local crosshair_Lines = {}; 
local crosshair_Outlines = {}; 
local crosshair_LineAmount = 4;
local crosshair_SpinAngle = 0; 
local Offset = game:GetService("GuiService"):GetGuiInset().Y
local connections = {} 
local highlights = {} 
-- 
do 
    -- utility functions
    do 
        function utility:ValidateClient(Player)
            return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and true or false 
        end 
		--
		function utility:CreateBeam(Origin, End, Color1)
			local BeamPart = Instance.new("Part", Workspace)
			BeamPart.Name = "BeamPart"
			BeamPart.Transparency = 1
			--
			local Part = Instance.new("Part", BeamPart)
			Part.Size = NewVector3(1, 1, 1)
			Part.Transparency = 1
			Part.CanCollide = false
			Part.CFrame = typeof(Origin) == "CFrame" and Origin or CFrame.new(Origin)
			Part.Anchored = true
			local Attachment = Instance.new("Attachment", Part)
			local Part2 = Instance.new("Part", BeamPart)
			Part2.Size = NewVector3(1, 1, 1)
			Part2.Transparency = 1
			Part2.CanCollide = false
			Part2.CFrame = typeof(End) == "CFrame" and End or CFrame.new(End)
			Part2.Anchored = true
			Part2.Color = Color3.fromRGB(255, 255, 255)
			local Attachment2 = Instance.new("Attachment", Part2)
			local Beam = Instance.new("Beam", Part)
			Beam.FaceCamera = true
			Beam.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color1),
				ColorSequenceKeypoint.new(1, Color1),
			}
			Beam.Attachment0 = Attachment
			Beam.Attachment1 = Attachment2
			Beam.LightEmission = 6
			Beam.LightInfluence = 1
			Beam.Width0 = 1
			Beam.Width1 = 0.6
			Beam.Texture = "rbxassetid://7216979919"
			Beam.LightEmission = 1
			Beam.LightInfluence = 1
			Beam.TextureMode = Enum.TextureMode.Wrap 
			Beam.TextureLength = 3 
			Beam.TextureSpeed = 3
			delay(flags["Tracers Life Time"], function()
				Part:Destroy()
				Part2:Destroy()
				BeamPart:Destroy()
			end)
		end  
		-- 
		function utility:generateAngles(numLines)
			local angles = {}
			local angleIncrement = 2 * math.pi / numLines
			
			for i = 1, numLines do
				local angle = (i - 1) * angleIncrement
				table.insert(angles, angle)
			end
			
			return angles
		end
		-- 
		function utility:Shift(Number)
			return math.acos(math.cos(Number * math.pi)) / math.pi
		end
        -- 
        function utility:calculateAimViewerEndPoint()
            if utility.target and utility.target.Character and flags["Aim Viewer Bypass"] then 
                local part = (flags["Jump Prediction"] and utility.target.Character.Humanoid.FloorMaterial == Enum.Material.Air and "RightFoot") or (flags["Nearest Part"] and partClosest) or flags["Single Hit Part"]
                local yOffset = utility.target.Character.Humanoid.FloorMaterial == Enum.Material.Air and flags["Manual Offset Value"] or 0 
                print(part, yOffset, checks) -- ENDED HERE
                --
                if (checks == true) then 
                    if flags["Resolver"] then  
                        local endpoint = utility.target.Character[tostring(part)].Position + offset + NewVector3(0, yOffset, 0)
                        Remote:FireServer("UpdateMousePos", endpoint) 
                    else 
                        local endpoint = utility.target.Character[tostring(part)].Position + (utility.target.Character.HumanoidRootPart.Velocity * prediction) + NewVector3(0, yOffset, 0)
                        Remote:FireServer("UpdateMousePos", endpoint) 
                    end   
                end   
            end 
        end     
        -- 
        function utility:getHeld() 
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and LocalPlayer.Character then 
				return LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or nil; 
			end
        end 
        --
        function utility:GetComponents(Player)
            if utility:ValidateClient(Player) then 
                return Player.Character, Player.Character:FindFirstChild("HumanoidRootPart"), Player.Character:FindFirstChild("Humanoid")
            end 
        end 
        --
        function utility:getClosestPlayerToCursor(Radius)
            local shortestDistance = Radius or math.huge

            local closestPlayer
            for i, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and utility:ValidateClient(v) then
                    local pos, OnScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                        if magnitude < shortestDistance and OnScreen then
                            closestPlayer = v
                            shortestDistance = magnitude
                        end
                    end
                end 
            return closestPlayer
        end
        --
        function utility:RecalculateVelocity(Player)
            if utility:ValidateClient(Player) then
                local Character, RootPart, Humanoid = utility:GetComponents(Player)

                local currentPosition = RootPart.Position
                local currentTime = tick() 
                
                task.wait()
    
                local newPosition = RootPart.Position
                local newTime = tick()
                
                local distanceTraveled = (newPosition - currentPosition) 
    
                local timeInterval = newTime - currentTime
                local velocity = distanceTraveled / timeInterval
                currentPosition = newPosition
                currentTime = newTime
                return velocity
            end
        end
        -- 
        function utility:Highlight(Player, fillColor, fillTransparency, outlineColor, outlineTransparency) 
            highlights[Player] = Instance.new("Highlight")
            highlights[Player].Enabled = true
            highlights[Player].DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlights[Player].FillColor = fillColor or Color3.fromRGB(255,0,255)
            highlights[Player].OutlineColor = outlineColor or Color3.fromRGB(255,0,255)
            highlights[Player].Adornee = Player.Character
            highlights[Player].OutlineTransparency = outlineTransparency or 0.5
            highlights[Player].FillTransparency = fillTransparency or 0
            highlights[Player].Parent = game.CoreGui
             
            connections[Player] = Player.CharacterAdded:Connect(function()
                highlights[Player].Adornee = Player.Character
            end)

            return highlights[Player] 
        end 
        --
        function utility:drawObject(type, prop)
            local obj = Drawing.new(type)
            --
            if prop then
                for i,v in next, prop do
                    obj[i] = v;
                end
            end
            return obj  
        end
        --
        utility.folders["Part Chams"] = Instance.new("Folder", Workspace) 
        -- 
        function utility:characterClone(Player, Color, Material, Transparency, Parent)
            for i,v in pairs(Player.Character:GetChildren()) do 
				if table.find(utility.bodyParts, v.Name) and v:IsA("MeshPart") and v.Name ~= "HumanoidRootPart" then 
					if v.Name == "UpperTorso" or v.Name == "LowerTorso" then 
						local ClonedPart = Instance.new("Part")
						ClonedPart.Anchored = true 
						ClonedPart.CanCollide = false 
						ClonedPart.Position = v.Position
						ClonedPart.Parent = Parent
						ClonedPart.Material = Enum.Material[Material]
						ClonedPart.Transparency = Transparency 
						ClonedPart.Color = Color
						ClonedPart.Size = v.Size + Vector3.new(0.01,0.01,0.01)
						ClonedPart.Name = v.Name
						ClonedPart.Rotation = v.Rotation
						ClonedPart.Shape = "Block"
					else 
						local ClonedPart = Instance.new("MeshPart")
						ClonedPart.Anchored = true 
						ClonedPart.CanCollide = false 
						ClonedPart.Position = v.Position
						ClonedPart.Parent = Parent
						ClonedPart.Material = Enum.Material[Material]
						ClonedPart.Transparency = Transparency 
						ClonedPart.Color = Color
						ClonedPart.Size = v.Size + Vector3.new(0.01,0.01,0.01)
						ClonedPart.Name = v.Name
						ClonedPart.Rotation = v.Rotation
						ClonedPart.MeshId = v.MeshId
					end 
				end 
            end
        end 
        -- 
        function utility:Remove(Player)
            if connections[Player] then 
                connections[Player]:Disconnect();
            end 
            -- 
            if highlights[Player] then 
                highlights[Player].Parent = nil;
            end 
        end 
        --
        function utility:AngleToEdge(angle, inset) -- credits to whoever made this Im just porting over my old arrows 😭
            local pos
            local ox = Cos(angle)
            local oy = Sin(angle)
            local slope = oy / ox
            -- 
            local h_edge = viewportSize.x - inset
            local v_edge = viewportSize.y - inset
            if oy < 0 then
                v_edge = inset
            end
            if ox < 0 then
                h_edge = inset
            end
            local y = (slope * h_edge) + (viewportSize.y / 2) - slope * (viewportSize.x / 2)
            if y > 0 and y < viewportSize.y - inset then
                pos = Vector2.new(h_edge, y)
            else
                pos = Vector2.new(
                    (v_edge - viewportSize.y / 2 + slope * (viewportSize.x / 2)) / slope,
                    v_edge
                )
            end
            return pos
        end
        --
        function utility:Map(N, OldMin, OldMax, Min, Max) -- I love my 1 line funcs I use once ♥😻
            return (N - OldMin) / (OldMax - OldMin) * (Max - Min) + Min
        end
        --
        function utility:getRotate(Vec, Rads) -- I didnt make this math credits to whoever can code cool maths!
            local vec = Vec.Unit
            local sin = math.sin(Rads)
            local cos = math.cos(Rads)
            local x = (cos * vec.x) - (sin * vec.y)
            local y = (sin * vec.x) + (cos * vec.y)
            --
            return Vector2.new(x, y).Unit * Vec.Magnitude
        end
        --
        function utility:BoxCalculation(torso)
            local VTop = torso.Position + (torso.CFrame.UpVector * 1.8) + Camera.CFrame.UpVector;
            local VBottom = torso.Position - (torso.CFrame.UpVector * 2.5) - Camera.CFrame.UpVector;
        
            local Top, TopIsRendered = Camera:WorldToViewportPoint(VTop);
            local Bottom, BottomIsRendered = Camera:WorldToViewportPoint(VBottom);
        
            local Width = math.max(math.floor(math.abs(Top.x - Bottom.x)), 3);
            local Height = math.max(math.floor(math.max(math.abs(Bottom.y - Top.y), Width / 2)), 3);
            local BoxSize = NewVector2(math.floor(math.max(Height / 1.5, Width)), Height);
            local BoxPosition = NewVector2(math.floor(Top.x * 0.5 + Bottom.x * 0.5 - BoxSize.x * 0.5), math.floor(math.min(Top.y, Bottom.y)));
        
            return BoxSize, BoxPosition;
        end
        --
        local LastRayIgnoreUpdate, RayIgnoreList = 0, {}
		-- 
		function utility:checkRay(Instance, Distance, Position, Unit)
			local Pass = true;
			local Model = Instance;

			if Distance > 999 then return false; end

			if Instance.ClassName == 'Player' then
				Model = GetCharacter(Instance);
			end

			if not Model then
				Model = Instance.Parent;

				if Model.Parent == workspace then
					Model = Instance;
				end
			end

			if not Model then return false end

			local _Ray = Ray.new(Position, Unit * Distance)

			if tick() - LastRayIgnoreUpdate > 3 then
				LastRayIgnoreUpdate = tick()

				table.clear(RayIgnoreList)

				table.insert(RayIgnoreList, LocalPlayer.Character)
				table.insert(RayIgnoreList, Camera)
				
				if Mouse.TargetFilter then table.insert(RayIgnoreList, Mouse.TargetFilter) end

				if #IgnoreList > 64 then
					while #IgnoreList > 64 do
						table.remove(IgnoreList, 1)
					end
				end

				for i, v in pairs(IgnoreList) do table.insert(RayIgnoreList, v) end
			end

			local Hit = workspace:FindPartOnRayWithIgnoreList(_Ray, RayIgnoreList)

			if Hit and not Hit:IsDescendantOf(Model) then
				Pass = false;
				if Hit.Transparency >= .3 or not Hit.CanCollide and Hit.ClassName ~= Terrain then
					table.insert(IgnoreList, Hit)
				end
			end

			return Pass;
		end
        --
        function utility:GetOrigin()
            local Tool = utility:getHeld()
            -- 
            return (Tool ~= "None" and Tool.Handle.Position) or Camera.CFrame.Position
        end
        --
        function utility:Lerp(Value, MinColor, MaxColor)
            if Value <= 0 then return MaxColor end
            if Value >= 100 then return MinColor end
            --
            return Color3.new(
                MaxColor.R + (MinColor.R - MaxColor.R) * Value,
                MaxColor.G + (MinColor.G - MaxColor.G) * Value,
                MaxColor.B + (MinColor.B - MaxColor.B) * Value
            )
        end
    end 
	
    -- framework functions 
    do 
        function framework:selectTarget() 
			local deathLoop; 
			local deathLoopRestore; 
			-- 	
            if flags["Silent Enabled"] then 
                if misc_flags["target"] then 
                    utility.target = utility:getClosestPlayerToCursor(math.huge); 
                    -- 
                    if flags["Highlight Enabled"] then 
                        utility:Highlight(utility.target, flags["Highlight Fill Color"],  flags["Highlight Fill Color"].transparency, flags["Highlight Outline Color"], flags["Highlight Outline Color"].transparency);
                    end 
                    -- 
                    if flags["Notify"] then 
                        Notification:Notify({Title = "tonka", Description = "Locked onto: " .. utility.target.Name .. ""}, {OutlineColor = Library.Theme.Accent, Time = 2, Type = "default"});
                    end 
                    -- 
                    if flags["Back Track Enabled"] and flags["Back Track Method"] == "Follow" then 
                        utility:characterClone(utility.target, flags["Back Track Settings"], flags["Back Track Material"], flags["Back Track Settings"].transparency, utility.folders["Part Chams"])
                    end 
                    --
                    if flags["Spectate"] or not framework:checkForKillBot() then 
                        Camera.CameraSubject = utility.target.Character.Humanoid
                    end 

					--[[if not framework:checkForKillBot() and table.find(flags["Kill Bot Settings"], "Stomp on knock") then 
						deathLoop = utility.target.Character:WaitForChild("Humanoid").HealthChanged:Connect(function(newHealth)
							if not framework:checkForKillBot() then 
								LocalPlayer.Character.HumanoidRootPart.CFrame = utility.target.Character.UpperTorso.CFrame
							end 
						end) 
						-- 
						deathLoopRestore = utility.target.CharacterAdded:Connect(function(char)
							deathLoop = utility.target.Character:WaitForChild("Humanoid").HealthChanged:Connect(function(newHealth)
								if not framework:checkForKillBot() and Player.Character.BodyEffects["K.O"].Value then 
									LocalPlayer.Character.HumanoidRootPart.CFrame = utility.target.Character.UpperTorso.CFrame
								end 
							end)
						end) 
					end ]]
                else 
                    --NYAHHHHH :3
                    LocalPlayer.Character.Humanoid.AutoRotate = true;
                    Camera.CameraSubject = LocalPlayer.Character.Humanoid;
                    utility.folders["Part Chams"]:ClearAllChildren();
                    if utility.target then 
                        utility:Remove(utility.target);
                    end 
                    utility.drawings["Tracer"].Visible = false;
                    utility.target = nil;
                end 
            end 
        end  
		--
		function framework:detectHit()
			pcall(function()
				framework["connections"]["On-Hit-Raycast"] = Workspace.Ignored.Siren.Radius.DescendantAdded:Once(function(Beam)
					delay(0.05, function()
						if Beam.Name == "BULLET_RAYS" then 
							local Ray = Ray.new(Beam.Position, Beam.CFrame.LookVector * 200)
							local IgnoreList = {LocalPlayer.Character}
							local Hit, HitPosition = Workspace:FindPartOnRayWithIgnoreList(Ray, IgnoreList);
							-- 
							if Hit then
								local InstanceHit = Hit:FindFirstAncestorOfClass('Model')
								if not InstanceHit then return end 
								
								if InstanceHit:FindFirstChild("Humanoid") and InstanceHit:FindFirstChild("HumanoidRootPart") then 
									if flags["Hit Sounds"] then 
										HitReg:HitSound(sfx[flags["Hit Sounds Sound"]], flags["Hit Sounds Volume"])
									end 
									-- 
									if flags["Hit Chams"] then 
										local Folder = Instance.new("Folder", Workspace) 
										utility:characterClone(Players[InstanceHit.Name], flags["Hit Chams Settings"], flags["Hit Chams Material"], flags["Hit Chams Settings"].transparency, Folder);
										delay(flags["Hit Chams Fading Time"], function()
											Folder:Destroy()
										end)
									end
									-- 
									if flags["Hit Marker"] then 
										HitReg:HitMarker(4, flags["Hit Marker Settings"], flags["Hit Markers Time"])
									end 
									-- 
									if flags["3D Hit Marker"] then 
										HitReg:HitMarker3D(4, flags["3D Hit Markers Settings"], flags["Hit Markers Time"], HitPosition) 
									end 
									-- 
									if flags["Hit Effects"] then 
										HitReg:HitEffect(flags["Hit Effects Option"], Players[InstanceHit.Name].Character)
									end 
								end 
							end 	
						end 
					end) 
				end)
			end)	
		end 
		-- 
		function framework:worldVisuals() 
			if flags["Master Switch"] then 
				if flags["Clock Time Enabled"] and Lighting.ClockTime ~= flags["Clock Time"] then 
					Lighting.ClockTime = flags["Clock Time"]
				end 
				-- 
				if flags["Color Shift Bottom"] and Lighting.ColorShift_Bottom ~= flags["Color Shift Bottom Color"] then 
					Lighting.ColorShift_Bottom = flags["Color Shift Bottom Color"]
				end 

				if flags["Ambient"] and Lighting.Ambient ~= flags["Ambience Color"] then 
					Lighting.Ambient = flags["Ambience Color"]
				end 
				-- 
				if flags["Outdoor Ambience"] and Lighting.OutdoorAmbient ~= flags["Outdoor Ambience color"] then 
					Lighting.OutdoorAmbient = flags["Outdoor Ambience color"]
				end 
				-- 
				if flags["Brightness Enabled"] and Lighting.Brightness ~= flags["Brightness"] then 
					Lighting.Brightness = flags["Brightness"]
				end 
				-- 
				if flags["Color Shift Top"] and Lighting.ColorShift_Top ~= flags["Color Shift Top Color"]  then 
					Lighting.ColorShift_Top = flags["Color Shift Top Color"]
				end 
				-- 
				if flags["Fog"] and Lighting.FogColor ~= flags["Fog Color"] then 
					Lighting.FogColor = flags["Fog Color"]
				end 
			end 
		end 
		--
		function framework:cframeSpeed()
			if flags["Speed Enabled"] and misc_flags["speed"] then 
				local Character = LocalPlayer.Character 
				local Move_Direction = Character.Humanoid.MoveDirection
				-- 
				Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame + (Move_Direction * (flags["Speed"] / 25))
			end 
		end 
		-- 
		function framework:fly() 
			if flags["Fly Enabled"] and misc_flags["fly"] then 
				local FlyPosition = Vector3.new(0, 0, 0)
				local CCV = Camera.CFrame.lookVector
				-- 
				if InputService:IsKeyDown(Enum.KeyCode.W) then
					FlyPosition = FlyPosition + CCV
				end
				-- 
				if InputService:IsKeyDown(Enum.KeyCode.S) then
					FlyPosition = FlyPosition - CCV
				end
				-- 
				if InputService:IsKeyDown(Enum.KeyCode.D) then
					FlyPosition = FlyPosition + Vector3.new(-CCV.Z, 0, CCV.X)
				end
				-- 
				if InputService:IsKeyDown(Enum.KeyCode.A) then
					FlyPosition = FlyPosition + Vector3.new(CCV.Z, 0, -CCV.x)
				end
				-- 
				if InputService:IsKeyDown(Enum.KeyCode.Space) then
					FlyPosition = FlyPosition + Vector3.new(0, 1, 0)
				end
				-- 
				if InputService:IsKeyDown(Enum.KeyCode.LeftShift) then
					FlyPosition = FlyPosition - Vector3.new(0, 1, 0)
				end
				-- 
				if FlyPosition.Unit.y == FlyPosition.Unit.y then
					LocalPlayer.Character.HumanoidRootPart.Anchored = false 
					LocalPlayer.Character.HumanoidRootPart.Velocity = FlyPosition.Unit * flags["Fly Speed"]
				else 
					LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					LocalPlayer.Character.HumanoidRootPart.Anchored = true
				end 
			end 
		end 
		--
		function framework:translateBeam(Beam)
			local Part = Beam
			if Part ~= nil then 
				local Attachments = Part:GetChildren()
				if Attachments ~= nil and Attachments[1] ~= nil and Attachments[2] ~= nil then
					local Origin = Attachments[1].WorldCFrame
					local End = Attachments[2].WorldCFrame
					-- 
					utility:CreateBeam(Origin, End, flags["Bullet Tracers Color"])
					Part.Parent = nil 
				end 
			end 
		end
        --
        function framework:selectPrediction()
            local Prediction; 
            
            local Predictions = {
                0.113,
                0.115,
                0.117,
                0.11923283912031938191231281632312637123821763333312731833,
                0.121316378910319876472890149871624,
                0.124521314351673817351423414,
                0.131314253678192031927365421456789331,
                0.1355991245213413214231231123121,
                0.138312341526738912,
                0.146432786576847627781237813281381382038198391293,
                0.1512783311111111111111111111111111111111111,
                0.15132132132132132555555555555555,
            }

            if flags["Auto Prediction"] then 
                for i = 1, #Predictions do 
                    if game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() <= i * 10 then 
                        Prediction = Predictions[i]
                    end 
                end                 
            end 

            return Prediction or tonumber(flags["Manual Prediction Value"]) or 0.1413
        end 
        --
        function framework:calculateResolverOffset() 
            local Offset; 
            local Prediction = framework:selectPrediction() 
            -- 
            if flags["Resolver"] then 
                if flags["Resolver Method"] == "Recalculate Velocity" then 
                    Offset = utility:RecalculateVelocity(utility.target) * Prediction
                elseif flags["Resolver Method"] == "Suppress Velocity" then 
                    Offset = Vector3.new(utility.target.Character.HumanoidRootPart.Velocity.X, 0, utility.target.Character.HumanoidRootPart.Velocity.Z) * Prediction
                elseif flags["Resolver Method"] == "Move Direction" then 
                    Offset = utility.target.Character.Humanoid.MoveDirection * 19.64285714289 * Prediction
                end 
            end 
            --  
            return Offset 
        end 
        -- 
        function framework:calculateNearestPart(Player, List)
            local shortestDistance = math.huge
            local closestPart
            if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Head") and Player.Character.Humanoid.Health ~= 0 and Player.Character:FindFirstChild("HumanoidRootPart") then
                for i, v in pairs(Player.Character:GetChildren()) do
                    if v:IsA("BasePart") then 
                        local pos = Camera:WorldToViewportPoint(v.Position)
                        local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y+36)).magnitude
                            if magnitude < shortestDistance and table.find(List, v.Name) then
                                closestPart = v
                                shortestDistance = magnitude
                            end
                        end
                    end 
                return closestPart
            end
        end 
        -- 
        function framework:getChecks(Player, Friend, Wall, Knocked, Grabbed)
            local Checks = true 
            --  
            if Friend and LocalPlayer:IsFriendsWith(Player.UserId) then Checks = false end 
            if Wall then Checks = utility:checkRay(Player.Character.Head, (Camera.CFrame.Position - Player.Character.Head.Position).Magnitude, Camera.CFrame.Position, (Player.Character.Head.Position - Camera.CFrame.Position).unit) end 
            if Knocked and Player.Character.BodyEffects["K.O"].Value == true then Checks = false end 
            if Grabbed and Player.Character:FindFirstChild("GRABBING_CONSTRAINT") then Checks = false end 
            --
            return Checks
        end 
		-- 
		function framework:checkForKillBot()
			if misc_flags["target"] then  
				local Killbot = flags["Kill Bot"]; 
				-- 
				return (table.find(flags["Kill Bot Settings"], "Disable on knock") and utility.target.Character.BodyEffects and utility.target.Character.BodyEffects["K.O"].Value) or not Killbot 
			end 
		end 
    end 

    -- drawings 
    do 
        utility.drawings["Tracer"] = utility:drawObject("Line", {})
		
		-- drawing lines for crosshair
		do 
			for Index = 1, 4 do
				local line = utility:drawObject("Line",{
					Visible = false,
					Color = Color3.fromRGB(255,255,255),
					Thickness = 1,
					ZIndex = 2,
					Transparency = 1
				})
				--
				crosshair_Lines[Index] = line
				-- 
				local line_1 = utility:drawObject("Line",{
					Visible = false,
					Color = Color3.fromRGB(0, 0, 0),
					Thickness = 2.5,
					ZIndex = 1,
					Transparency = 1
				})
				--
				crosshair_Outlines[Index] = line_1
			end
		end 

        -- functions for drawing the mf esp :money_face: 
        function ESP:PlayerDraw(Type, Outline, Name, Filled)
            local drawing = Drawing.new(Type)
            for i, v in pairs(Visuals["Settings"][Type]) do
                drawing[i] = v
            end
            --
            if Outline then
                drawing.Color = Color3.new(0,0,0)
                drawing.Thickness = 3
            end
            --
            if Filled then 
                drawing.Filled = true 
            end 
            --
            return drawing
        end
        -- 
        function ESP:Add(Player)
            if not Visuals["Drawings"][Player] then
                Visuals["Drawings"][Player] = {
                    Name = ESP:PlayerDraw("Text", nil, "Name", false),
                    Tool = ESP:PlayerDraw("Text", nil, "Tool", false),
                    BoxOutline = ESP:PlayerDraw("Square", true, "BoxOutline", false),
                    Box = ESP:PlayerDraw("Square", nil, "Box",false),
                    HealthOutline = ESP:PlayerDraw("Square", false, "HealthOutline", false),
                    Health = ESP:PlayerDraw("Square", nil, "Health", false),
                    HealthText = ESP:PlayerDraw("Text",nil, "HealthText", false),
                    HealthBarGradient = ESP:PlayerDraw("Image", nil, "HealthBarGradient", false), 
                    BoxFill = ESP:PlayerDraw("Square", nil, "BoxFill", true),
                    ArmorBar = ESP:PlayerDraw("Square", nil, "ArmorBar", false),
                    ArmorBarOutline = ESP:PlayerDraw("Square", nil, "ArmorBarOutline", false),
                    ArrowOutline = ESP:PlayerDraw("Triangle", false, "ArrowOutline", false),
                    Arrow = ESP:PlayerDraw("Triangle", nil, "Arrow", false),
                    Flag = ESP:PlayerDraw("Text",nil, "Flag", false)
                }
                -- 
                Visuals["Drawings"][Player]["Corners"] = {}
                -- 
                for Index = 9, 16 do
                    Visuals["Drawings"][Player]["Corners"][Index] = ESP:PlayerDraw("Line", nil, "Corners", false)
                    Visuals["Drawings"][Player]["Corners"][Index].Thickness = 3
                end
                --
                for Index = 1, 8 do
                    Visuals["Drawings"][Player]["Corners"][Index] = ESP:PlayerDraw("Line", nil, "Corners", false)
                    Visuals["Drawings"][Player]["Corners"][Index].Thickness = 0 
                end
            end
        end
		--
		for _, Player in pairs(Players:GetPlayers()) do
			if Player ~= LocalPlayer then
				ESP:Add(Player)
			end
		end
    end 

	-- hitreg 
	do 
		function HitReg:HitMarker(Gap, Color, Time) 
			local Lines = {} 
			-- 
			for i = 1, 4 do 
				Lines[i] = utility:drawObject("Line", {Color = Color, Visible = true, Transparency = 1, Thickness = 1})
			end 
			-- 
			Lines[1].From = Vector2.new(Mouse.X + Gap, (Mouse.Y + 36) + Gap)
			Lines[1].To = Vector2.new(Mouse.X + (Gap * 2.5), (Mouse.Y + 36) + (Gap * 2.5))
			--
			Lines[2].From = Vector2.new(Mouse.X + Gap, (Mouse.Y + 36) - Gap)
			Lines[2].To = Vector2.new(Mouse.X + (Gap * 2.5), (Mouse.Y + 36) - (Gap * 2.5))
			--
			Lines[3].From = Vector2.new(Mouse.X - Gap, (Mouse.Y + 36) + Gap)
			Lines[3].To = Vector2.new(Mouse.X - (Gap * 2.5), (Mouse.Y + 36) + (Gap * 2.5))
			--
			Lines[4].From = Vector2.new(Mouse.X - Gap, (Mouse.Y + 36) - Gap)
			Lines[4].To = Vector2.new(Mouse.X - (Gap * 2.5), (Mouse.Y + 36) - (Gap * 2.5))
			-- 
			delay(Time, function()
				for i = Time, 0, -0.1 do
					task.wait()
					for _, Value in next, Lines do
						Value.Transparency = i
					end
				end
				-- 
				for _, Value in next, Lines do
					Value:Remove()
				end
			end)
		end 
		-- 
		function HitReg:HitMarker3D(Gap, Color, Time, Hit) 
			local Lines = {} 
			-- 
			for i = 1, 4 do 
				Lines[i] = utility:drawObject("Line", {Color = Color, Visible = true, Transparency = 1, Thickness = 1})
			end     
			-- 
			local Loop = RunService.RenderStepped:Connect(function()
				local Position3D, OnScreen = Camera:WorldToViewportPoint(Hit)
				-- 
				Lines[1].From = Vector2.new(Position3D.X + Gap, Position3D.Y + Gap)
				Lines[1].To = Vector2.new(Position3D.X + (Gap * 2.5), Position3D.Y + (Gap * 2.5))
				--
				Lines[2].From = Vector2.new(Position3D.X + Gap, Position3D.Y - Gap)
				Lines[2].To = Vector2.new(Position3D.X + (Gap * 2.5), Position3D.Y - (Gap * 2.5))
				--
				Lines[3].From = Vector2.new(Position3D.X - Gap, Position3D.Y + Gap)
				Lines[3].To = Vector2.new(Position3D.X - (Gap * 2.5), Position3D.Y + (Gap * 2.5))
				--
				Lines[4].From = Vector2.new(Position3D.X - Gap, Position3D.Y - Gap)
				Lines[4].To = Vector2.new(Position3D.X - (Gap * 2.5), Position3D.Y - (Gap * 2.5))
				-- 
				for _, Value in next, Lines do
					Value.Visible = OnScreen
				end
			end)
			-- 
			delay(Time, function()
				for i = Time, 0, -0.1 do
					task.wait()
					for _, Value in next, Lines do
						Value.Transparency = i
					end
				end
				-- 
				for _, Value in next, Lines do
					Value:Remove()
				end
				Loop:Disconnect()
			end)
		end 
		--
		function HitReg:HitEffect(Type, Character)
			local function convert(color)
				return color.r/5, color.g/5, color.b/5
			end 
			-- 
			local function Weld(x,y)
				local W = Instance.new("Weld")
				W.Part0 = x
				W.Part1 = y
				local CJ = CFrame.new(x.Position)
				local C0 = x.CFrame:inverse()*CJ
				local C1 = y.CFrame:inverse()*CJ
				W.C0 = C0
				W.C1 = C1
				W.Parent = x
			end
			-- 
			if Type == "Confetti" then 
				task.spawn(function()
					local Confetti_Amount = 20000
					local RootPart = Character.HumanoidRootPart
					local ConfettiClone = hitmodule:Clone()
					ConfettiClone.RainbowParticles.Rate = Confetti_Amount
					ConfettiClone.Parent = workspace
					ConfettiClone.CanCollide = false
					ConfettiClone.CFrame = RootPart.CFrame
					-- 
					for i = Confetti_Amount, 0 , -(Confetti_Amount/50) do 
						task.wait()
						ConfettiClone.RainbowParticles.Rate = i
					end 
					-- 
					delay(5, function()
						ConfettiClone:Destroy()
					end)
				end)
			else 
				local Effect = Nova:Clone() 
				Effect.Parent = Character.HumanoidRootPart
				--	
				for i,v in pairs(Effect:GetChildren()) do 
					v.Rate = 0
					v.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(0.5, Color3.new(convert(flags["Hit Effect Settings"]))),ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0)),})
					v:Emit()
				end 
				-- 	
				delay(2, function()
					Effect:Destroy()
				end)
			end 
		end 
		-- 
		function HitReg:HitSound(Id, Volume, Pitch)
			local Sound = Instance.new("Sound", Workspace);
			-- 
			Sound.SoundId = "rbxassetid://".. Id ..""
			Sound.Volume = Volume
			
			Sound:Play()
			Sound.Ended:Connect(function()
				Sound:Destroy()
				
			end)	
		end 
	end 

    for i,v in pairs(LocalPlayer.Character:GetChildren()) do 
        if v:IsA("BasePart") then 
            table.insert(utility.bodyParts, v.Name)
        end 
    end 

	-- tweens 
	do
		Tween.EasingStyles = {
			[Enum.EasingStyle.Linear] = {
				[Enum.EasingDirection.In] = function(Delta)
					return Delta
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return Delta
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					return Delta
				end
			},
			[Enum.EasingStyle.Cubic] = {
				[Enum.EasingDirection.In] = function(Delta)
					return Delta ^ 3
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return ((Delta - 1) ^ 3) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return (4 * Delta ^ 3)
					elseif 0.5 <= Delta and Delta <= 1 then
						return (4 * (Delta - 1) ^ 3) + 1
					end
				end
			},
			[Enum.EasingStyle.Quad] = {
				[Enum.EasingDirection.In] = function(Delta)
					return Delta ^ 2
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return (-(Delta - 1) ^ 2) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return (2 * Delta ^ 2)
					elseif 0.5 <= Delta and Delta <= 1 then
						return -(2 * (Delta - 1) ^ 2) + 1
					end
				end
			},
			[Enum.EasingStyle.Quart] = {
				[Enum.EasingDirection.In] = function(Delta)
					return Delta ^ 4
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return (-(Delta - 1) ^ 4) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return (8 * Delta ^ 4)
					elseif 0.5 <= Delta and Delta <= 1 then
						return -(8 * (Delta - 1) ^ 4) + 1
					end
				end
			},
			[Enum.EasingStyle.Quint] = {
				[Enum.EasingDirection.In] = function(Delta)
					return Delta ^ 5
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return ((Delta - 1) ^ 5) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return (16 * Delta ^ 5)
					elseif 0.5 <= Delta and Delta <= 1 then
						return (16 * (Delta - 1) ^ 5) + 1
					end
				end
			},
			[Enum.EasingStyle.Sine] = {
				[Enum.EasingDirection.In] = function(Delta)
					return Sin(((Pi / 2) * Delta) - (Pi / 2)) + 1
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return Sin((Pi / 2) * Delta)
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					return (0.5 * Sin((Pi * Delta) - (Pi / 2))) + 0.5
				end
			},
			[Enum.EasingStyle.Exponential] = {
				[Enum.EasingDirection.In] = function(Delta)
					return (2 ^ ((10 * Delta) - 10)) - 0.001
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return 1.001 * (-2 ^ -(10 * Delta)) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return 0.5 * (2 ^ ((20 * Delta) - 10)) - 0.0005
					elseif 0.5 <= Delta and Delta <= 1 then
						return 0.50025 * (-2 ^ (-(20 * Delta) + 10)) + 1
					end
				end
			},
			[Enum.EasingStyle.Back] = {
				[Enum.EasingDirection.In] = function(Delta)
					return (Delta * Delta) * (Delta * (1.70158 + 1) - 1.70158)
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return ((Delta - 1) ^ 2) * ((Delta - 1) * (1.70158 + 1) + 1.70158) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return (2 * (Delta * Delta)) * ((2 * Delta) * (2.5949095 + 1) - 2.5949095)
					elseif 0.5 <= Delta and Delta <= 1 then
						return (0.5 * ((2 * Delta) - 2) ^ 2) * (((2 * Delta) - 2) * (2.5949095 + 1) + 2.5949095) + 1
					end
				end
			},
			[Enum.EasingStyle.Bounce] = {
				[Enum.EasingDirection.In] = function(Delta)
					if 0 <= Delta and Delta <= (1 / 2.75) then
						return 7.5625 * (Delta * Delta)
					elseif (1 / 2.75) <= Delta and Delta <= (2 / 2.75) then
						return 7.5625 * (Delta - (1.5 / 2.75)) ^ 2 + 0.75
					elseif (2 / 2.75) <= Delta and Delta <= (2.5 / 2.75) then
						return 7.5625 * (Delta - (2.25 / 2.75)) ^ 2 + 0.9375
					elseif (2.5 / 2.75) <= Delta and Delta <= 1 then
						return 7.5625 * (Delta - (2.625 / 2.75)) ^ 2 + 0.984375
					end
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					if 0 <= Delta and Delta <= (0.25 / 2.75) then
						return -7.5625 * (1 - Delta - (2.625 / 2.75)) ^ 2 + 0.015625
					elseif (0.25 / 2.75) <= Delta and Delta <= (0.75 / 2.75) then
						return -7.5625 * (1 - Delta - (2.25 / 2.75)) ^ 2 + 0.0625
					elseif (0.75 / 2.75) <= Delta and Delta <= (1.75 / 2.75) then
						return -7.5625 * (1 - Delta - (1.5 / 2.75)) ^ 2 + 0.25
					elseif (1.75 / 2.75) <= Delta and Delta <= 1 then
						return 1 - 7.5625 * (1 - Delta) ^ 2
					end
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= (0.125 / 2.75) then
						return 0.5 * (-7.5625 * (1 - (2 * Delta) - (2.625 / 2.75)) ^ 2 + 0.015625)
					elseif (0.125 / 2.75) <= Delta and Delta <= (0.375 / 2.75) then
						return 0.5 * (-7.5625 * (1 - (2 * Delta) - (2.25 / 2.75)) ^ 2 + 0.0625)
					elseif (0.375 / 2.75) <= Delta and Delta <= (0.875 / 2.75) then
						return 0.5 * (-7.5625 * (1 - (2 * Delta) - (1.5 / 2.75)) ^ 2 + 0.25)
					elseif (0.875 / 2.75) <= Delta and Delta <= 0.5 then
						return 0.5 * (1 - 7.5625 * (1 - (2 * Delta)) ^ 2)
					elseif 0.5 <= Delta and Delta <= (1.875 / 2.75) then
						return 0.5 + 3.78125 * ((2 * Delta) - 1) ^ 2
					elseif (1.875 / 2.75) <= Delta and Delta <= (2.375 / 2.75) then
						return 3.78125 * ((2 * Delta) - (4.25 / 2.75)) ^ 2 + 0.875
					elseif (2.375 / 2.75) <= Delta and Delta <= (2.625 / 2.75) then
						return 3.78125 * ((2 * Delta) - (5 / 2.75)) ^ 2 + 0.96875
					elseif (2.625 / 2.75) <= Delta and Delta <= 1 then
						return 3.78125 * ((2 * Delta) - (5.375 / 2.75)) ^ 2 + 0.9921875
					end
				end
			},
			[Enum.EasingStyle.Elastic] = {
				[Enum.EasingDirection.In] = function(Delta)
					return (-2 ^ (10 * (Delta - 1))) * Sin(((2 * Pi) * (Delta - 1 - (0.3 / 4))) / 0.3)
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return (2 ^ (-10 * Delta)) * Sin(((2 * Pi) * (Delta - (0.3 / 4))) / 0.3) + 1
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return -0.5 * (2 ^ ((20 * Delta) - 10)) * Sin(((2 * Pi) * ((2 * Delta) - 1.1125)) / 0.45)
					elseif 0.5 <= Delta and Delta <= 1 then
						return 0.5 * (2 ^ ((-20 * Delta) + 10)) * Sin(((2 * Pi) * ((2 * Delta) - 1.1125)) / 0.45) + 1
					end
				end
			},
			[Enum.EasingStyle.Circular] = {
				[Enum.EasingDirection.In] = function(Delta)
					return -Sqrt(1 - Delta ^ 2) + 1
				end,
				[Enum.EasingDirection.Out] = function(Delta)
					return Sqrt(-(Delta - 1) ^ 2 + 1)
				end,
				[Enum.EasingDirection.InOut] = function(Delta)
					if 0 <= Delta and Delta <= 0.5 then
						return -Sqrt(-Delta ^ 2 + 0.25) + 0.5
					elseif 0.5 <= Delta and Delta <= 1 then
						return Sqrt(-(Delta - 1) ^ 2 + 0.25) + 0.5
					end
				end
			}
		}
	end
end

-- 
local crosshair_lineOffsets = utility:generateAngles(4); 
-- 
local Window = Library:Window({Size = UDim2.new(0,565,0,615)})
        local rage = Window:Page({Name = "Rage", Weapons = true})
        local legit = Window:Page({Name = "Legit", Weapons = true})
		local esp = Window:Page({Name = "Visuals"})
		local misc = Window:Page({Name = "Misc"})
        local Config = Window:Page({Name = "Config", Weapons = true})
        --
        do -- Rage
			-- left
			local main = rage:Weapon({Icon = "rbxassetid://16968419831"})
			local visualAim = rage:Weapon({Icon = "rbxassetid://17043302959"})
			--
            local Main = main:Section({Name = "Main", Size = 330})
				Main:Toggle({Name = "Enabled", Flag = "Silent Enabled", Risk = true})
				Main:Keybind({Name = "Key", Flag = "Silent_Bind", Mode = "Toggle", callback = function()
					misc_flags["target"] = not misc_flags["target"]
					framework:selectTarget(); 
				end})
				-- 	
				Main:Toggle({Name = "Kill Bot", Flag = "Kill Bot", Risk = true})
				Main:Dropdown({Name = "Kill Bot", Flag = "Kill Bot Settings", Options = {"Disable on knock"}, Max = 9e9})
				-- 
				local Main_1 = main:Section({Name = "Settings", Size = 330})
				Main_1:Toggle({Name = "Look At", Flag = "Look At"})
				Main_1:Toggle({Name = "Auto Shoot", Flag = "Auto Shoot"})
				Main_1:Toggle({Name = "Spectate", Flag = "Spectate"})
				Main_1:Toggle({Name = "Notify", Flag = "Flag"})

				local Main_1 = main:Section({Name = "Methods", Size = 330})
				Main_1:Toggle({Name = "Aim Viewer Bypass", Flag = "Aim Viewer Bypass"})
				Main_1:Toggle({Name = "Resolver", Flag = "Resolver"})
				Main_1:Dropdown({Name = "Resolver Method", Flag = "Resolver Method", Options = {"Recalculate Velocity", "Suppress Velocity", "Move Direction"}, Default = "Recalculate Velocity"})
				
				local Main_2 = visualAim:Section({Name = "Visuals", Size = 330})
				local line1 = Main_2:Toggle({Name = "Line", Flag = "Line Enabled"})
				line1:Colorpicker({Default = Color3.fromRGB(255,0,0), Flag = "Line Settings"});
				Main_2:Slider({Name = "Thickness", Flag = 'Line Thickness', Min = 0, Max = 10, Default = 1, Decimals = 0.01, Callback = function()
					utility.drawings["Tracer"].Thickness = flags["Line Thickness"]
				end})
				local highlight = Main_2:Toggle({Name = "Highlight", Flag = "Highlight Enabled"})
				highlight:Colorpicker({Default = Color3.fromRGB(0,255,0), Alpha = 0.5, Flag = "Highlight Fill Color", Callback = function(a,b) print(a,b) end});
				highlight:Colorpicker({Default = Color3.fromRGB(0,125,0), Flag = "Highlight Outline Color"});
				local backtrack = Main_2:Toggle({Name = "Backtrack", Flag = "Back Track Enabled"})
				backtrack:Colorpicker({Default = Color3.fromRGB(255, 0, 0), alpha = 0.65, Flag = "Back Track Settings"});
				Main_2:Dropdown({Name = "Method", Flag = "Back Track Method", Options = {"Clone", "Follow"}, Default = "Follow"})
				Main_2:Dropdown({Name = "Material", Flag = "Back Track Material", Options = {"Neon", "Plastic", "ForceField"}, Default = "Neon"})
				Main_2:Slider({Name = "Delay", Flag = 'Back Track Delay', Min = 0, Max = 1, Default = 1, Decimals = 0.05})
			-- right 
			local Misc = main:Section({Name = "Prediction", Size = 330, Side = "Right"})
				Misc:Toggle({Name = "Auto Prediction", Flag = "Auto Prediction"})
				Misc:Toggle({Name = "Jump Prediction", Flag = "Jump Prediction"})
				Misc:Textbox({Name = "Prediction", Flag = "Manual Prediction Value", Placeholder = "Prediction"})
				Misc:Textbox({Name = "Jump Offset", Flag = "Manual Offset Value", Placeholder = "Jump Offset"})
				Misc:Dropdown({Name = "Hit-Part", Flag = "Single Hit Part", Options = utility.bodyParts, Default = "HumanoidRootPart"})
				Misc:Toggle({Name = "Nearest Part", Flag = "Nearest Part"})
				Misc:Dropdown({Name = "Closest Hit Part", Flag = "Closest Hit Part", Options = utility.bodyParts, Default = {"HumanoidRootPart"}, Max = 9e9})
				
				local Misc_1 = main:Section({Name = "Checks", Size = 330, Side = "Right"})
				Misc_1:Dropdown({Name = "Checks", Flag = "Silent Checks", Options = {"Knocked Check", "Wall Check", "Friend Check", "Grabbed Check"}, Max = 9e9})

				local Misc_2 = main:Section({Name = "Target Strafe", Size = 330, Side = "Left"})
				Misc_2:Toggle({Name = "Enabled", Flag = "Target Strafe Enabled", Risk = true})
				Misc_2:Slider({Name = "Radius", Flag = 'Target Strafe Distance', Min = -15, Max = 15, Default = 10, Decimals = 1})
				Misc_2:Slider({Name = "Speed", Flag = 'Target Strafe Speed', Min = -15, Max = 15, Default = 10, Decimals = 1})
				Misc_2:Slider({Name = "Height", Flag = 'Target Strafe Height', Min = -15, Max = 15, Default = 0, Decimals = 1})
		end
        --
		do -- Legit
			local mainsets = legit:Weapon({Icon = "rbxassetid://16968419831"}) -- Main Settings
			local ar = legit:Weapon({Icon = "rbxassetid://16961106761"}) -- ARs, Rifles
			local shotgun = legit:Weapon({Icon = "rbxassetid://16960320367"}) -- Shotguns
			local revolver = legit:Weapon({Icon = "rbxassetid://16960322913"}) -- Revolver
			local pistols = legit:Weapon({Icon = "rbxassetid://16960326655"}) -- Silencer 
            --
			local SilentAim = mainsets:Section({Name = "Silent Aim", Size = 330})




		end
		-- 	Visuals
		do 
			-- left
			local Main = esp:Section({Name = "Main", Size = 330})
				Main:Toggle({Name = "Enabled", Flag = "PlayerESP_Enabled"})
				Main:Slider({Name = "Distance", Flag = 'PlayerESP_ArrowRadius', Min = 0, Max = 5000, Default = 5000, Decimals = 5})
				local box = Main:Toggle({Name = "Boxes", Flag = "PlayerESP_Box"})
				box:Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "PlayerESP_Box_Color1"});
				box:Colorpicker({Default = Color3.fromRGB(0, 0, 0), Flag = "PlayerESP_Box_Color2"});
				Main:Toggle({Name = "Box-Fill", Flag = "PlayerESP_BoxFill"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Transparency = 0.7, Flag = "PlayerESP_BoxFill_Color"});
				Main:Dropdown({Name = "Box Type", Flag = "PlayerESP_Box_Type", Options = {"Bounding", "Corner"}, Default = "Bounding"})
				Main:Toggle({Name = "Name", Flag = "PlayerESP_Name"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "PlayerESP_Name_Color"});
				Main:Toggle({Name = "Weapons", Flag = "PlayerESP_Weapon"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "PlayerESP_Weapon_Color"});
				Main:Toggle({Name = "Flags", Flag = "PlayerESP_Flags"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "PlayerESP_FlagsColor"});
				Main:Dropdown({Name = "Flags", Flag = "PlayerESP_Flag_Options", Options = {"Distance", "Knocked"}, Max = 9e9})


				local Arrow = Main:Toggle({Name = "Enabled", Flag = "PlayerESP_Arrows"})
				Main:Toggle({Name = "Dynamic", Flag = "PlayerESP_ArrowsDynamic"})
				Arrow:Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "PlayerESP_ArrowColor"});
				Arrow:Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "PlayerESP_ArrowOutline"});
				Main:Slider({Name = "Radius", Flag = 'PlayerESP_ArrowRadius', Min = 0, Max = 100, Default = 20, Decimals = 1})
				Main:Slider({Name = "Arrow Size", Flag = 'PlayerESP_ArrowSize', Min = 0, Max = 100, Default = 20, Decimals = 1})

				local health = Main:Toggle({Name = "Health Bar", Flag = "PlayerESP_HealthBar"})
				health:Colorpicker({Default = Color3.fromRGB(0,255,0), Flag = "PlayerESP_HealthBar_Color_Higher"});
				health:Colorpicker({Default = Color3.fromRGB(255,0,0), Flag = "PlayerESP_HealthBar_Color_Low"});
				Main:Toggle({Name = "Gradient", Flag = "PlayerESP_HealthBarGradient"})
				Main:Toggle({Name = "Health Number", Flag = "PlayerESP_HealthNumber"})
				Main:Toggle({Name = "Armor Bar", Flag = "PlayerESP_ArmorBar"}):Colorpicker({Default = Color3.fromRGB(0,0,255), Flag = "PlayerESP_ArmorBarColor"});
			
			local Main_123 = esp:Section({Name = "Lighting", Size = 330, Side = "Right"})
				Main_123:Toggle({Name = "Master Switch", Flag = "Master Switch", Callback = function()
					for i,v in pairs(Lighting_Save) do 
						Lighting[i] = v 
					end 
				end})
				Main_123:Toggle({Name = "Clock Time", Flag = "Clock Time Enabled"})
				Main_123:Slider({Name = "Distance", Flag = 'Clock Time', Min = 0, Max = 24, Default = 12, Decimals = 0.1})
				Main_123:Toggle({Name = "Color Shift Bottom", Flag = "Color Shift Bottom"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Color Shift Bottom Color"});
				Main_123:Toggle({Name = "Ambient", Flag = "Ambient"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Ambience Color"});
				Main_123:Toggle({Name = "Outdoor Ambience", Flag = "Outdoor Ambience"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Outdoor Ambience color"});
				Main_123:Toggle({Name = "Brightness", Flag = "Brightness Enabled"})
				Main_123:Slider({Name = "Brightness", Flag = 'Brightness', Min = 0, Max = 20, Default = 3, Decimals = 1})
				Main_123:Toggle({Name = "Color Shift Top", Flag = "Color Shift Top"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Color Shift Top Color"});
				Main_123:Toggle({Name = "Fog", Flag = "Fog"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Fog Color"});



			local Main_2 = esp:Section({Name = "Crosshair", Size = 330, Side = "Right"})
				Main_2:Toggle({Name = "Crosshair", Flag = "Crosshair", Callback = function()
					for i = 1, #crosshair_Lines do
						crosshair_Lines[i].Visible = false; 
					end 
					--
					for i = 1, #crosshair_Outlines do
						crosshair_Outlines[i].Visible = false; 
					end 
				end}):Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "Crosshair Color", Callback = function()
					for i = 1, #crosshair_Lines do
						crosshair_Lines[i].Color = flags["Crosshair Color"]; 
					end 
				end});
				Main_2:Toggle({Name = "Always Rotating", Flag = "Crosshair Always Rotating"})
				Main_2:Slider({Name = "Speed", Flag = 'Crosshair Speed', Min = 0, Max = 24, Default = 12, Decimals = 0.1})
				Main_2:Slider({Name = "Gap Size", Flag = 'Crosshair Gap Size', Min = 0, Max = 30, Default = 12, Decimals = 1})
				Main_2:Slider({Name = "Length", Flag = 'Crosshair Length', Min = 0, Max = 30, Default = 12, Decimals = 1})
				Main_2:Slider({Name = "Thickness", Flag = 'Crosshair Thickness', Min = 0.1, Max = 5, Default = 1.5, Decimals = 0.1, Callback = function()
					for i = 1, #crosshair_Lines do
						crosshair_Lines[i].Thickness = flags["Crosshair Thickness"]; 
						crosshair_Outlines[i].Thickness = flags["Crosshair Thickness"] * 2.5; 
					end 
				end})
				Main_2:Slider({Name = "Sides", Flag = 'Crosshair Sides', Min = 1, Max = 10, Default = 4, Decimals = 1, callback = function()
					crosshair_LineAmount = flags["Crosshair Sides"]
					-- 
					crosshair_lineOffsets = utility:generateAngles(flags["Crosshair Sides"])
					--
					for i = 1, #crosshair_Lines do
						crosshair_Lines[i]:Remove(); 
						crosshair_Lines[i] = nil; 
					end 
					-- 
					for i = 1, #crosshair_Outlines do
						crosshair_Outlines[i]:Remove(); 
						crosshair_Outlines[i] = nil; 
					end 
					-- 
					do 
						for Index = 1, flags["Crosshair Sides"] do
							local line = utility:drawObject("Line",{
								Visible = false,
								Color = flags["Crosshair Color"],
								Thickness = flags["Crosshair Thickness"],
								ZIndex = 2,
								Transparency = 1
							})
							--
							crosshair_Lines[Index] = line
							--
							local line_1 = utility:drawObject("Line",{
								Visible = false,
								Color = Color3.fromRGB(0, 0, 0),
								Thickness = flags["Crosshair Thickness"] * 2.5,
								ZIndex = 1,
								Transparency = 1
							})
							-- 
							crosshair_Outlines[Index] = line_1
						end
					end 
				end})
				Main_2:Dropdown({Name = "Sizing Easing Style", Flag = "Crosshair Sizing Easing Style", Options = {"Off", "Linear", "Cubic", "Quad", "Quart", "Quint", "Sine", "Exponential", "Back", "Bounce", "Elastic", "Circular"}, Default = "Off"})
				Main_2:Dropdown({Name = "Speed Easing Style", Flag = "Crosshair Speed Easing Style", Options = {"Off", "Linear", "Cubic", "Quad", "Quart", "Quint", "Sine", "Exponential", "Back", "Bounce", "Elastic", "Circular"}, Default = "Off"})
		end 
		--
		do -- Misc
			local Main = misc:Section({Name = "General", Size = 330})
				Main:Toggle({Name = "Speed", Flag = "Speed Enabled"}):Keybind({Name = "Speed", Flag = "Silent_Bind", Mode = "Toggle", Callback = function()
					misc_flags["speed"] = not misc_flags["speed"]
				end})
				Main:Slider({Name = "Speed", Flag = 'Speed', Min = 0, Max = 100, Default = 20, Decimals = 1})
				Main:Toggle({Name = "Fly", Flag = "Fly Enabled"}):Keybind({Name = "Fly", Flag = "Silent_Bind", Mode = "Toggle", Callback = function()
					misc_flags["fly"] = not misc_flags["fly"]
				end})	
				Main:Slider({Name = "Fly", Flag = 'Fly Speed', Min = 0, Max = 100, Default = 20, Decimals = 1})
				Main:Toggle({Name = "Bullet Tracers", Flag = "Bullet Tracers"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Bullet Tracers Color"});
				Main:Slider({Name = "Lifetime", Flag = 'Tracers Life Time', Min = 0, Max = 10, Default = 2, Decimals = 0.1})
			
			local Main_3 = misc:Section({Name = "Hit Effects", Size = 330, Side = "Right"})
				Main_3:Toggle({Name = "Hit Marker", Flag = "Hit Marker"}):Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "Hit Marker Settings"});
				Main_3:Toggle({Name = "3D Hit Marker", Flag = "3D Hit Marker"}):Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "3D Hit Marker Settings"});
				Main_3:Slider({Name = "Fading Time", Flag = 'Hit Markers Time', Min = 0.1, Max = 10.0, Default = 5.0, Decimals = 0.1})
				Main_3:Toggle({Name = "Hit Sounds", Flag = "Hit Sounds"})
				Main_3:Dropdown({Name = "Hit Sounds", Flag = "Hit Sounds Sound", Options = sfx_names, Default = "Neverlose"})
				Main_3:Slider({Name = "Volume", Flag = 'Hit Sounds Volume', Min = 0.1, Max = 10.0, Default = 5.0, Decimals = 0.1})
				Main_3:Toggle({Name = "Hit Effects", Flag = "Hit Effects"}):Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "Hit Effect Settings"});
				Main_3:Dropdown({Name = "Hit Effects", Flag = "Hit Effects Option", Options = {"Nova", "Confetti"}, Default = "Confetti"})
				Main_3:Toggle({Name = "Hit Chams", Flag = "Hit Chams"}):Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "Hit Chams Settings"});
				Main_3:Dropdown({Name = "Material", Flag = "Hit Chams Material", Options = {"ForceField", "Neon", "Plastic"}, Default = "Neon"})
				Main_3:Slider({Name = "Fading Time", Flag = 'Hit Chams Fading Time', Min = 0.1, Max = 10.0, Default = 5.0, Decimals = 0.1})
				--[[local Highlight = Main_3:Toggle({Name = "Highlight Hit Chams", Flag = "Highlight Hit Chams"})
				Highlight:Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "Hit Chams Fill"});
				Highlight:Colorpicker({Default = Color3.fromRGB(255,255,255), Flag = "Hit Chams Outline"});]]
				local stuffforself = misc:Section({Name = "Self", Size = 330})

				stuffforself:Toggle({Name = "Clone", Callback = function(Boolean)  
					getgenv().selfchamfollow = Boolean

					if getgenv().selfchamfollow == true then
						repeat
							game.Players.LocalPlayer.Character.Archivable = true
							local Clone = game.Players.LocalPlayer.Character:Clone()
							for _, Obj in next, Clone:GetDescendants() do
								if
									Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or
										Obj:IsA("Script") or
										Obj:IsA("Decal")
								 then
									Obj:Destroy()
								elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
									if Obj.Transparency == 1 then
										Obj:Destroy()
									else
										Obj.CanCollide = false
										Obj.Anchored = true
										Obj.Material = getgenv().clonematerial
										Obj.Color = getgenv().selfchamfollowingcolor
										Obj.Transparency = 0
										Obj.Size = Obj.Size + Vector3.new(0.03, 0.03, 0.03)
									end
								end
								pcall(
									function()
										Obj.CanCollide = false
									end
								)
							end
							Clone.Parent = game.Workspace
							wait(getgenv().selfchamfollowwait)
							Clone:Destroy()
						until getgenv().selfchamfollow == false
					end

				end}):Colorpicker({Default = Color3.fromRGB(255,255,255), Callback = function(Color) getgenv().selfchamfollowingcolor = Color  end});
				stuffforself:Slider({Name = "Delay", Callback = function(state) getgenv().selfchamfollowwait = state end, Min = 0.1, Max = 10.0, Default = 5.0, Decimals = 0.1})
				stuffforself:Dropdown({Name = "Material", Options = {"ForceField", "Neon", "Glass", "SmoothPlastic"}, Default = "ForceField", Callback = function(state) getgenv().clonematerial = state  end})






			    stuffforself:Toggle({Name = "Self Chams", Callback = function(x) 
					forcefield = x
					while wait() do
						if forcefield then
							Players = game.Players.LocalPlayer
						
							Players.Character.Head.Material  = "ForceField"
						Players.Character.UpperTorso.Material = "ForceField"
						Players.Character.LeftHand.Material = "ForceField"
						Players.Character.RightHand.Material = "ForceField"
						Players.Character.LeftLowerArm.Material = "ForceField"
						Players.Character.RightLowerArm.Material = "ForceField"
						Players.Character.RightUpperArm.Material = "ForceField"
						Players.Character.LeftUpperArm.Material = "ForceField"
						Players.Character.LeftFoot.Material = "ForceField"
						Players.Character.LeftLowerLeg.Material = "ForceField"
						Players.Character.RightLowerLeg.Material = "ForceField"
						Players.Character.LowerTorso.Material = "ForceField"
						Players.Character.RightUpperLeg.Material = "ForceField"
						Players.Character.LeftUpperLeg.Material = "ForceField"
						Players.Character.Head.Material = "ForceField"
						Players.Character.RightFoot.Material = "ForceField"
						Players.Character['Body Colors'].LeftArmColor3 = colorgunchamdsdaf
						Players.Character['Body Colors'].RightArmColor3 = colorgunchamdsdaf
						Players.Character['Body Colors'].LeftLegColor3 = colorgunchamdsdaf
						Players.Character['Body Colors'].RightLegColor3 = colorgunchamdsdaf
						Players.Character['Body Colors'].HeadColor3 = colorgunchamdsdaf
						Players.Character['Body Colors'].TorsoColor3 = colorgunchamdsdaf
					
							for i,v in next, game:GetService('Players').LocalPlayer.Character:GetChildren() do
								if v:IsA('Accessory') then
									v.Handle.Material = "ForceField"
									v.Handle.Color = colorgunchamdsdaf
							 end
							 end
						else
							game.Players.LocalPlayer.Character.LeftHand.Material = "Plastic"
							game.Players.LocalPlayer.Character.RightHand.Material = "Plastic"
							game.Players.LocalPlayer.Character.LeftLowerArm.Material = "Plastic"
							game.Players.LocalPlayer.Character.RightLowerArm.Material = "Plastic"
							game.Players.LocalPlayer.Character.LeftUpperArm.Material = "Plastic"
							game.Players.LocalPlayer.Character.RightUpperArm.Material = "Plastic"
							game.Players.LocalPlayer.Character.LeftFoot.Material = "Plastic"
							game.Players.LocalPlayer.Character.RightFoot.Material = "Plastic"
							game.Players.LocalPlayer.Character.LeftLowerLeg.Material = "Plastic"
							game.Players.LocalPlayer.Character.RightLowerLeg.Material = "Plastic"
							game.Players.LocalPlayer.Character.UpperTorso.Material = "Plastic"
							game.Players.LocalPlayer.Character.LowerTorso.Material = "Plastic"
							game.Players.LocalPlayer.Character.LeftUpperLeg.Material = "Plastic"
							game.Players.LocalPlayer.Character.RightUpperLeg.Material = "Plastic"
							game.Players.LocalPlayer.Character.Head.Material = "Plastic"
					
							for i,v in next, game:GetService('Players').LocalPlayer.Character:GetChildren() do
								if v:IsA('Accessory') then
									v.Handle.Material = "Plastic"
							 end
							 end
					
						end
					end
				end}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Callback = function(x) 
					colorgunchamdsdaf = x
				end});

			    stuffforself:Toggle({Name = "Gun Chams", Callback = function(callback) 
					if callback then
						nutssackquak =
							game:GetService("RunService").heartbeat:Connect(
							function()
								local Client = game.GetService(game, "Players").LocalPlayer
								Client.Character:FindFirstChildOfClass("Tool").Default.Material =
									Enum.Material.ForceField
								Client.Character:FindFirstChildOfClass("Tool").Default.BrickColor =
									getgenv().nutssackcolor
							end
						)
					else
						if nutssackquak then
							nutssackquak:Disconnect()
						end
						local Client = game.GetService(game, "Players").LocalPlayer
						Client.Character:FindFirstChildOfClass("Tool").Default.Material = Enum.Material.Plastic
					end
				end}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Callback = function(Color) getgenv().nutssackcolor = BrickColor.new(Color)end});


			    stuffforself:Toggle({Name = "Cone Hat", Callback = function(state) settings.enabled = state end}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Callback = function(color) settings.color = color end});
				stuffforself:Slider({Name = "Height", Min = 0.1, Max = 10.0, Default = 0.75, Decimals = 0.01, Callback = function(state) settings.height = state end})
				stuffforself:Slider({Name = "Radius", Min = 0.1, Max = 10.0, Default = 1, Decimals = 0.01, Callback = function(state) settings.radius = state end})
				stuffforself:Slider({Name = "Sides", Min = 0.1, Max = 100.0, Default = 25, Decimals = 0.1, Callback = function(state) settings.sides = state end})
				stuffforself:Toggle({Name = "Rainbow", Callback = function(state) settings.rainbow = state end})
				stuffforself:Slider({Name = "Hat Transparency", Min = 0.1, Max = 1, Default = 0.35, Decimals = 0.01, Callback = function(state) settings.hatTransparency = state end})
				stuffforself:Slider({Name = "Circle Transparency", Min = 0.1, Max = 1, Default = 1, Decimals = 0.01, Callback = function(state) settings.circleTransparency = state end})



		end

		--
		do -- Config
			local menu = Config:Weapon({Icon = "rbxassetid://16959463854"}) -- Menu settings
			local lua = Config:Weapon({Icon = "rbxassetid://16961582365"}) -- lua thing
			local user = Config:Weapon({Icon = "rbxassetid://8547269749"}) -- User Settings
			--
            local Menu = menu:Section({Name = "Menu", Size = 120})
            local Cfgs = menu:Section({Name = "Configs", Size = 200, Side = "Right"})
            --
            Menu:Keybind({Name = "Menu key", Flag = "MenuKey", Default = Enum.KeyCode.End, Mode = "Toggle", Callback = function() Library:SetOpen(not Library.Open) end})
            Menu:Colorpicker({Name = "Accent", Flag = "MenuAccent", Default = Library.Accent, Callback = function(s) Library:ChangeAccent(s) end})
            Menu:Dropdown({Name = "Accent Effect", Flag = "AccentEffect", Options = {"None", "Rainbow", "Shift", "Reverse Shift"}, Default = "None", Callback = function(State) if State == "None" then Library:ChangeAccent(Flags["MenuAccent"]) end end})
            Menu:Slider({Name = "Effect Length", Flag = "EffectLength", Min = 1, Max = 360, Default = 40})
            --
            local CFGList = Cfgs:Dropdown({Name = "Cfg List", Flag = "SettingConfigurationList", Options = {}})
            Cfgs:Textbox({Name = "Config Name", Flag = "SettingsConfigurationName", Placeholder = "Config name"})
            --
            local CurrentList = {};
            if not isfolder("xyn") then 
                makefolder("xyn")
            end 
            if not isfolder("xyn/Configs") then 
                makefolder("xyn/Configs")
            end 
            local function UpdateConfigList()
                local List = {};
                for idx, file in ipairs(listfiles("xyn/Configs")) do
                    local FileName = file:gsub("xyn/Configs\\", ""):gsub(".cfg", "")
                    List[#List + 1] = FileName;
                end;
    
                local IsNew = #List ~= #CurrentList
                if not IsNew then
                    for idx, file in ipairs(List) do
                        if file ~= CurrentList[idx] then
                            IsNew = true;
                            break;
                        end;
                    end;
                end;
    
                if IsNew then
                    CurrentList = List;
                    CFGList:Refresh(CurrentList);
                end;
            end;
            --
            Cfgs:Button({Name = "Create", Callback = function()
                local Success, Error = pcall(function()
                    local ConfigName = Flags.SettingsConfigurationName;
                    if ConfigName == "" or isfile("xyn/Configs/" .. ConfigName .. ".cfg") then
                        return;
                    end;
                    writefile("xyn/Configs/" .. ConfigName .. ".cfg", "");
                    UpdateConfigList();
                end)
            end})
            Cfgs:Button({Name = "Save", Callback = function()
                local Success, Error = pcall(function()
                    local SelectedConfig = Flags.SettingConfigurationList;
                    if SelectedConfig then
                        writefile("xyn/Configs/" .. SelectedConfig .. ".cfg", Library:GetConfig())
                    end;
                end);
            end})
            Cfgs:Button({Name = "Load", Callback = function()
                local Success, Error = pcall(function()
                    local SelectedConfig = Flags.SettingConfigurationList;
                    if SelectedConfig then
                        Library:LoadConfig(readfile("xyn/Configs/" .. SelectedConfig .. ".cfg"))
                    end
                end)
            end})
            Cfgs:Button({Name = "Delete", Callback = function()
                local SelectedConfig = Flags.SettingConfigurationList;
                if SelectedConfig then
                    delfile("xyn/Configs/" .. SelectedConfig .. ".cfg")
                end
                UpdateConfigList();
            end})
            Cfgs:Button({Name = "Refresh", Callback = function()
                UpdateConfigList();
            end})
            UpdateConfigList();
        end
		-- Start off pasting
		do 
			getgenv().offset = nil; 
			local prediction; 
			local partClosest; 
			--
			local checks; 
			local antiCheattick = 0; 
			local CursorSize = 0; 
			framework["connections"]["Main Loop"] = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(Fps)
				-- 
				framework:worldVisuals()
				-- 
				if LocalPlayer.Character then 
					framework:cframeSpeed() 
					framework:fly()
				end 
				function utility:TargetColor(color)
					PlayerESP_Box_Color1 = Color3.fromRGB(255, 0, 0)
				end

				if utility.target and utility:ValidateClient(utility.target) and misc_flags["target"] then
					prediction = framework:selectPrediction()
					--
					if flags["Resolver"] then 
						offset = framework:calculateResolverOffset(); 
					end       
					-- 
					if flags["Nearest Part"] then 
						partClosest = framework:calculateNearestPart(utility.target, flags["Closest Hit Part"]).Name
					end 
					--
					checks = framework:getChecks(utility.target, table.find(flags["Silent Checks"], "Friend Check"), table.find(flags["Silent Checks"], "Wall Check"), table.find(flags["Silent Checks"], "Knocked Check"), table.find(flags["Silent Checks"], "Grabbed Check"));
					-- 
					if flags["Line Enabled"] then 
						local Position, OnScreen = Camera:WorldToViewportPoint(utility.target.Character.HumanoidRootPart.Position);
						-- 
						utility.drawings["Tracer"].Visible = OnScreen and true or false  
						utility.drawings["Tracer"].From = Vector2.new(Mouse.X, Mouse.Y + 36)
						utility.drawings["Tracer"].To = Vector2.new(Position.X, Position.Y)
						utility.drawings["Tracer"].Color = flags["Line Settings"]
						utility.drawings["Tracer"].Transparency = flags["Line Settings"].transparency
					end
					--
					getgenv().Full = true
					if flags["Target Strafe Enabled"] or not framework:checkForKillBot() then 
						utility.angle = utility.angle + flags["Target Strafe Speed"]
						local strafe = utility.target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(utility.angle), 0) * CFrame.new(0, flags["Target Strafe Height"], flags["Target Strafe Distance"])
						-- 
						if not framework:checkForKillBot() then 
							local OldVel
							local OldPos
							-- 
							local hrp = LocalPlayer.Character.HumanoidRootPart 
							local target_hrp = utility.target.Character.HumanoidRootPart 
							-- 
							hrp.CFrame = target_hrp.CFrame * CFrame.Angles(math.rad(utility.angle), math.rad(utility.angle), math.rad(utility.angle)) * CFrame.new(math.random(10, 15), math.random(10, 15), math.random(10, 15))
						else 
							LocalPlayer.Character.HumanoidRootPart.CFrame = strafe
						end
					end 
					-- 
					if flags["Back Track Enabled"] and flags["Back Track Method"] == "Follow" then 
						for _, Part in pairs(utility.folders["Part Chams"]:GetChildren()) do 
							if Part:IsA("BasePart") and table.find(utility.bodyParts, Part.Name) then 
								Part.Position = utility.target.Character[Part.Name].Position + utility.target.Character.HumanoidRootPart.Velocity * 0.1413
								Part.Rotation = utility.target.Character[Part.Name].Rotation
							end     
						end 
					end 
					-- 
					if flags["Look At"] then 
						LocalPlayer.Character.Humanoid.AutoRotate = false;
						local OldCframe = LocalPlayer.Character.PrimaryPart;
						local NearestRoot = utility.target.Character.HumanoidRootPart
						local NearestPos = CFrame.new(LocalPlayer.Character.PrimaryPart.Position, Vector3.new(NearestRoot.Position.X, OldCframe.Position.Y, NearestRoot.Position.Z));
						LocalPlayer.Character:SetPrimaryPartCFrame(NearestPos);
					end 
					-- 
					if flags["Auto Shoot"] or not framework:checkForKillBot() then 
						local Tool = utility:getHeld(); 
						if Tool then 
							Tool:Activate()
						end 
					end 
				end 
				-- 	
				if tick() - antiCheattick > 1 and LocalPlayer.Character then 
					antiCheattick = tick() 
					-- 
					for _, Script in pairs(LocalPlayer.Character:GetChildren()) do
						if Script:IsA("Script") and Script.Name ~= "Health" and Script.Name ~= "Sound" and Script:FindFirstChild("LocalScript") then
							Script:Destroy()
						end
					end
				end 		
			end))
		
			framework["connections"]["ESP Loop"] = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function(Fps)
				if flags["PlayerESP_Enabled"] then  
					for _,Player in pairs(Players:GetPlayers()) do
						local PlayerDrawing = Visuals["Drawings"][Player]
						-- 
						if not PlayerDrawing then continue end
						-- 
						for _,Drawing in pairs(PlayerDrawing) do
							Drawing.Visible = false
						end
						-- 
						for _, Drawing in pairs(Visuals["Drawings"][Player]["Corners"]) do
							if Drawing then 
								Drawing.Visible = false 
							end 
						end 
						-- 
						local Character = Player.Character
						local RootPart, Humanoid, Head = Character and Character:FindFirstChild("HumanoidRootPart"), Character and Character:FindFirstChildOfClass("Humanoid"), Character and Character:FindFirstChild("Head")
						-- 
						if not Character or not RootPart or not Humanoid then continue end
						-- 
						local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
						local MaxDistance = flags["ESP Distance"] or 25000
						-- 
						local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
						if MaxDistance < DistanceFromCharacter then continue end 
						--
						if not OnScreen then
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_Arrows"] then
								local Tri = PlayerDrawing.Arrow
								local Tri2 = PlayerDrawing.ArrowOutline
								-- 		
								local rootpartpos = RootPart.Position
								-- 
								Tri.Visible = true
								Tri2.Visible = true
								-- 
								local relativePos = Camera.CFrame:PointToObjectSpace(rootpartpos)
								local angle = math.atan2(-relativePos.y, relativePos.x)
		
								local size = Floor(viewportSize.x * 0.0078125)
								local max_size = Floor(viewportSize.x * 0.0260416666667)
		
								local distance = Vector3.new().Dot(relativePos.Unit, relativePos)
								local arrow_dist = flags["PlayerESP_ArrowRadius"]
								local arrow_size = flags["PlayerESP_ArrowsDynamic"] and utility:Map(distance, 1, 100, max_size, flags["PlayerESP_ArrowSize"]) or flags["PlayerESP_ArrowSize"]
								-- 
								arrow_size = arrow_size > max_size and max_size or arrow_size < size and size or arrow_size
								direction = Vector2.new(math.cos(angle), math.sin(angle))
								-- 
								local pos
								if arrow_dist ~= 101 then
									pos = ( direction * viewportSize.x * arrow_dist / 200) + (viewportSize * 0.5)
								end
								-- 
								if not pos or pos.y > viewportSize.y - 5 or pos.y < 5 then
									pos = utility:AngleToEdge(angle, 5)
								end
								-- 
								Tri.PointA = pos
								Tri2.PointA = pos  
								Tri.PointB = pos - utility:getRotate(direction, 0.5) * arrow_size 
								Tri2.PointB = pos - utility:getRotate(direction, 0.5) * arrow_size 
								Tri.PointC = pos - utility:getRotate(direction, -0.5) * arrow_size 
								Tri2.PointC = pos - utility:getRotate(direction, -0.5) * arrow_size
								-- 
								Tri.Color = flags["PlayerESP_ArrowColor"]
								Tri.Transparency = flags["PlayerESP_ArrowColor"].transparency
								-- 
								Tri2.Color = flags["PlayerESP_ArrowOutline"]
								Tri2.Transparency = flags["PlayerESP_ArrowOutline"].transparency
								Tri2.Filled = false
							end
						else
							local BoxSize, BoxPos = utility:BoxCalculation(RootPart)
							-- 
							if flags["PlayerESP_Box"] and flags["PlayerESP_Box_Type"] == "Corner" then -- // Corner Boxes
								BoxCenter = Math:RoundVector(NewVector2(BoxPos.X + BoxSize.X / 2, BoxPos.Y + BoxSize.Y / 2));
								TL = Math:RoundVector(NewVector2(BoxCenter.X - BoxSize.X / 2, BoxCenter.Y - BoxSize.Y / 2));
								BL = Math:RoundVector(NewVector2(BoxCenter.X - BoxSize.X / 2, BoxCenter.Y + BoxSize.Y / 2));
								TR = Math:RoundVector(NewVector2(BoxCenter.X + BoxSize.X / 2, BoxCenter.Y - BoxSize.Y / 2));
								BR = Math:RoundVector(NewVector2(BoxCenter.X + BoxSize.X / 2, BoxCenter.Y + BoxSize.Y / 2));
							end
							-- 
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_Box"] then
								local Box = PlayerDrawing.Box
								local BoxOutline = PlayerDrawing.BoxOutline
								if flags["PlayerESP_Box_Type"] == "Corner" then 
									local BoxCorners, BoxColor1, BoxColor2 = Visuals["Drawings"][Player]["Corners"], flags["PlayerESP_Box_Color1"], flags["PlayerESP_Box_Color2"]
									-- Inlines
									do
										BoxCorners[1].Visible = true
										BoxCorners[1].From = TL
										BoxCorners[1].To = BoxCorners[1].From + NewVector2(0, BoxSize.X / 3)  
										BoxCorners[1].Color = BoxColor1
										--
										BoxCorners[2].Visible = true
										BoxCorners[2].From = TL + NewVector2(1, 0)
										BoxCorners[2].To = BoxCorners[2].From + NewVector2(BoxSize.X / 3, 0)
										BoxCorners[2].Color = BoxColor1
										--
										BoxCorners[3].Visible = true
										BoxCorners[3].From = TR
										BoxCorners[3].To = BoxCorners[3].From + NewVector2(-BoxSize.X / 3, 0)
										BoxCorners[3].Color = BoxColor1
										--
										BoxCorners[4].Visible = true
										BoxCorners[4].From = TR
										BoxCorners[4].To = BoxCorners[4].From + NewVector2(0, BoxSize.X / 3)
										BoxCorners[4].Color = BoxColor1
										--
										BoxCorners[5].Visible = true
										BoxCorners[5].From = BR + NewVector2(0, 1)
										BoxCorners[5].To = BoxCorners[5].From + NewVector2(0, -BoxSize.X / 3)
										BoxCorners[5].Color = BoxColor1
										--
										BoxCorners[6].Visible = true
										BoxCorners[6].From = BR
										BoxCorners[6].To = BoxCorners[6].From + NewVector2(-BoxSize.X / 3, 0)
										BoxCorners[6].Color = BoxColor1
										--
										BoxCorners[7].Visible = true
										BoxCorners[7].From = BL + NewVector2(0, 1)
										BoxCorners[7].To = BoxCorners[7].From + NewVector2(0, -BoxSize.X / 3)
										BoxCorners[7].Color = BoxColor1
										--
										BoxCorners[8].Visible = true
										BoxCorners[8].From = BL
										BoxCorners[8].To = BoxCorners[8].From + NewVector2(BoxSize.X / 3, 0)
										BoxCorners[8].Color = BoxColor1
									end
									-- // Outlines
									do
										BoxCorners[9].Visible = true
										BoxCorners[9].From = BoxCorners[1].From + NewVector2(0, -1)
										BoxCorners[9].To = BoxCorners[1].To + NewVector2(0, 1)
										BoxCorners[9].Color = BoxColor2
										--
										BoxCorners[10].Visible = true
										BoxCorners[10].From = BoxCorners[2].From
										BoxCorners[10].To = BoxCorners[2].To + NewVector2(1, 0)
										BoxCorners[10].Color = BoxColor2
										--
										BoxCorners[11].Visible = true
										BoxCorners[11].From = BoxCorners[3].From + NewVector2(2, 0)
										BoxCorners[11].To = BoxCorners[3].To + NewVector2(-1, 0)
										BoxCorners[11].Color = BoxColor2
										--
										BoxCorners[12].Visible = true
										BoxCorners[12].From = BoxCorners[4].From
										BoxCorners[12].To = BoxCorners[4].To + NewVector2(0, 1)
										BoxCorners[12].Color = BoxColor2
										--
										BoxCorners[13].Visible = true
										BoxCorners[13].From = BoxCorners[5].From
										BoxCorners[13].To = BoxCorners[5].To + NewVector2(0, -1)
										BoxCorners[13].Color = BoxColor2
										--
										BoxCorners[14].Visible = true
										BoxCorners[14].From = BoxCorners[6].From + NewVector2(2, 0)
										BoxCorners[14].To = BoxCorners[6].To + NewVector2(-1, 0)
										BoxCorners[14].Color = BoxColor2
										--
										BoxCorners[15].Visible = true
										BoxCorners[15].From = BoxCorners[7].From
										BoxCorners[15].To = BoxCorners[7].To + NewVector2(0, -1)
										BoxCorners[15].Color = BoxColor2
										--
										BoxCorners[16].Visible = true
										BoxCorners[16].From = BoxCorners[8].From + NewVector2(-1, 0)
										BoxCorners[16].To = BoxCorners[8].To + NewVector2(1, 0)
										BoxCorners[16].Color = BoxColor2
									end
								else 
									Box.Size = BoxSize
									Box.Position = BoxPos
									Box.Visible = true
									Box.Color = flags["PlayerESP_Box_Color1"]
									BoxOutline.Size = BoxSize
									BoxOutline.Color = flags["PlayerESP_Box_Color2"]
									BoxOutline.Position = BoxPos
									BoxOutline.Visible = true
								end 
							end
							-- 
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_Name"] then
								local Name = PlayerDrawing.Name
								Name.Text = ""..Player.Name..""
								Name.Position = NewVector2(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
								Name.Color = flags["PlayerESP_Name_Color"]
								Name.Visible = true
							end
							-- 
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_HealthBar"] then
								local Health         = PlayerDrawing.Health
								local HealthOutline  = PlayerDrawing.HealthOutline
								local HealthText     = PlayerDrawing.HealthText
								local HealthBarGradient = PlayerDrawing.HealthBarGradient
								local ArmorBarOutline = PlayerDrawing.ArmorBarOutline
								local Armor_Bar = PlayerDrawing.ArmorBar
								
								local Color = utility:Lerp(Humanoid.Health / Humanoid.MaxHealth, flags["PlayerESP_HealthBar_Color_Higher"], flags["PlayerESP_HealthBar_Color_Low"])
								local HealthSize = (Floor(BoxSize.Y * (Humanoid.Health / Humanoid.MaxHealth)))
								local Height = ((BoxPos.Y + BoxSize.Y) - HealthSize) 
								-- 
								Health.Size = NewVector2(1, HealthSize)
								Health.Position = NewVector2(BoxPos.X - 2 - 1, Height)
								Health.Color = Color
								Health.Visible = true
								Health.Filled = true 
								-- 
								HealthOutline.Size = NewVector2(3, BoxSize.Y + 2)
								HealthOutline.Position = NewVector2(BoxPos.X - 2 - 2, BoxPos.Y - 1)
								HealthOutline.Visible = true 
								HealthOutline.Color = Color3.fromRGB(0, 0, 0)
								HealthOutline.Filled = true 
								-- 
								if flags["PlayerESP_HealthBarGradient"] then 
									HealthBarGradient.Size = NewVector2(2 + 2, BoxSize.Y + 2)
									HealthBarGradient.Position = NewVector2(BoxPos.X - (2 * 2) - 1, BoxPos.Y - 1)
									HealthBarGradient.Visible = true 
								end 
								-- 
								if flags["PlayerESP_Enabled"] and flags["PlayerESP_HealthNumber"] then
									HealthText.Text = "".. Floor(Humanoid.Health) .. ""
									HealthText.Color = Color
									HealthText.Visible = true
									-- 
									local HealthNumberPos = NewVector2((BoxPos.X + 1), BoxPos.Y + BoxSize.Y)
									HealthText.Position = NewVector2(HealthOutline.Position.X - (2 + 8), HealthNumberPos.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
								end 
								--
								if flags["PlayerESP_ArmorBar"] and Character.BodyEffects.Armor.Value > 0 then 
									local AmourSize = (Floor(BoxSize.Y * (Character.BodyEffects.Armor.Value / 200)))
									local Height_2 = ((BoxPos.Y + BoxSize.Y) - AmourSize) 
									
									Armor_Bar.Visible = true 
									Armor_Bar.Color = Color3.fromRGB(0,0,255)
									Armor_Bar.Filled = true
									Armor_Bar.Size = NewVector2(1, AmourSize)
									Armor_Bar.Position = NewVector2(BoxPos.X - 2 - 5, Height_2)
									Armor_Bar.ZIndex = 999999
		
									ArmorBarOutline.Visible = true 
									ArmorBarOutline.Color = Color3.fromRGB(0,0,0)
									ArmorBarOutline.Size = NewVector2(3, BoxSize.Y + 2)
									ArmorBarOutline.Position = NewVector2(BoxPos.X - 2 - 6, BoxPos.Y - 1)
									ArmorBarOutline.Filled = true
									
									local HealthNumberPos = NewVector2((BoxPos.X + 1), BoxPos.Y + BoxSize.Y)
									HealthText.Position = NewVector2(HealthOutline.Position.X - (2 + 13), HealthNumberPos.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
								else 
									Armor_Bar.Visible = false 
									ArmorBarOutline.Visible = false 
								end
							end
							-- 
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_Weapon"] then
								local Tool = PlayerDrawing.Tool
								local BottomOffset = BoxSize.Y + BoxPos.Y + 1
								local Equipped = Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name or ""
								Tool.Text = ""..Equipped..""
								Tool.Position = NewVector2(BoxSize.X / 2 + BoxPos.X, BottomOffset)
								Tool.Color = flags["PlayerESP_Weapon_Color"]
								Tool.Visible = true
								BottomOffset = BottomOffset + 15
							end
							-- 
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_BoxFill"] then 
								local BoxFill = PlayerDrawing.BoxFill
								BoxFill.Size = BoxSize
								BoxFill.Position = BoxPos
								BoxFill.Visible = true
								BoxFill.Color = flags["PlayerESP_BoxFill_Color"]
								BoxFill.Transparency = 1 - flags["PlayerESP_BoxFill_Color"].transparency
							end 
							-- 
							if flags["PlayerESP_Enabled"] and flags["PlayerESP_Flags"] then
								local Flag = PlayerDrawing.Flag
								local FlagStr = ""
								-- 
								if Find(flags["PlayerESP_Flag_Options"], "Distance") then
									FlagStr ..= ("%sm\n"):format(Round(DistanceFromCharacter))
								end
								-- 
								if Find(flags["PlayerESP_Flag_Options"], "Knocked") and Player.Character.BodyEffects then
									FlagStr ..= ("%s\n"):format(tostring(Player.Character.BodyEffects["K.O"].Value and "KNOCKED" or ""))
								end
								--
								Flag.Text = FlagStr
								Flag.Position = NewVector2(BoxSize.X + BoxPos.X + 14, BoxPos.Y - 4)
								Flag.Visible = true
								Flag.Color = flags["PlayerESP_FlagsColor"]
							end 
						end 
					end
				else 
					for _,Player in pairs(Players:GetPlayers()) do
						local PlayerDrawing = Visuals["Drawings"][Player]
						-- 
						if not PlayerDrawing then continue end
						-- 
						for _,Drawing in pairs(PlayerDrawing) do
							Drawing.Visible = false
						end
						-- 
						for _, Drawing in pairs(Visuals["Drawings"][Player]["Corners"]) do
							if Drawing then 
								Drawing.Visible = false 
							end 
						end 
					end 
				end
				--
				crosshair_SpinAngle = flags["Crosshair Always Rotating"] and crosshair_SpinAngle + math.rad((flags["Crosshair Speed"] * 10) * Fps) or 0;  
				--
				if flags["Crosshair"] then 
					local Radius = flags["Crosshair Length"] * 5
					local Gap = flags["Crosshair Gap Size"] 
					CursorSize += 0.025
					-- 
					local SmoothAngle = flags["Crosshair Speed Easing Style"] ~= "Off" and Tween.EasingStyles[Enum.EasingStyle[flags["Crosshair Speed Easing Style"]]][Enum.EasingDirection.InOut](utility:Shift(crosshair_SpinAngle)) * (Pi * Pi/2) or crosshair_SpinAngle
					local Dynamic = Cos(CursorSize)
					local SmoothSize =  flags["Crosshair Sizing Easing Style"] ~= "Off" and ((Radius / 2) * (Tween.EasingStyles[Enum.EasingStyle[flags["Crosshair Sizing Easing Style"]]][Enum.EasingDirection.In](utility:Shift(Dynamic)))) or 0 
					local localRadius = Radius - SmoothSize
					--
					for i = 1, #crosshair_Lines do 
						local Positions = Vector2.new(Cos(SmoothAngle + crosshair_lineOffsets[i]), (Sin(SmoothAngle + crosshair_lineOffsets[i])))
						local Mouse_Position = Vector2.new(Mouse.X, Mouse.Y + Offset)
						-- 
						crosshair_Lines[i].From = Mouse_Position + Vector2.new(Positions.X, Positions.Y) * Gap 
						crosshair_Lines[i].To = crosshair_Lines[i].From + Vector2.new(Positions.X, Positions.Y) * localRadius
						-- 
						crosshair_Outlines[i].From = Mouse_Position + Vector2.new(Positions.X, Positions.Y) * (Gap - 1)
						crosshair_Outlines[i].To = crosshair_Lines[i].From + Vector2.new(Positions.X, Positions.Y) * (localRadius + 1)
						-- 
						crosshair_Lines[i].Visible = true 
						crosshair_Outlines[i].Visible = true 
					end 
				end 
			end))
		
			framework["connections"]["ESP Player Find Loop"] = Players.PlayerAdded:Connect(LPH_NO_VIRTUALIZE(function(Player)
				ESP:Add(Player)
			end))
		
			framework["connections"]["ESP Player Removed Loop"] = Players.PlayerRemoving:Connect(LPH_NO_VIRTUALIZE(function(Player)
				if Visuals["Drawings"][Player] or Visuals["Drawings"][Player]["Corners"] then
					for Index, Drawing in pairs(Visuals["Drawings"][Player]) do
						if Drawing and Index ~= "Corners" then 
							Drawing:Remove()
						end 
					end        
					--
					for Index = 1, 16 do
						Visuals["Drawings"][Player]["Corners"][Index]:Remove()
					end
					-- 
					Visuals["Drawings"][Player]["Corners"] = nil
					Visuals["Drawings"][Player] = nil
				end
				-- 
				--[[if flags["PlayerESP_Chams"] then 
					utility:Cham_Remove(Player)
				end ]]
			end))
			--
			framework["connections"]["Detect Rays"] = Workspace.Ignored.Siren.Radius.DescendantAdded:Connect(LPH_NO_VIRTUALIZE(function(a)
				pcall(function()
					if flags["Bullet Tracers"] then 
						if Workspace.Ignored.Siren.Radius:FindFirstChild("BULLET_RAYS") then 
							framework:translateBeam(Workspace.Ignored.Siren.Radius.BULLET_RAYS)
						end 
					end 
				end)
			end))
			-- Aim Viewer Bypass and Hit Detection
			do 
				local function Aimbot() 
				end 	
		
				local function Ammo()
					framework:detectHit()
				end 	
		
				framework["connections"]["Anti Aim Viewer"] = {} 
				framework["connections"]["hit detection >_<"] = {}
				for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
					if v:IsA("Tool") and v:FindFirstChild("Ammo") then
						if not framework["connections"]["Anti Aim Viewer"][v] then 
							framework["connections"]["Anti Aim Viewer"][v] = v.Activated:Connect(Aimbot)
						end 
						--
						if not framework["connections"]["hit detection >_<"][v] then 
							framework["connections"]["hit detection >_<"][v] = v.Ammo:GetPropertyChangedSignal("Value"):Connect(Ammo)
						end 
					end
				end
				for i, v in pairs(LocalPlayer.Character:GetChildren()) do
					if v:IsA("Tool") and v:FindFirstChild("Ammo") then
						if not framework["connections"]["Anti Aim Viewer"][v] then 
							framework["connections"]["Anti Aim Viewer"][v] = v.Activated:Connect(Aimbot)
						end 
						--
						if not framework["connections"]["hit detection >_<"][v] then 
							framework["connections"]["hit detection >_<"][v] = v.Ammo:GetPropertyChangedSignal("Value"):Connect(Ammo)
						end 
					end
				end
				LocalPlayer.Character.ChildAdded:connect(function(v)
					if v:IsA("Tool") and v:FindFirstChild("Ammo") then
						if not framework["connections"]["Anti Aim Viewer"][v] then 
							framework["connections"]["Anti Aim Viewer"][v] = v.Activated:Connect(Aimbot)
						end 
						--
						if not framework["connections"]["hit detection >_<"][v] then 
							framework["connections"]["hit detection >_<"][v] = v.Ammo:GetPropertyChangedSignal("Value"):Connect(Ammo)
						end 
					end
				end)
				LocalPlayer.CharacterAdded:connect(function(v)
					for i = 1, #framework["connections"]["Anti Aim Viewer"], 1 do
						framework["connections"]["Anti Aim Viewer"][i]:Disconnect()
						framework["connections"]["Anti Aim Viewer"][i] = nil
						framework["connections"]["hit detection >_<"][i]:Disconnect()
						framework["connections"]["hit detection >_<"][i] = nil
					end
					v.ChildAdded:connect(function(v)
						if v:IsA("Tool") and v:FindFirstChild("Ammo") then
							if not framework["connections"]["Anti Aim Viewer"][v] then 
								framework["connections"]["Anti Aim Viewer"][v] = v.Activated:Connect(Aimbot)
							end 
							--
							if not framework["connections"]["hit detection >_<"][v] then 
								framework["connections"]["hit detection >_<"][v] = v.Ammo:GetPropertyChangedSignal("Value"):Connect(Ammo)
							end 
						end
					end)
				end)
			end 	
			-- // Clone Chams
			task.spawn(function()
				while true do 
					task.wait(flags["Back Track Delay"]/2)
					if utility.target and utility:ValidateClient(utility.target) then 
						if flags["Back Track Enabled"] and flags["Back Track Method"] == "Clone" then
							utility:characterClone(utility.target, flags["Back Track Settings"], flags["Back Track Material"], flags["Back Track Settings"].transparency, utility.folders["Part Chams"]);
							task.wait(flags["Back Track Delay"]/2)
							utility.folders["Part Chams"]:ClearAllChildren(); 
						end     
					end 
				end 
			end)
		
			local Old; 
			Old = hookmetamethod(game, "__namecall", LPH_NO_VIRTUALIZE(function(self, ...)
				if tostring(self.Name) == "MainEvent" then 
					local Args = {...}
					-- 
					if getnamecallmethod() == "FireServer" and Args[1] == "UpdateMousePos" then 
						if utility.target and utility.target.Character and misc_flags["target"] then 
							local part = (flags["Jump Prediction"] and utility.target.Character.Humanoid.FloorMaterial == Enum.Material.Air and "RightFoot") or (flags["Nearest Part"] and partClosest) or flags["Single Hit Part"]
							local yOffset = utility.target.Character.Humanoid.FloorMaterial == Enum.Material.Air and flags["Manual Offset Value"] or 0 
							--
							if (checks == true) then 
								if flags["Resolver"] then  
									Args[2] = utility.target.Character[tostring(part)].Position + offset + NewVector3(0, yOffset, 0)
								else 
									Args[2] = utility.target.Character[tostring(part)].Position + (utility.target.Character.HumanoidRootPart.Velocity * prediction) + NewVector3(0, yOffset, 0)
								end   
							end   
		
						end 
					end 
					--
					return Old(self, unpack(Args))
				end 
				-- 
				return Old(self, ...)
			end))
		end 
		