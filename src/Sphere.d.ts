import type { Constructable, Draw } from "./helpers";

interface Sphere extends Draw<Sphere.Output, [position: Vector3, radius: number]> {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Sphere {
	type Output = SphereHandleAdornment;
}

interface SphereConstructor extends Sphere, Constructable<Sphere, [adornee: PVInstance, container: Instance]> {
	readonly __index: SphereConstructor;
}

declare const Sphere: SphereConstructor;

export = Sphere;
