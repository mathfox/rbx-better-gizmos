--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type WireSphereProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = { CylinderHandleAdornment }

export type WireSphereImpl = WireSphereProperties & {
	__index: WireSphereImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> WireSphere,
	new: (adornee: PVInstance, container: Instance) -> WireSphere,

	draw: (self: WireSphere, position: Vector3, radius: number) -> Output,
	assign: (self: WireSphere, output: Output, position: Vector3, radius: number) -> Output,
}

export type WireSphere = typeof(setmetatable({} :: WireSphereProperties, (nil :: any) :: WireSphereImpl))

local WireSphere = {} :: WireSphereImpl
WireSphere.__index = WireSphere

WireSphere.adornee = nil
WireSphere.container = nil
WireSphere.color = nil
WireSphere.scale = 0.1
WireSphere.transparency = 0
WireSphere.zindex = 0
WireSphere.alwaysOnTop = true

function WireSphere.default()
	return {
		Instance.new("CylinderHandleAdornment"),
		Instance.new("CylinderHandleAdornment"),
		Instance.new("CylinderHandleAdornment"),
	}
end

function WireSphere:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, WireSphere)

	return self
end

WireSphere:_construct(Gizmo.adornee, Gizmo.container)

function WireSphere.new(adornee, container)
	return WireSphere._construct({
		color = WireSphere.color,
		scale = WireSphere.scale,
		transparency = WireSphere.transparency,
		zindex = WireSphere.zindex,
		alwaysOnTop = WireSphere.alwaysOnTop,
	}, adornee, container)
end

function WireSphere:assign(output, position, radius)
	local offset = self.scale * 0.5
	local outerRadius, innerRadius = radius + offset, radius - offset

	local relativeOrientation = CFrame.new(position)

	for _, adornment in output do
		adornment.Radius = outerRadius
		adornment.InnerRadius = innerRadius
		adornment.Height = self.scale
		adornment.Color3 = self.color or Gizmo.color
		adornment.Transparency = self.transparency
		adornment.ZIndex = self.zindex
		adornment.Adornee = self.adornee
		adornment.AlwaysOnTop = self.alwaysOnTop
	end

	local adornmentX = output[1]
	local adornmentY = output[2]
	local adornmentZ = output[3]

	adornmentX.CFrame = relativeOrientation
	adornmentY.CFrame = relativeOrientation * CFrame.Angles(math.pi * 0.5, 0, 0)
	adornmentZ.CFrame = relativeOrientation * CFrame.Angles(0, math.pi * 0.5, 0)

	return output
end

function WireSphere:draw(position, radius)
	return self:assign(WireSphere.default(), position, radius)
end

return WireSphere
