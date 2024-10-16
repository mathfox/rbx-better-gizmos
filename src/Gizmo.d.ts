/**
 * Basically a wrapper around container and adornee part.
 */
interface Gizmo {
	/**
	 * The container used to hold all of the handles.
	 */
	readonly container: Folder;
	readonly adornee: Part;

	/**
	 * Destroys the container and adornee part.
	 * No further method calls are allow after this call.
	 */
	destroy(): void;

	//readonly point: Gizmo.PointConstructor;
}

declare interface GizmoConstructor {
	__index: GizmoConstructor;

	/**
	 * @default Color3.fromRGB(255, 255, 0)
	 */
	color: Color3;

	_construct: (self_: object) => Gizmo;

	new (): Gizmo;
}

declare const Gizmo: GizmoConstructor & Omit<Gizmo, "destroy">;

export = Gizmo;
