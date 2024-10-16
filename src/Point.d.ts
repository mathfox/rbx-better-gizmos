import type { Constructable, Draw } from "./helpers";

interface Point {
	adornee: PVInstance;
	container: Instance;
	color?: Color3;
	radius: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type PointOutput = SphereHandleAdornment;

interface PointConstructor
	extends Point,
		Constructable<Point, [adornee: PVInstance, container: Instance]>,
		Draw<PointOutput, [position: Vector3]> {
	readonly __index: PointConstructor;
}

declare const Point: PointConstructor;

export as namespace Point;
export = Point;
