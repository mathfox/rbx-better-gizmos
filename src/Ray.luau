--!nonstrict
--!native
--!optimize 2

local Arrow = require(script.Parent.Arrow)
local Gizmo = require(script.Parent.Gizmo)

export type RayProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = {
	adornmentLine: CylinderHandleAdornment,
	adornmentCone: ConeHandleAdornment,
}

export type RayImpl = RayProperties & {
	__index: RayImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Ray,
	new: (adornee: PVInstance, container: Instance) -> Ray,

	draw: (self: Ray, from: Vector3, direction: Vector3) -> Output,
	assign: (self: Ray, output: Output, from: Vector3, direction: Vector3) -> Output,
}

export type Ray = typeof(setmetatable({} :: RayProperties, (nil :: any) :: RayImpl))

local Ray = {} :: RayImpl
Ray.__index = Ray

Ray.adornee = nil
Ray.container = nil
Ray.color = nil
Ray.scale = 0.1
Ray.transparency = 0
Ray.zindex = 0
Ray.alwaysOnTop = true

function Ray.default()
	local adornmentLine = Instance.new("CylinderHandleAdornment")
	local adornmentCone = Instance.new("ConeHandleAdornment")

	return { adornmentLine = adornmentLine, adornmentCone = adornmentCone }
end

function Ray:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Ray)

	return self
end

Ray:_construct(Gizmo.adornee, Gizmo.container)

function Ray.new(adornee, container)
	return Ray._construct({
		color = Ray.color,
		scale = Ray.scale,
		transparency = Ray.transparency,
		zindex = Ray.zindex,
		alwaysOnTop = Ray.alwaysOnTop,
	}, adornee, container)
end

function Ray:assign(output, from, direction)
	return Arrow.assign(self, output, from, from + direction)
end

function Ray:draw(from, direction)
	return self:assign(Ray.default(), from, direction)
end

return Ray
