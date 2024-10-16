local Line = {} :: LineImpl

function Line:draw(from, to, style)
	local distance = (to - from).Magnitude

	local adornment = Instance.new("CylinderHandleAdornment")

	adornment.Radius = (style and style.scale or 0.1) * 0.5
	adornment.InnerRadius = 0
	adornment.Height = distance
	adornment.CFrame = CFrame.lookAt(from, to) * CFrame.new(0, 0, -distance * 0.5)
	adornment.Color3 = style and style.color or Gizmo.color
	adornment.Transparency = style and style.transparency or 0
	adornment.ZIndex = style and style.zindex or 0
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = style and style.alwaysOnTop or true

	return adornment
end
