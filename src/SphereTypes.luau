export type SphereImpl = {
	__index: SphereImpl,

	draw: (
		self: Sphere,
		position: Vector3,
		radius: number,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> SphereHandleAdornment,
}

export type Sphere = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: SphereImpl))
