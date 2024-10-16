--!nonstrict
--!native
--!optimize 2

export type ArrowProperties = {
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

export type ArrowImpl = ArrowProperties & {
	__index: ArrowImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Arrow,
	new: (adornee: PVInstance, container: Instance) -> Arrow,

	draw: (self: Arrow, from: Vector3, to: Vector3) -> Output,
	assign: (self: Arrow, output: Output, from: Vector3, to: Vector3) -> Output,
}

export type Arrow = typeof(setmetatable({} :: ArrowProperties, (nil :: any) :: ArrowImpl))

local Gizmo = require(script.Parent.Gizmo)

local Arrow = {} :: ArrowImpl
Arrow.__index = Arrow

Arrow.adornee = nil
Arrow.container = nil
Arrow.color = nil
Arrow.scale = 0.1
Arrow.transparency = 0
Arrow.zindex = 0
Arrow.alwaysOnTop = true

function Arrow.default()
	local adornmentLine = Instance.new("CylinderHandleAdornment")
	local adornmentCone = Instance.new("ConeHandleAdornment")

	return { adornmentLine = adornmentLine, adornmentCone = adornmentCone }
end

function Arrow:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Arrow)

	return self
end

Arrow:_construct(Gizmo.adornee, Gizmo.container)

function Arrow.new(adornee, container)
	return Arrow._construct({
		color = Arrow.color,
		scale = Arrow.scale,
		transparency = Arrow.transparency,
		zindex = Arrow.zindex,
		alwaysOnTop = Arrow.alwaysOnTop,
	}, adornee, container)
end

function Arrow:assign(output, from, to)
	local coneHeight = self.scale * 3
	local distance = math.abs((to - from).Magnitude - coneHeight)
	local orientation = CFrame.lookAt(from, to)

	local adornmentLine = output.adornmentLine
	local adornmentCone = output.adornmentCone

	adornmentLine.Radius = self.scale * 0.5
	adornmentLine.InnerRadius = 0
	adornmentLine.Height = distance
	adornmentLine.CFrame = orientation * CFrame.new(0, 0, -distance * 0.5)
	adornmentLine.Color3 = self.color or Gizmo.color
	adornmentLine.Transparency = self.transparency
	adornmentLine.ZIndex = self.zindex
	adornmentLine.Adornee = self.adornee
	adornmentLine.AlwaysOnTop = self.alwaysOnTop

	adornmentCone.Height = coneHeight
	adornmentCone.Radius = coneHeight * 0.5
	adornmentCone.CFrame = orientation * CFrame.new(0, 0, -distance)
	adornmentCone.Color3 = self.color or Gizmo.color
	adornmentCone.Transparency = self.transparency
	adornmentCone.ZIndex = self.zindex
	adornmentCone.Adornee = self.adornee
	adornmentCone.AlwaysOnTop = self.alwaysOnTop

	return { adornmentLine = adornmentLine, adornmentCone = adornmentCone }
end

function Arrow:draw(from, to)
	return Arrow:assign(Arrow.default(), from, to)
end

return Arrow
