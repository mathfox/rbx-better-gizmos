import type { Tuple } from "@rbxts/phantom/src/Util/Tuple";
import type { Constructable, Draw } from "./helpers";

interface WireBox {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace WireBox {
	type Output = LuaTuple<Tuple<12, BoxHandleAdornment>>;
}

/**
 * Returns [x1, x2, x3, x4, y1, y2, y3, y4, z1, z2, z3, z4] handles.
 */
interface WireBoxConstructor
	extends WireBox,
		Constructable<WireBox, [adornee: PVInstance, container: Instance]>,
		Draw<WireBox.Output, [orientation: CFrame, size: Vector3]> {
	readonly __index: WireBoxConstructor;
}

declare const WireBox: WireBoxConstructor;

export = WireBox;
