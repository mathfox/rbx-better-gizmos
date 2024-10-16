--!strict
--!native
--!optimize 2

local GizmoTypes = require(script.GizmoTypes)
local PointTypes = require(script.PointTypes)

local Gizmo = {} :: {
	new: (
	) -> GizmoTypes.Gizmo & {
		point: PointTypes.Point,
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
} & GizmoTypes.GizmoImpl

Gizmo.color = Color3.fromRGB(255, 255, 0)

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
	}, Gizmo)

	return self :: any
end

return Gizmo
