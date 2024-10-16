export interface GizmoClass<TClass, TParams extends unknown[]> {
	readonly _construct: (self_: object, ...args: TParams) => TClass;

	new (...args: TParams): TClass;
}

export interface Default<TOutput> {
	readonly default: () => TOutput;
}

export interface Draw<TOutput, TParams extends unknown[]> {
	draw(...args: TParams): TOutput;

	assign<TInput extends TOutput>(output: TInput, ...args: TParams): TInput;
}
