local Box = {} :: BoxImpl

function Box:draw(orientation, size, style)
	local adornment = Instance.new("BoxHandleAdornment")

	adornment.Size = size
	adornment.CFrame = orientation
	adornment.Color3 = style and style.color or Gizmo.color
	adornment.Transparency = style and style.transparency or 0
	adornment.ZIndex = style and style.zindex or 1
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = style and style.alwaysOnTop or true

	return adornment
end
