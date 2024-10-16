export type WireSphereImpl = {
	__index: WireSphereImpl,

	draw: (
		self: WireSphere,
		position: Vector3,
		radius: number,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { CylinderHandleAdornment },
}

export type WireSphere = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: WireSphereImpl))
