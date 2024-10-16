import type { GizmoClass, GizmoDefault } from "./helpers";

interface Plane {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type PlaneOutput = CylinderHandleAdornment;

interface PlaneConstructor
	extends Plane,
		GizmoClass<Plane, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<PlaneOutput> {
	readonly __index: PlaneConstructor;

	draw(position: Vector3): PlaneOutput;

	assign<TOutput extends PlaneOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Plane: PlaneConstructor;

export as namespace Plane;
export = Plane;
