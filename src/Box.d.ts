import type { Constructable, Draw } from "./helpers";

interface Box extends Draw<Box.Output, [orientation: CFrame, size: Vector3]> {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Box {
	type Output = BoxHandleAdornment;
}

interface BoxConstructor extends Box, Constructable<Box, [adornee: PVInstance, container: Instance]> {
	readonly __index: BoxConstructor;
}

declare const Box: BoxConstructor;

export = Box;
