import type { Constructable, Draw } from "./helpers";

interface Plane extends Draw<Plane.Output, [cf: CFrame, size?: Vector2]> {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Plane {
	type Output = BoxHandleAdornment;
}

interface PlaneConstructor extends Plane, Constructable<Plane, [adornee: PVInstance, container: Instance]> {
	readonly __index: PlaneConstructor;
}

declare const Plane: PlaneConstructor;

export = Plane;
