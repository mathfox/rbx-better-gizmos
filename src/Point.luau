--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

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

local Point = {} :: PointImpl
Point.__index = Point

Point.adornee = nil
Point.container = nil
Point.color = nil
Point.radius = 0.1
Point.transparency = 0
Point.zindex = 0
Point.alwaysOnTop = true

function Point.default()
	return Instance.new("SphereHandleAdornment")
end

function Point:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Point)

	return self
end

Point:_construct(Gizmo.adornee, Gizmo.container)

function Point.new(adornee, container)
	return Point._construct({
		color = Point.color,
		radius = Point.radius,
		alwaysOnTop = Point.alwaysOnTop,
		transparency = Point.transparency,
		zindex = Point.zindex,
	}, adornee, container)
end

function Point:assign(output, position)
	local adornment = output

	adornment.Radius = self.radius * 0.5
	adornment.CFrame = CFrame.new(position)
	adornment.Color3 = self.color or Gizmo.color
	adornment.Transparency = self.transparency
	adornment.ZIndex = self.zindex
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = self.alwaysOnTop
	adornment.Parent = self.container

	return adornment
end

function Point:draw(position)
	return self:assign(self.default(), position)
end

return Point
