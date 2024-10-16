local Text = {} :: TextImpl

function Text:draw(position, text, style)
	local billboard = Instance.new("BillboardGui")

	local textScale = (style and style.scale or 0.1) * 8
	billboard.AlwaysOnTop = style and style.alwaysOnTop or true
	billboard.StudsOffsetWorldSpace = position
	billboard.Size = UDim2.fromScale(text:len() * 0.5 * textScale, textScale)
	billboard.LightInfluence = 0
	billboard.Adornee = self.adornee

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.RobotoMono
	label.TextColor3 = style and style.color or Gizmo.color
	label.TextTransparency = style and style.transparency or 0
	label.TextScaled = true
	label.Text = text
	label.Parent = billboard

	return { label = label, billboard = billboard }
end
