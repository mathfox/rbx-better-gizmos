--!strict
--!native
--!optimize 2

local GizmoTypes = require(script.Parent.GizmoTypes)
local types = require(script.Parent.types)

export type PointProperties = {
	color: Color3?,
	radius: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type PointImpl = types.DefaultProperties<PointProperties> & {
	__index: PointImpl,

	draw: (self: Point, position: Vector3) -> SphereHandleAdornment,
	assign: (self: Point, adornment: SphereHandleAdornment, position: Vector3) -> (),
}

export type Point = typeof(setmetatable({} :: GizmoTypes.GizmoProperties & PointProperties, (nil :: any) :: PointImpl))

return nil
