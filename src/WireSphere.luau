local WireSphere = {} :: WireSphereImpl

function WireSphere:draw(position, radius, style)
	local offset = (style and style.scale or 0.1) * 0.5
	local outerRadius, innerRadius = radius + offset, radius - offset

	local relativeOrientation = CFrame.new(position)

	local adornmentX = Instance.new("CylinderHandleAdornment")
	local adornmentY = Instance.new("CylinderHandleAdornment")
	local adornmentZ = Instance.new("CylinderHandleAdornment")

	adornmentX.Radius = outerRadius
	adornmentX.InnerRadius = innerRadius
	adornmentX.Height = style and style.scale or 0.1
	adornmentX.CFrame = relativeOrientation
	adornmentX.Color3 = style and style.color or Gizmo.color
	adornmentX.Transparency = style and style.transparency or 0
	adornmentX.ZIndex = style and style.zindex or 0
	adornmentX.Adornee = self.adornee
	adornmentX.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY.Radius = outerRadius
	adornmentY.InnerRadius = innerRadius
	adornmentY.Height = style and style.scale or 0.1
	adornmentY.CFrame = relativeOrientation * CFrame.Angles(math.pi * 0.5, 0, 0)
	adornmentY.Color3 = style and style.color or Gizmo.color
	adornmentY.Transparency = style and style.transparency or 0
	adornmentY.ZIndex = style and style.zindex or 0
	adornmentY.Adornee = self.adornee
	adornmentY.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ.Radius = outerRadius
	adornmentZ.InnerRadius = innerRadius
	adornmentZ.Height = style and style.scale or 0.1
	adornmentZ.CFrame = relativeOrientation * CFrame.Angles(0, math.pi * 0.5, 0)
	adornmentZ.Color3 = style and style.color or Gizmo.color
	adornmentZ.Transparency = style and style.transparency or 0
	adornmentZ.ZIndex = style and style.zindex or 0
	adornmentZ.Adornee = self.adornee
	adornmentZ.AlwaysOnTop = style and style.alwaysOnTop or true

	return { adornmentX, adornmentY, adornmentZ }
end
