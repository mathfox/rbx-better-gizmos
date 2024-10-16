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

type Output = SphereHandleAdornment

export type PointImpl = PointProperties & {
	__index: PointImpl,

	default: () -> Output,

	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Point,

	new: (adornee: PVInstance, container: Instance) -> Point,

	draw: (self: Point, position: Vector3) -> Output,

	assign: (self: Point, output: Output, position: Vector3) -> Output,
}

export type Point = typeof(setmetatable({} :: PointProperties, (nil :: any) :: PointImpl))

return nil
