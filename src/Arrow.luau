--!nonstrict
--!native
--!optimize 2

local ArrowTypes = require(script.Parent.ArrowTypes)

local Gizmo = require(script.Parent.Gizmo)

local Arrow = {} :: ArrowTypes.ArrowImpl
Arrow.__index = Arrow

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
	setmetatable(self, Arrow)

	return self
end

function Arrow.new(adornee, container)
	return Arrow._construct({
		color = Arrow.color,
		scale = Arrow.scale,
		transparency = Arrow.transparency,
		zindex = Arrow.zindex,
		alwaysOnTop = Arrow.alwaysOnTop,
	}, adornee, container)
end

function Arrow:assign() end

function Arrow:draw(from, to, style)
	local coneHeight = (style and style.scale or 0.1) * 3
	local distance = math.abs((to - from).Magnitude - coneHeight)
	local orientation = CFrame.lookAt(from, to)

	local adornmentLine = Instance.new("CylinderHandleAdornment")
	local adornmentCone = Instance.new("ConeHandleAdornment")

	adornmentLine.Radius = (style and style.scale or 0.1) * 0.5
	adornmentLine.InnerRadius = 0
	adornmentLine.Height = distance
	adornmentLine.CFrame = orientation * CFrame.new(0, 0, -distance * 0.5)
	adornmentLine.Color3 = style and style.color or Gizmo.color
	adornmentLine.Transparency = style and style.transparency or 0
	adornmentLine.ZIndex = style and style.zindex or 0
	adornmentLine.Adornee = self.adornee
	adornmentLine.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentCone.Height = coneHeight
	adornmentCone.Radius = coneHeight * 0.5
	adornmentCone.CFrame = orientation * CFrame.new(0, 0, -distance)
	adornmentCone.Color3 = style and style.color or Gizmo.color
	adornmentCone.Transparency = style and style.transparency or 0
	adornmentCone.ZIndex = style and style.zindex or 0
	adornmentCone.Adornee = self.adornee
	adornmentCone.AlwaysOnTop = style and style.alwaysOnTop or true

	return { adornmentLine = adornmentLine, adornmentCone = adornmentCone }
end
