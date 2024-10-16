import type { GizmoClass, GizmoDefault } from "./helpers";

interface WireBox {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type WireBoxOutput = CylinderHandleAdornment;

interface WireBoxConstructor
	extends WireBox,
		GizmoClass<WireBox, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<WireBoxOutput> {
	readonly __index: WireBoxConstructor;

	draw(position: Vector3): WireBoxOutput;

	assign<TOutput extends WireBoxOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const WireBox: WireBoxConstructor;

export as namespace WireBox;
export = WireBox;
