import type { GizmoClass, GizmoDefault } from "./helpers";

interface Line {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type LineOutput = CylinderHandleAdornment;

interface LineConstructor
	extends Line,
		GizmoClass<Line, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<LineOutput> {
	readonly __index: LineConstructor;

	draw(position: Vector3): LineOutput;

	assign<TOutput extends LineOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Line: LineConstructor;

export as namespace Line;
export = Line;
