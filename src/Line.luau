--!nonstrict
--!native
--!optimize 2

local Gizmo = require(script.Parent.Gizmo)

export type LineProperties = {
	adornee: PVInstance,
	container: Instance,
	color: Color3?,
	scale: number,
	transparency: number,
	zindex: number,
	alwaysOnTop: boolean,
}

export type Output = CylinderHandleAdornment

export type LineImpl = LineProperties & {
	__index: LineImpl,

	default: () -> Output,
	_construct: (self: {}, adornee: PVInstance, container: Instance) -> Line,
	new: (adornee: PVInstance, container: Instance) -> Line,

	draw: (self: Line, from: Vector3, to: Vector3) -> Output,
	assign: (self: Line, output: Output, from: Vector3, to: Vector3) -> Output,
}

export type Line = typeof(setmetatable({} :: LineProperties, (nil :: any) :: LineImpl))

local Line = {} :: LineImpl

function Line:__index(index)
	if index == "color" then
		return Gizmo.color
	end

	return rawget(Line, index)
end

Line.adornee = nil
Line.container = nil
Line.color = nil
Line.scale = 0.1
Line.transparency = 0
Line.zindex = 0
Line.alwaysOnTop = true

function Line.default()
	return Instance.new("CylinderHandleAdornment")
end

function Line:_construct(adornee, container)
	self.adornee = adornee
	self.container = container

	setmetatable(self, Line)

	return self
end

Line:_construct(Gizmo.adornee, Gizmo.container)

function Line.new(adornee, container)
	return Line._construct({
		color = Line.color,
		scale = Line.scale,
		transparency = Line.transparency,
		zindex = Line.zindex,
		alwaysOnTop = Line.alwaysOnTop,
	}, adornee, container)
end

function Line:assign(output, from, to)
	local distance = (to - from).Magnitude

	local adornment = output

	adornment.Radius = self.scale * 0.5
	adornment.InnerRadius = 0
	adornment.Height = distance
	adornment.CFrame = CFrame.lookAt(from, to) * CFrame.new(0, 0, -distance * 0.5)
	adornment.Color3 = self.color
	adornment.Transparency = self.transparency
	adornment.ZIndex = self.zindex
	adornment.Adornee = self.adornee
	adornment.AlwaysOnTop = self.alwaysOnTop
	adornment.Parent = self.container

	return adornment
end

function Line:draw(from, to)
	return self:assign(Line.default(), from, to)
end

return Line
