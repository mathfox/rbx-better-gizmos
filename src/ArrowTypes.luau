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

export type ArrowImpl = ArrowProperties & {
	__index: ArrowImpl,

	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Arrow,

	new: (adornee: PVInstance, container: Instance) -> Arrow,

	draw: (self: Arrow, from: Vector3, to: Vector3) -> { CylinderHandleAdornment | ConeHandleAdornment },
}

export type Arrow = typeof(setmetatable({} :: ArrowProperties, (nil :: any) :: ArrowImpl))

return nil
