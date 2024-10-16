--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type PlaneProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = BoxHandleAdornment

export type PlaneImpl = PlaneProperties & {
	__index: PlaneImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Plane,
	new: (adornee: PVInstance, container: Instance) -> Plane,

	draw: (self: Plane, cf: CFrame, size: Vector2?) -> Output,
	assign: (self: Plane, output: Output, cf: CFrame, size: Vector2?) -> Output,
}

export type Plane = typeof(setmetatable({} :: PlaneProperties, (nil :: any) :: PlaneImpl))

local Plane = {} :: PlaneImpl
Plane.__index = Plane

Plane.adornee = nil
Plane.container = nil
Plane.color = nil
Plane.scale = 0.1
Plane.transparency = 0
Plane.zindex = 0
Plane.alwaysOnTop = true

function Plane.default()
	return Instance.new("BoxHandleAdornment")
end

function Plane:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Plane)

	return self
end

Plane:_construct(Gizmo.adornee, Gizmo.container)

function Plane.new(adornee, container)
	return Plane._construct({
		color = Plane.color,
		scale = Plane.scale,
		transparency = Plane.transparency,
		zindex = Plane.zindex,
		alwaysOnTop = Plane.alwaysOnTop,
	}, adornee, container)
end

function Plane:assign(output, cf, size)
	size = size or Vector2.new(10, 10)

	local adornmentPlane = output

	adornmentPlane.CFrame = cf
	adornmentPlane.Size = Vector3.new((size :: Vector2).X, (size :: Vector2).Y, 0)
	adornmentPlane.Color3 = self.color or Gizmo.color
	adornmentPlane.Transparency = self.transparency
	adornmentPlane.ZIndex = self.zindex
	adornmentPlane.Adornee = self.adornee
	adornmentPlane.AlwaysOnTop = self.alwaysOnTop
	adornmentPlane.Parent = self.container

	return adornmentPlane
end

function Plane:draw(cf, size)
	return self:assign(Plane.default(), cf, size)
end

return Plane
