--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type BoxProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = BoxHandleAdornment

export type BoxImpl = BoxProperties & {
	__index: BoxImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Box,
	new: (adornee: PVInstance, container: Instance) -> Box,

	draw: (self: Box, orientation: CFrame, size: Vector3) -> Output,
	assign: (self: Box, output: Output, orientation: CFrame, size: Vector3) -> Output,
}

export type Box = typeof(setmetatable({} :: BoxProperties, (nil :: any) :: BoxImpl))

local Box = {} :: BoxImpl
Box.__index = Box

Box.adornee = nil
Box.container = nil
Box.color = nil
Box.scale = 0.1
Box.transparency = 0
Box.zindex = 0
Box.alwaysOnTop = true

function Box.default()
	return Instance.new("BoxHandleAdornment")
end

function Box:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Box)

	return self
end

Box:_construct(Gizmo.adornee, Gizmo.container)

function Box.new(adornee, container)
	return Box._construct({
		color = Box.color,
		scale = Box.scale,
		transparency = Box.transparency,
		zindex = Box.zindex,
		alwaysOnTop = Box.alwaysOnTop,
	}, adornee, container)
end

function Box:assign(output, orientation, size)
	local adornment = output

	adornment.Size = size
	adornment.CFrame = orientation
	adornment.Color3 = self.color or Gizmo.color
	adornment.Transparency = self.transparency
	adornment.ZIndex = self.zindex
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = self.alwaysOnTop

	return output
end

function Box:draw(orientation, size)
	return self:assign(Box.default(), orientation, size)
end

return Box
