export type BoxProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type BoxOutput = ""

export type BoxImpl = BoxProperties & {
	__index: BoxImpl,

	draw: (
		self: Box,
		orientation: CFrame,
		size: Vector3,
	) -> BoxHandleAdornment,
}

export type Box = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: BoxImpl))

return nil
