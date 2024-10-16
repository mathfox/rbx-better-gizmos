import type { GizmoClass, GizmoDefault } from "./helpers";

interface Box {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type BoxOutput = BoxHandleAdornment;

interface BoxConstructor
	extends Box,
		GizmoClass<Box, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<BoxOutput> {
	readonly __index: BoxConstructor;

	draw(orientation: CFrame, size: Vector3): BoxOutput;

	assign<TOutput extends BoxOutput>(output: TOutput, orientation: CFrame, size: Vector3): TOutput;
}

declare const Box: BoxConstructor;

export as namespace Box;
export = Box;
