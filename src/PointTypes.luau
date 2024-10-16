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

export type PointImpl = PointProperties & {
	__index: PointImpl,

	_construct: (self: {}) -> Point,

	new: (adornee: PVInstance, container: Instance) -> Point,

	draw: (self: Point, position: Vector3) -> SphereHandleAdornment,
	assign: (self: Point, adornment: SphereHandleAdornment, position: Vector3) -> (),
}

export type Point = typeof(setmetatable({} :: PointProperties, (nil :: any) :: PointImpl))

return nil
