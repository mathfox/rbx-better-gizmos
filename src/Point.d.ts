import type { GizmoClass } from "./helpers";

interface Point {
	color?: Color3;
	radius: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Point {
	type Output = SphereHandleAdornment;
}

interface PointConstructor extends Point, GizmoClass<Point, [adornee: PVInstance, container: Instance]> {
	readonly __index: PointConstructor;

	readonly default: () => Point.Output;

	draw(position: Vector3): Point.Output;

	assign<TOutput extends Point.Output>(output: TOutput, position: Vector3): TOutput;
}

declare const Point: PointConstructor;

export = Point;
