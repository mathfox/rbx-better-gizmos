import type { GizmoClass, GizmoDefault } from "./helpers";

interface Text {
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

type TextOutput = CylinderHandleAdornment;

interface TextConstructor
	extends Text,
		GizmoClass<Text, [adornee: PVInstance, container: Instance]>,
		GizmoDefault<TextOutput> {
	readonly __index: TextConstructor;

	draw(position: Vector3): TextOutput;

	assign<TOutput extends TextOutput>(output: TOutput, position: Vector3): TOutput;
}

declare const Text: TextConstructor;

export as namespace Text;
export = Text;
