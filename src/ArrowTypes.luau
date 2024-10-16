--!strict
--!native
--!optimize 2

export type ArrowProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type ArrowOutput = {
	adornmentLine: CylinderHandleAdornment,
	adornmentCone: ConeHandleAdornment,
}

export type ArrowImpl = ArrowProperties & {
	__index: ArrowImpl,

	default: () -> ArrowOutput,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Arrow,
	new: (adornee: PVInstance, container: Instance) -> Arrow,

	draw: (self: Arrow, from: Vector3, to: Vector3) -> ArrowOutput,
	assign: (self: Arrow, output: ArrowOutput, from: Vector3, to: Vector3) -> ArrowOutput,
}

export type Arrow = typeof(setmetatable({} :: ArrowProperties, (nil :: any) :: ArrowImpl))

return nil
