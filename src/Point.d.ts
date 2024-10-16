import type { GizmoClass, GizmoDefault } from "./helpers";

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
		GizmoClass<Point, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<PointOutput> {
	readonly __index: PointConstructor;

	draw(position: Vector3): PointOutput;

	assign<TOutput extends PointOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Point: PointConstructor;

export as namespace Point;
export = Point;
