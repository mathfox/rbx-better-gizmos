import type { GizmoClass, GizmoDefault } from "./helpers";

interface Ray {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type RayOutput = CylinderHandleAdornment;

interface RayConstructor
	extends Ray,
		GizmoClass<Ray, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<RayOutput> {
	readonly __index: RayConstructor;

	draw(position: Vector3): RayOutput;

	assign<TOutput extends RayOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Ray: RayConstructor;

export as namespace Ray;
export = Ray;
