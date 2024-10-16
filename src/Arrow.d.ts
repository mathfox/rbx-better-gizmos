import type { Constructable, Draw } from "./helpers";

interface Arrow {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Arrow {
	interface Output {
		adornmentLine: CylinderHandleAdornment;
		adornmentCone: ConeHandleAdornment;
	}
}

interface ArrowConstructor
	extends Arrow,
		Constructable<Arrow, [adornee: PVInstance, container: Instance]>,
		Draw<Arrow.Output, [from: Vector3, to: Vector3]> {
	readonly __index: ArrowConstructor;
}

declare const Arrow: ArrowConstructor;

export as namespace Arrow;
export = Arrow;
