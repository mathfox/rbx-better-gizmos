interface Point {
	color?: Color3;
	radius: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

interface PointConstructor {
	readonly __index: PointConstructor;

	readonly default: () => SphereHandleAdornment;

	readonly _construct: (self_: object, adornee: PVInstance, container: Instance) => Point;

	new (adornee: PVInstance, container: Instance): Point;

	draw(position: Vector3): SphereHandleAdornment;

	assign(output: SphereHandleAdornment, position: Vector3): SphereHandleAdornment;
}

declare const Point: PointConstructor & Point;

export = Point;
