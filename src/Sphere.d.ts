import type { GizmoClass, GizmoDefault } from "./helpers";

interface Sphere {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type SphereOutput = CylinderHandleAdornment;

interface SphereConstructor
	extends Sphere,
		GizmoClass<Sphere, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<SphereOutput> {
	readonly __index: SphereConstructor;

	draw(position: Vector3): SphereOutput;

	assign<TOutput extends SphereOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Sphere: SphereConstructor;

export as namespace Sphere;
export = Sphere;
