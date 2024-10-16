local Sphere = {} :: SphereImpl

function Sphere:draw(position, radius, style)
	local adornment = Instance.new("SphereHandleAdornment")

	adornment.Radius = radius
	adornment.CFrame = CFrame.new(position)
	adornment.Color3 = style and style.color or Gizmo.color
	adornment.Transparency = style and style.transparency or 0
	adornment.ZIndex = style and style.zindex or 1
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = style and style.alwaysOnTop or true

	return adornment
end
