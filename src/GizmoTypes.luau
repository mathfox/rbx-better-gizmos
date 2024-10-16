--!strict
--!native
--!optimize 2

export type GizmoImpl = {
	__index: GizmoImpl,

	color: Color3,

	new: () -> Gizmo,

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

return nil
