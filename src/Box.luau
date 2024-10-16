--!nonstrict
--!native
--!optimize 2

export type BoxProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type BoxOutput = ""

export type BoxImpl = BoxProperties & {
	__index: BoxImpl,

	draw: (
		self: Box,
		orientation: CFrame,
		size: Vector3,
	) -> BoxHandleAdornment,
}

export type Box = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: BoxImpl))

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
