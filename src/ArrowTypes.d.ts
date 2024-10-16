interface Arrow {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}
interface Output {
	adornmentLine: CylinderHandleAdornment;
	adornmentCone: ConeHandleAdornment;
}

interface ArrowConstructor {
	readonly __index: ArrowConstructor;

	readonly default: () => Output;

	readonly _construct: (self_: object, adornee: PVInstance, container: Instance) => Arrow;

	new (adornee: PVInstance, container: Instance): Arrow;

	draw(position: Vector3): Output;

	assign(output: Output, position: Vector3): Output;
}

declare const Arrow: ArrowConstructor & Arrow;

export = Arrow;
