local Arrow = {} :: ArrowImpl

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

	return { adornmentLine, adornmentCone }
end
