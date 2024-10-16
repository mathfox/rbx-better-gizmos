import type { DefaultProperties } from "./types";

interface Point {
	color?: Color3;
	radius: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

interface PointConstructor
	extends DefaultProperties<{
		color?: Color3;
		radius: number;
		transparency: number;
		zindex: number;
		alwaysOnTop: boolean;
	}> {
	readonly __index: PointConstructor;

	new (adornee: PVInstance, container: Instance): Point;

	draw(position: Vector3): SphereHandleAdornment;

	assign(output: SphereHandleAdornment, position: Vector3): SphereHandleAdornment;
}

declare const Point: PointConstructor;

export = Point;
