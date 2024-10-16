--!nonstrict
--!native
--!optimize 2

export type BoxImpl = {
	__index: BoxImpl,

	draw: (
		self: Box,
		orientation: CFrame,
		size: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
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

export type WireBoxImpl = {
	__index: WireBoxImpl,

	draw: (
		self: WireBox,
		orientation: CFrame,
		size: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { BoxHandleAdornment },
}

export type WireBox = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: WireBoxImpl))

local WireBox = {} :: WireBoxImpl

function WireBox:draw(orientation, size, style)
	local x, y, z = size.X / 2, size.Y / 2, size.Z / 2
	local lineWidth = style and style.scale or 0.1

	local sizeX = Vector3.new(size.X + lineWidth, lineWidth, lineWidth)
	local sizeY = Vector3.new(lineWidth, size.Y + lineWidth, lineWidth)
	local sizeZ = Vector3.new(lineWidth, lineWidth, size.Z + lineWidth)

	local relativeOrientation = orientation

	local adornmentX1 = Instance.new("BoxHandleAdornment")
	local adornmentX2 = Instance.new("BoxHandleAdornment")
	local adornmentX3 = Instance.new("BoxHandleAdornment")
	local adornmentX4 = Instance.new("BoxHandleAdornment")
	local adornmentY1 = Instance.new("BoxHandleAdornment")
	local adornmentY2 = Instance.new("BoxHandleAdornment")
	local adornmentY3 = Instance.new("BoxHandleAdornment")
	local adornmentY4 = Instance.new("BoxHandleAdornment")
	local adornmentZ1 = Instance.new("BoxHandleAdornment")
	local adornmentZ2 = Instance.new("BoxHandleAdornment")
	local adornmentZ3 = Instance.new("BoxHandleAdornment")
	local adornmentZ4 = Instance.new("BoxHandleAdornment")

	adornmentX1.Size = sizeX
	adornmentX1.CFrame = relativeOrientation * CFrame.new(0, y, z)
	adornmentX1.Color3 = style and style.color or Gizmo.color
	adornmentX1.Transparency = style and style.transparency or 0
	adornmentX1.ZIndex = style and style.zindex or 1
	adornmentX1.Adornee = self.adornee
	adornmentX1.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentX2.Size = sizeX
	adornmentX2.CFrame = relativeOrientation * CFrame.new(0, -y, z)
	adornmentX2.Color3 = style and style.color or Gizmo.color
	adornmentX2.Transparency = style and style.transparency or 0
	adornmentX2.ZIndex = style and style.zindex or 1
	adornmentX2.Adornee = self.adornee
	adornmentX2.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentX3.Size = sizeX
	adornmentX3.CFrame = relativeOrientation * CFrame.new(0, y, -z)
	adornmentX3.Color3 = style and style.color or Gizmo.color
	adornmentX3.Transparency = style and style.transparency or 0
	adornmentX3.ZIndex = style and style.zindex or 1
	adornmentX3.Adornee = self.adornee
	adornmentX3.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentX4.Size = sizeX
	adornmentX4.CFrame = relativeOrientation * CFrame.new(0, -y, -z)
	adornmentX4.Color3 = style and style.color or Gizmo.color
	adornmentX4.Transparency = style and style.transparency or 0
	adornmentX4.ZIndex = style and style.zindex or 1
	adornmentX4.Adornee = self.adornee
	adornmentX4.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY1.Size = sizeY
	adornmentY1.CFrame = relativeOrientation * CFrame.new(x, 0, z)
	adornmentY1.Color3 = style and style.color or Gizmo.color
	adornmentY1.Transparency = style and style.transparency or 0
	adornmentY1.ZIndex = style and style.zindex or 1
	adornmentY1.Adornee = self.adornee
	adornmentY1.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY2.Size = sizeY
	adornmentY2.CFrame = relativeOrientation * CFrame.new(-x, 0, z)
	adornmentY2.Color3 = style and style.color or Gizmo.color
	adornmentY2.Transparency = style and style.transparency or 0
	adornmentY2.ZIndex = style and style.zindex or 1
	adornmentY2.Adornee = self.adornee
	adornmentY2.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY3.Size = sizeY
	adornmentY3.CFrame = relativeOrientation * CFrame.new(x, 0, -z)
	adornmentY3.Color3 = style and style.color or Gizmo.color
	adornmentY3.Transparency = style and style.transparency or 0
	adornmentY3.ZIndex = style and style.zindex or 1
	adornmentY3.Adornee = self.adornee
	adornmentY3.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentY4.Size = sizeY
	adornmentY4.CFrame = relativeOrientation * CFrame.new(-x, 0, -z)
	adornmentY4.Color3 = style and style.color or Gizmo.color
	adornmentY4.Transparency = style and style.transparency or 0
	adornmentY4.ZIndex = style and style.zindex or 1
	adornmentY4.Adornee = self.adornee
	adornmentY4.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ1.Size = sizeZ
	adornmentZ1.CFrame = relativeOrientation * CFrame.new(x, y, 0)
	adornmentZ1.Color3 = style and style.color or Gizmo.color
	adornmentZ1.Transparency = style and style.transparency or 0
	adornmentZ1.ZIndex = style and style.zindex or 1
	adornmentZ1.Adornee = self.adornee
	adornmentZ1.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ2.Size = sizeZ
	adornmentZ2.CFrame = relativeOrientation * CFrame.new(-x, y, 0)
	adornmentZ2.Color3 = style and style.color or Gizmo.color
	adornmentZ2.Transparency = style and style.transparency or 0
	adornmentZ2.ZIndex = style and style.zindex or 1
	adornmentZ2.Adornee = self.adornee
	adornmentZ2.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ3.Size = sizeZ
	adornmentZ3.CFrame = relativeOrientation * CFrame.new(x, -y, 0)
	adornmentZ3.Color3 = style and style.color or Gizmo.color
	adornmentZ3.Transparency = style and style.transparency or 0
	adornmentZ3.ZIndex = style and style.zindex or 1
	adornmentZ3.Adornee = self.adornee
	adornmentZ3.AlwaysOnTop = style and style.alwaysOnTop or true

	adornmentZ4.Size = sizeZ
	adornmentZ4.CFrame = relativeOrientation * CFrame.new(-x, -y, 0)
	adornmentZ4.Color3 = style and style.color or Gizmo.color
	adornmentZ4.Transparency = style and style.transparency or 0
	adornmentZ4.ZIndex = style and style.zindex or 1
	adornmentZ4.Adornee = self.adornee
	adornmentZ4.AlwaysOnTop = style and style.alwaysOnTop or true

	return {
		adornmentX1,
		adornmentX2,
		adornmentX3,
		adornmentX4,

		adornmentY1,
		adornmentY2,
		adornmentY3,
		adornmentY4,

		adornmentZ1,
		adornmentZ2,
		adornmentZ3,
		adornmentZ4,
	}
end

export type SphereImpl = {
	__index: SphereImpl,

	draw: (
		self: Sphere,
		position: Vector3,
		radius: number,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> SphereHandleAdornment,
}

export type Sphere = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: SphereImpl))

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

export type WireSphereImpl = {
	__index: WireSphereImpl,

	draw: (
		self: WireSphere,
		position: Vector3,
		radius: number,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { CylinderHandleAdornment },
}

export type WireSphere = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: WireSphereImpl))

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

export type LineImpl = {
	__index: LineImpl,

	draw: (
		self: Line,
		from: Vector3,
		to: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> CylinderHandleAdornment,
}

export type Line = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: LineImpl))

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

export type ArrowImpl = {
	__index: ArrowImpl,

	draw: (
		self: Arrow,
		from: Vector3,
		to: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { CylinderHandleAdornment | ConeHandleAdornment },
}

export type Arrow = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: ArrowImpl))

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

export type RayImpl = {
	__index: RayImpl,

	draw: (
		self: Ray,
		from: Vector3,
		direction: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { CylinderHandleAdornment | ConeHandleAdornment },
}

export type Ray = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: RayImpl))

local Ray = {} :: RayImpl

function Ray:draw(from, direction, style)
	return self.arrow:draw(from, from + direction, style)
end

export type PlaneImpl = {
	__index: PlaneImpl,

	draw: (
		self: Plane,
		cf: CFrame,
		size: Vector2?,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> BoxHandleAdornment,
}

export type Plane = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: PlaneImpl))

local Plane = {} :: PlaneImpl

function Plane:draw(cf, size, style)
	size = size or Vector2.new(10, 10)

	local adornmentPlane = Instance.new("BoxHandleAdornment")
	adornmentPlane.CFrame = cf
	adornmentPlane.Size = Vector3.new((size :: Vector2).X, (size :: Vector2).Y, 0)
	adornmentPlane.Color3 = style and style.color or Gizmo.color
	adornmentPlane.Transparency = style and style.transparency or 0
	adornmentPlane.ZIndex = style and style.zindex or 0
	adornmentPlane.Adornee = self.adornee
	adornmentPlane.AlwaysOnTop = style and style.alwaysOnTop or true

	return adornmentPlane
end

export type TextImpl = {
	__index: TextImpl,

	draw: (
		self: Text,
		position: Vector3,
		text: string,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { TextLabel | BillboardGui },
}

export type Text = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: TextImpl))

local Text = {} :: TextImpl

function Text:draw(position, text, style)
	local billboard = Instance.new("BillboardGui")

	local textScale = (style and style.scale or 0.1) * 8
	billboard.AlwaysOnTop = style and style.alwaysOnTop or true
	billboard.StudsOffsetWorldSpace = position
	billboard.Size = UDim2.fromScale(text:len() * 0.5 * textScale, textScale)
	billboard.LightInfluence = 0
	billboard.Adornee = self.adornee

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.RobotoMono
	label.TextColor3 = style and style.color or Gizmo.color
	label.TextTransparency = style and style.transparency or 0
	label.TextScaled = true
	label.Text = text
	label.Parent = billboard

	return { label = label, billboard = billboard }
end

Gizmo.__index = Gizmo

function Gizmo.new()
	local container = Instance.new("Folder")
	container.Name = "Gizmos"
	container.Archivable = false
	container.Parent = workspace

	local adornee = Instance.new("Part")
	adornee.Name = "GizmoAdornee"
	adornee.Anchored = true
	adornee.Archivable = false
	adornee.CanCollide = false
	adornee.CanQuery = false
	adornee.CanTouch = false
	adornee.Locked = true
	adornee.Size = Vector3.one
	adornee.CFrame = CFrame.identity
	adornee.Transparency = 1
	adornee.Parent = workspace

	local self = setmetatable({
		container = container,
		adornee = adornee :: PVInstance,
	}, Gizmo) :: Gizmo

	self.point = (
		setmetatable(table.clone(Point._defaultProps), {
			__index = function(_, index)
				return Point[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Point

	self.box = (
		setmetatable({}, {
			__index = function(_, index)
				return Box[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Box

	self.wirebox = (
		setmetatable({}, {
			__index = function(_, index)
				return WireBox[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: WireBox

	self.sphere = (
		setmetatable({}, {
			__index = function(_, index)
				return Sphere[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Sphere

	self.wiresphere = (
		setmetatable({}, {
			__index = function(_, index)
				return WireSphere[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: WireSphere

	self.line = (
		setmetatable({}, {
			__index = function(_, index)
				return Line[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Line

	self.arrow = (
		setmetatable({}, {
			__index = function(_, index)
				return Arrow[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Arrow

	self.ray = (
		setmetatable({}, {
			__index = function(_, index)
				return Ray[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Ray

	self.plane = (
		setmetatable({}, {
			__index = function(_, index)
				return Plane[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Plane

	self.text = (
		setmetatable({}, {
			__index = function(_, index)
				return Text[index] or rawget(self :: any, index)
			end,
		}) :: any
	) :: Text

	return self
end

function Gizmo:destroy()
	self.container:Destroy()
	self.adornee:Destroy()

	setmetatable(self :: any, nil)
end

return Gizmo
