export type BoxImpl = {
	__index: BoxImpl,

	draw: (
		self: Box,
		orientation: CFrame,
		size: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> BoxHandleAdornment,
}

export type Box = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: BoxImpl))
