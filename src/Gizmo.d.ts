import type { GizmoClass } from "./helpers";

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

declare interface GizmoConstructor extends Omit<Gizmo, "destroy">, GizmoClass<Gizmo, []> {
	readonly __index: GizmoConstructor;

	/**
	 * @default Color3.fromRGB(255, 255, 0)
	 */
	color: Color3;
}

declare const Gizmo: GizmoConstructor;

export = Gizmo;
