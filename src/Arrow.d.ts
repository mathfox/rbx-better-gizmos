import type { Default, Draw, GizmoClass } from "./helpers";

interface Arrow {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

interface ArrowOutput {
	adornmentLine: CylinderHandleAdornment;
	adornmentCone: ConeHandleAdornment;
}

interface ArrowConstructor
	extends Arrow,
		GizmoClass<Arrow, [adornee: PVInstance, container: Instance]>,
		Default<ArrowOutput>,
		Draw<ArrowOutput, [position: Vector3]> {
	readonly __index: ArrowConstructor;

	//draw(position: Vector3): ArrowOutput;
	//assign<TOutput extends ArrowOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Arrow: ArrowConstructor;

export as namespace Arrow;
export = Arrow;
