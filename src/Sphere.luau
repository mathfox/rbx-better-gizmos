--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type SphereProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = SphereHandleAdornment

export type SphereImpl = SphereProperties & {
	__index: SphereImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Sphere,
	new: (adornee: PVInstance, container: Instance) -> Sphere,

	draw: (self: Sphere, position: Vector3, radius: number) -> Output,
	assign: (self: Sphere, output: Output, position: Vector3, radius: number) -> Output,
}

export type Sphere = typeof(setmetatable({} :: SphereProperties, (nil :: any) :: SphereImpl))

local Sphere = {} :: SphereImpl
Sphere.__index = Sphere

Sphere.adornee = nil
Sphere.container = nil
Sphere.color = nil
Sphere.scale = 0.1
Sphere.transparency = 0
Sphere.zindex = 0
Sphere.alwaysOnTop = true

function Sphere.default()
	return Instance.new("SphereHandleAdornment")
end

function Sphere:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Sphere)

	return self
end

Sphere:_construct(Gizmo.adornee, Gizmo.container)

function Sphere.new(adornee, container)
	return Sphere._construct({
		color = Sphere.color,
		scale = Sphere.scale,
		transparency = Sphere.transparency,
		zindex = Sphere.zindex,
		alwaysOnTop = Sphere.alwaysOnTop,
	}, adornee, container)
end

function Sphere:assign(output, position, radius)
	local adornment = output

	adornment.Radius = radius
	adornment.CFrame = CFrame.new(position)
	adornment.Color3 = self.color or Gizmo.color
	adornment.Transparency = self.transparency
	adornment.ZIndex = self.zindex
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = self.alwaysOnTop

	return adornment
end

function Sphere:draw(position, radius)
	return self:assign(Sphere.default(), position, radius)
end

return Sphere
