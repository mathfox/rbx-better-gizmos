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
