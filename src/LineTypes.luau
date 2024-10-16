export type LineImpl = {
	__index: LineImpl,

	draw: (
		self: Line,
		from: Vector3,
		to: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> CylinderHandleAdornment,
}

export type Line = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: LineImpl))
