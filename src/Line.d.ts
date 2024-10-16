import type { Constructable, Draw } from "./helpers";

interface Line {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Line {
	type Output = CylinderHandleAdornment;
}

interface LineConstructor
	extends Line,
		Constructable<Line, [adornee: PVInstance, container: Instance]>,
		Draw<Line.Output, [from: Vector3, to: Vector3]> {
	readonly __index: LineConstructor;
}

declare const Line: LineConstructor;

export = Line;
