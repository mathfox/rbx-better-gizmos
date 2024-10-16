--!strict
--!native
--!optimize 2

export type PointProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	radius: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type PointOutput = SphereHandleAdornment

export type PointImpl = PointProperties & {
	__index: PointImpl,

	default: () -> PointOutput,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Point,
	new: (adornee: PVInstance, container: Instance) -> Point,

	draw: (self: Point, position: Vector3) -> PointOutput,
	assign: (self: Point, output: PointOutput, position: Vector3) -> PointOutput,
}

export type Point = typeof(setmetatable({} :: PointProperties, (nil :: any) :: PointImpl))

return nil
