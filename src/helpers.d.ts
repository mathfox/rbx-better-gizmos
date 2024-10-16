export interface GizmoClass<TClass, TParams extends unknown[]> {
	readonly _construct: (self_: object, ...args: TParams) => TClass;

	new (...args: TParams): TClass;
}

export interface GizmoDefault<TOutput> {
	readonly default: () => TOutput;
}
