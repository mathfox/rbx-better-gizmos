--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)
local PointTypes = require(script.Parent.PointTypes)

local Point = {} :: PointTypes.PointImpl
Point.__index = Point

Point.color = nil
Point.radius = 0.1
Point.alwaysOnTop = true
Point.transparency = 0
Point.zindex = 0

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

function Point:assign(adornment, position)
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
	return self:assign(Instance.new("SphereHandleAdornment"), position)
end

return Point
