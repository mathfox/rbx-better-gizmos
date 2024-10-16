import type { Constructable, Draw } from "./helpers";

interface Box {
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

interface BoxConstructor
	extends Box,
		Constructable<Box, [adornee: PVInstance, container: Instance]>,
		Draw<Box.Output, [orientation: CFrame, size: Vector3]> {
	readonly __index: BoxConstructor;
}

declare const Box: BoxConstructor;

export as namespace Box;
export = Box;
