import type Arrow from "./Arrow";
import type { Constructable, Draw } from "./helpers";

interface Ray {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Ray {
	type Output = Arrow.Output;
}

interface RayConstructor
	extends Ray,
		Constructable<Ray, [adornee: PVInstance, container: Instance]>,
		Draw<Ray.Output, [from: Vector3, direction: Vector3]> {
	readonly __index: RayConstructor;
}

declare const Ray: RayConstructor;

export = Ray;
