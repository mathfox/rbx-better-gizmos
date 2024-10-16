import type { GizmoClass, GizmoDefault } from "./helpers";

interface WireSphere {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type WireSphereOutput = CylinderHandleAdornment;

interface WireSphereConstructor
	extends WireSphere,
		GizmoClass<WireSphere, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<WireSphereOutput> {
	readonly __index: WireSphereConstructor;

	draw(position: Vector3): WireSphereOutput;

	assign<TOutput extends WireSphereOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const WireSphere: WireSphereConstructor;

export as namespace WireSphere;
export = WireSphere;
