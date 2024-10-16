import type { Constructable } from "./helpers";
import type Arrow from "./Arrow";
import type Box from "./Box";
import type Line from "./Line";
import type Point from "./Point";
import type Ray from "./Ray";
import type Sphere from "./Sphere";
import type Text from "./Text";
import type WireBox from "./WireBox";
import type WireSphere from "./WireSphere";

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

	readonly arrow: Arrow;
	readonly box: Box;
	readonly line: Line;
	readonly plane: Plane;
	readonly point: Point;
	readonly ray: Ray;
	readonly sphere: Sphere;
	readonly text: Text;
	readonly wirebox: WireBox;
	readonly wiresphere: WireSphere;
}

declare interface GizmoConstructor extends Omit<Gizmo, "destroy">, Constructable<Gizmo, []> {
	readonly __index: GizmoConstructor;

	/**
	 * @default Color3.fromRGB(255, 255, 0)
	 */
	color: Color3;
}

declare const Gizmo: GizmoConstructor;

export = Gizmo;
