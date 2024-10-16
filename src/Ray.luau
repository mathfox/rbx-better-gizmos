export type RayImpl = {
	__index: RayImpl,

	draw: (
		self: Ray,
		from: Vector3,
		direction: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { CylinderHandleAdornment | ConeHandleAdornment },
}

export type Ray = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: RayImpl))

local Ray = {} :: RayImpl

function Ray:draw(from, direction, style)
	return self.arrow:draw(from, from + direction, style)
end
