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

interface PointConstructor {
	readonly __index: PointConstructor;

	readonly _construct: (self_: object, adornee: PVInstance, container: Instance) => Point;

	new (adornee: PVInstance, container: Instance): Point;

	draw(position: Vector3): Point.Output;

	assign(output: Point.Output, position: Vector3): Point.Output;
}

declare const Point: PointConstructor & Point;

export = Point;
