--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type TextProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = {
	label: TextLabel,
	billboard: BillboardGui,
}

export type TextImpl = TextProperties & {
	__index: TextImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Text,
	new: (adornee: PVInstance, container: Instance) -> Text,

	draw: (self: Text, position: Vector3, text: string) -> Output,
	assign: (self: Text, output: Output, position: Vector3, text: string) -> Output,
}

export type Text = typeof(setmetatable({} :: TextProperties, (nil :: any) :: TextImpl))

local Text = {} :: TextImpl
Text.__index = Text

Text.adornee = nil
Text.container = nil
Text.color = nil
Text.scale = 0.1
Text.transparency = 0
Text.zindex = 0
Text.alwaysOnTop = true

function Text.default()
	local billboard = Instance.new("BillboardGui")
	local label = Instance.new("TextLabel")

	return { label = label, billboard = billboard }
end

function Text:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Text)

	return self
end

Text:_construct(Gizmo.adornee, Gizmo.container)

function Text.new(adornee, container)
	return Text._construct({
		color = Text.color,
		scale = Text.scale,
		transparency = Text.transparency,
		zindex = Text.zindex,
		alwaysOnTop = Text.alwaysOnTop,
	}, adornee, container)
end

function Text:assign(output, position, text)
	local textScale = self.scale * 8

	local billboard = output.billboard
	billboard.AlwaysOnTop = self.alwaysOnTop
	billboard.StudsOffsetWorldSpace = position
	billboard.Size = UDim2.fromScale(text:len() * 0.5 * textScale, textScale)
	billboard.LightInfluence = 0
	billboard.Adornee = self.adornee

	local label = output.label
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.RobotoMono
	label.TextColor3 = self.color or Gizmo.color
	label.TextTransparency = self.transparency
	label.TextScaled = true
	label.Text = text
	label.Parent = billboard

	return { label = label, billboard = billboard }
end

function Text:draw(position, text)
	return self:assign(Text.default(), position, text)
end

return Text
