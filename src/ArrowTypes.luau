export type ArrowImpl = {
	__index: ArrowImpl,

	draw: (
		self: Arrow,
		from: Vector3,
		to: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { CylinderHandleAdornment | ConeHandleAdornment },
}

export type Arrow = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: ArrowImpl))
