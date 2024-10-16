export interface Constructable<TClass, TParams extends unknown[]> {
	readonly _construct: (self_: object, ...args: TParams) => TClass;

	new (...args: TParams): TClass;
}

export interface Draw<TOutput, TParams extends unknown[]> {
	readonly default: () => TOutput;

	draw(...args: TParams): TOutput;

	assign<TInput extends TOutput>(output: TInput, ...args: TParams): TInput;
}
