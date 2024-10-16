export type PlaneImpl = {
	__index: PlaneImpl,

	draw: (
		self: Plane,
		cf: CFrame,
		size: Vector2?,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> BoxHandleAdornment,
}

export type Plane = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: PlaneImpl))

local Plane = {} :: PlaneImpl

function Plane:draw(cf, size, style)
	size = size or Vector2.new(10, 10)

	local adornmentPlane = Instance.new("BoxHandleAdornment")
	adornmentPlane.CFrame = cf
	adornmentPlane.Size = Vector3.new((size :: Vector2).X, (size :: Vector2).Y, 0)
	adornmentPlane.Color3 = style and style.color or Gizmo.color
	adornmentPlane.Transparency = style and style.transparency or 0
	adornmentPlane.ZIndex = style and style.zindex or 0
	adornmentPlane.Adornee = self.adornee
	adornmentPlane.AlwaysOnTop = style and style.alwaysOnTop or true

	return adornmentPlane
end
