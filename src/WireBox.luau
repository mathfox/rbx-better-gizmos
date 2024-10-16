export type WireBoxImpl = {
	__index: WireBoxImpl,

	draw: (
		self: WireBox,
		orientation: CFrame,
		size: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { BoxHandleAdornment },
}

export type WireBox = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: WireBoxImpl))

local WireBox = {} :: WireBoxImpl

function WireBox:draw(orientation, size, style)
	local x, y, z = size.X / 2, size.Y / 2, size.Z / 2
	local lineWidth = style and style.scale or 0.1

	local sizeX = Vector3.new(size.X + lineWidth, lineWidth, lineWidth)
	local sizeY = Vector3.new(lineWidth, size.Y + lineWidth, lineWidth)
	local sizeZ = Vector3.new(lineWidth, lineWidth, size.Z + lineWidth)

	local relativeOrientation = orientation

	local adornmentX1 = Instance.new("BoxHandleAdornment")
	local adornmentX2 = Instance.new("BoxHandleAdornment")
	local adornmentX3 = Instance.new("BoxHandleAdornment")
	local adornmentX4 = Instance.new("BoxHandleAdornment")
	local adornmentY1 = Instance.new("BoxHandleAdornment")
	local adornmentY2 = Instance.new("BoxHandleAdornment")
	local adornmentY3 = Instance.new("BoxHandleAdornment")
	local adornmentY4 = Instance.new("BoxHandleAdornment")
	local adornmentZ1 = Instance.new("BoxHandleAdornment")
	local adornmentZ2 = Instance.new("BoxHandleAdornment")
	local adornmentZ3 = Instance.new("BoxHandleAdornment")
	local adornmentZ4 = Instance.new("BoxHandleAdornment")

	adornmentX1.Size = sizeX
	adornmentX1.CFrame = relativeOrientation * CFrame.new(0, y, z)
	adornmentX1.Color3 = style and style.color or Gizmo.color
	adornmentX1.Transparency = style and style.transparency or 0
	adornmentX1.ZIndex = style and style.zindex or 1
	adornmentX1.Adornee = self.adornee
	adornmentX1.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentX2.Size = sizeX
	adornmentX2.CFrame = relativeOrientation * CFrame.new(0, -y, z)
	adornmentX2.Color3 = style and style.color or Gizmo.color
	adornmentX2.Transparency = style and style.transparency or 0
	adornmentX2.ZIndex = style and style.zindex or 1
	adornmentX2.Adornee = self.adornee
	adornmentX2.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentX3.Size = sizeX
	adornmentX3.CFrame = relativeOrientation * CFrame.new(0, y, -z)
	adornmentX3.Color3 = style and style.color or Gizmo.color
	adornmentX3.Transparency = style and style.transparency or 0
	adornmentX3.ZIndex = style and style.zindex or 1
	adornmentX3.Adornee = self.adornee
	adornmentX3.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentX4.Size = sizeX
	adornmentX4.CFrame = relativeOrientation * CFrame.new(0, -y, -z)
	adornmentX4.Color3 = style and style.color or Gizmo.color
	adornmentX4.Transparency = style and style.transparency or 0
	adornmentX4.ZIndex = style and style.zindex or 1
	adornmentX4.Adornee = self.adornee
	adornmentX4.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY1.Size = sizeY
	adornmentY1.CFrame = relativeOrientation * CFrame.new(x, 0, z)
	adornmentY1.Color3 = style and style.color or Gizmo.color
	adornmentY1.Transparency = style and style.transparency or 0
	adornmentY1.ZIndex = style and style.zindex or 1
	adornmentY1.Adornee = self.adornee
	adornmentY1.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY2.Size = sizeY
	adornmentY2.CFrame = relativeOrientation * CFrame.new(-x, 0, z)
	adornmentY2.Color3 = style and style.color or Gizmo.color
	adornmentY2.Transparency = style and style.transparency or 0
	adornmentY2.ZIndex = style and style.zindex or 1
	adornmentY2.Adornee = self.adornee
	adornmentY2.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY3.Size = sizeY
	adornmentY3.CFrame = relativeOrientation * CFrame.new(x, 0, -z)
	adornmentY3.Color3 = style and style.color or Gizmo.color
	adornmentY3.Transparency = style and style.transparency or 0
	adornmentY3.ZIndex = style and style.zindex or 1
	adornmentY3.Adornee = self.adornee
	adornmentY3.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY4.Size = sizeY
	adornmentY4.CFrame = relativeOrientation * CFrame.new(-x, 0, -z)
	adornmentY4.Color3 = style and style.color or Gizmo.color
	adornmentY4.Transparency = style and style.transparency or 0
	adornmentY4.ZIndex = style and style.zindex or 1
	adornmentY4.Adornee = self.adornee
	adornmentY4.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ1.Size = sizeZ
	adornmentZ1.CFrame = relativeOrientation * CFrame.new(x, y, 0)
	adornmentZ1.Color3 = style and style.color or Gizmo.color
	adornmentZ1.Transparency = style and style.transparency or 0
	adornmentZ1.ZIndex = style and style.zindex or 1
	adornmentZ1.Adornee = self.adornee
	adornmentZ1.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ2.Size = sizeZ
	adornmentZ2.CFrame = relativeOrientation * CFrame.new(-x, y, 0)
	adornmentZ2.Color3 = style and style.color or Gizmo.color
	adornmentZ2.Transparency = style and style.transparency or 0
	adornmentZ2.ZIndex = style and style.zindex or 1
	adornmentZ2.Adornee = self.adornee
	adornmentZ2.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ3.Size = sizeZ
	adornmentZ3.CFrame = relativeOrientation * CFrame.new(x, -y, 0)
	adornmentZ3.Color3 = style and style.color or Gizmo.color
	adornmentZ3.Transparency = style and style.transparency or 0
	adornmentZ3.ZIndex = style and style.zindex or 1
	adornmentZ3.Adornee = self.adornee
	adornmentZ3.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ4.Size = sizeZ
	adornmentZ4.CFrame = relativeOrientation * CFrame.new(-x, -y, 0)
	adornmentZ4.Color3 = style and style.color or Gizmo.color
	adornmentZ4.Transparency = style and style.transparency or 0
	adornmentZ4.ZIndex = style and style.zindex or 1
	adornmentZ4.Adornee = self.adornee
	adornmentZ4.AlwaysOnTop = style and style.alwaysOnTop or true

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
