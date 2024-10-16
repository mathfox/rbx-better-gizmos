import type { Constructable, Draw } from "./helpers";

interface Line extends Draw<Line.Output, [from: Vector3, to: Vector3]> {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Line {
	type Output = CylinderHandleAdornment;
}

interface LineConstructor extends Line, Constructable<Line, [adornee: PVInstance, container: Instance]> {
	readonly __index: LineConstructor;
}

declare const Line: LineConstructor;

export = Line;
