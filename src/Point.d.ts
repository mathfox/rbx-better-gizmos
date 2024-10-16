import type { Constructable, Draw } from "./helpers";

interface Point extends Draw<Point.Output, [position: Vector3]> {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	radius: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Point {
	type Output = SphereHandleAdornment;
}

interface PointConstructor extends Point, Constructable<Point, [adornee: PVInstance, container: Instance]> {
	readonly __index: PointConstructor;
}

declare const Point: PointConstructor;

export = Point;
