--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type WireBoxProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	lineWidth: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = { BoxHandleAdornment }

export type WireBoxImpl = WireBoxProperties & {
	__index: WireBoxImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> WireBox,
	new: (adornee: PVInstance, container: Instance) -> WireBox,

	draw: (self: WireBox, orientation: CFrame, size: Vector3) -> Output,
	assign: (self: WireBox, output: Output, orientation: CFrame, size: Vector3) -> Output,
}

export type WireBox = typeof(setmetatable({} :: WireBoxProperties, (nil :: any) :: WireBoxImpl))

local WireBox = {} :: WireBoxImpl
WireBox.__index = WireBox

WireBox.adornee = nil
WireBox.container = nil
WireBox.color = nil
WireBox.lineWidth = 0.1
WireBox.transparency = 0
WireBox.zindex = 0
WireBox.alwaysOnTop = true

function WireBox.default()
	local output = table.create(12)

	for _ = 1, 12 do
		table.insert(output, Instance.new("BoxHandleAdornment"))
	end

	return output
end

function WireBox:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, WireBox)

	return self
end

WireBox:_construct(Gizmo.adornee, Gizmo.container)

function WireBox.new(adornee, container)
	return WireBox._construct({
		color = WireBox.color,
		lineWidth = WireBox.lineWidth,
		transparency = WireBox.transparency,
		zindex = WireBox.zindex,
		alwaysOnTop = WireBox.alwaysOnTop,
	}, adornee, container)
end

function WireBox:assign(output, orientation, size)
	local x, y, z = size.X / 2, size.Y / 2, size.Z / 2
	local lineWidth = self.lineWidth

	local sizeX = Vector3.new(size.X + lineWidth, lineWidth, lineWidth)
	local sizeY = Vector3.new(lineWidth, size.Y + lineWidth, lineWidth)
	local sizeZ = Vector3.new(lineWidth, lineWidth, size.Z + lineWidth)

	local relativeOrientation = orientation

	local adornmentX1 = output[1]
	local adornmentX2 = output[2]
	local adornmentX3 = output[3]
	local adornmentX4 = output[4]
	local adornmentY1 = output[5]
	local adornmentY2 = output[6]
	local adornmentY3 = output[7]
	local adornmentY4 = output[8]
	local adornmentZ1 = output[9]
	local adornmentZ2 = output[10]
	local adornmentZ3 = output[11]
	local adornmentZ4 = output[12]

	for _, adornment in output do
		adornmentX1.Color3 = self.color or Gizmo.color
		adornmentX1.Transparency = self.transparency
		adornmentX1.ZIndex = self.zindex
		adornmentX1.Adornee = self.adornee
		adornmentX1.AlwaysOnTop = self.alwaysOnTop
	end

	adornmentX1.Size = sizeX
	adornmentX1.CFrame = relativeOrientation * CFrame.new(0, y, z)

	adornmentX2.Size = sizeX
	adornmentX2.CFrame = relativeOrientation * CFrame.new(0, -y, z)

	adornmentX3.Size = sizeX
	adornmentX3.CFrame = relativeOrientation * CFrame.new(0, y, -z)

	adornmentX4.Size = sizeX
	adornmentX4.CFrame = relativeOrientation * CFrame.new(0, -y, -z)

	adornmentY1.Size = sizeY
	adornmentY1.CFrame = relativeOrientation * CFrame.new(x, 0, z)

	adornmentY2.Size = sizeY
	adornmentY2.CFrame = relativeOrientation * CFrame.new(-x, 0, z)

	adornmentY3.Size = sizeY
	adornmentY3.CFrame = relativeOrientation * CFrame.new(x, 0, -z)

	adornmentY4.Size = sizeY
	adornmentY4.CFrame = relativeOrientation * CFrame.new(-x, 0, -z)

	adornmentZ1.Size = sizeZ
	adornmentZ1.CFrame = relativeOrientation * CFrame.new(x, y, 0)

	adornmentZ2.Size = sizeZ
	adornmentZ2.CFrame = relativeOrientation * CFrame.new(-x, y, 0)

	adornmentZ3.Size = sizeZ
	adornmentZ3.CFrame = relativeOrientation * CFrame.new(x, -y, 0)

	adornmentZ4.Size = sizeZ
	adornmentZ4.CFrame = relativeOrientation * CFrame.new(-x, -y, 0)

	return {
		adornmentX1,
		adornmentX2,
		adornmentX3,
		adornmentX4,

		adornmentY1,
		adornmentY2,
		adornmentY3,
		adornmentY4,

		adornmentZ1,
		adornmentZ2,
		adornmentZ3,
		adornmentZ4,
	}
end

function WireBox:draw(orientation, size)
	return self:assign(WireBox.default(), orientation, size)
end

return WireBox
