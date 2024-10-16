interface Arrow {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Arrow {
	type Output = [CylinderHandleAdornment, ConeHandleAdornment];
}

interface ArrowConstructor {
	readonly __index: ArrowConstructor;

	readonly _construct: (self_: object, adornee: PVInstance, container: Instance) => Arrow;

	new (adornee: PVInstance, container: Instance): Arrow;

	draw(position: Vector3): LuaTuple<Arrow.Output>;

	assign(output: Arrow.Output, position: Vector3): LuaTuple<Arrow.Output>;
}

declare const Arrow: ArrowConstructor & Arrow;

export = Arrow;
