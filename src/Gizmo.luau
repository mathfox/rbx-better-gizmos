--!nonstrict
--!native
--!optimize 2

export type GizmoImpl = {
	__index: GizmoImpl,

	color: Color3,

	new: () -> Gizmo,

	_construct: (self: {}) -> Gizmo,

	destroy: (self: Gizmo) -> (),
}

export type GizmoProperties = {
	adornee: PVInstance,
	container: Folder,

	--point: Point,
	--box: Box,
	--wirebox: WireBox,
	--sphere: Sphere,
	--wiresphere: WireSphere,
	--line: Line,
	--arrow: Arrow,
	--ray: Ray,
	--plane: Plane,
	--text: Text,
}

export type Gizmo = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: GizmoImpl))

local Gizmo = {} :: {
	new: (
	) -> Gizmo & {
		--point: PointTypes.Point,
		--box: Box,
		--wirebox: WireBox,
		--sphere: Sphere,
		--wiresphere: WireSphere,
		--line: Line,
		--arrow: Arrow,
		--ray: Ray,
		--plane: Plane,
		--text: Text,
	},
} & GizmoImpl & Gizmo

Gizmo.color = Color3.fromRGB(255, 255, 0)

function Gizmo:_construct()
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

	self.container = container
	self.adornee = adornee :: PVInstance

	setmetatable(self, Gizmo)

	return self
end

Gizmo:_construct()

function Gizmo.new()
	local self = {
		color = Gizmo.color,
	}

	function self:destroy()
		self.container:Destroy()
		self.adornee:Destroy()

		setmetatable(self :: any, nil)
	end

	return Gizmo._construct(self)
end

return Gizmo
