import type { Constructable, Draw } from "./helpers";

interface Sphere {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Sphere {
	type Output = SphereHandleAdornment;
}

interface SphereConstructor
	extends Sphere,
		Constructable<Sphere, [adornee: PVInstance, container: Instance]>,
		Draw<Sphere.Output, [position: Vector3, radius: number]> {
	readonly __index: SphereConstructor;
}

declare const Sphere: SphereConstructor;

export as namespace Sphere;
export = Sphere;
