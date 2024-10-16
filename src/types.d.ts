export type DefaultProperties<TProperties> = TProperties & {
	readonly _defaultProps: TProperties;
};
