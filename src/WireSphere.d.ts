import type { Tuple } from "@rbxts/phantom/src/Util/Tuple";
import type { Constructable, Draw } from "./helpers";

interface WireSphere {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type WireSphereOutput = Tuple<3, CylinderHandleAdornment>;

interface WireSphereConstructor
	extends WireSphere,
		Constructable<WireSphere, [adornee: PVInstance, container: Instance]>,
		Draw<WireSphereOutput, [position: Vector3, radius: number]> {
	readonly __index: WireSphereConstructor;
}

declare const WireSphere: WireSphereConstructor;

export = WireSphere;
