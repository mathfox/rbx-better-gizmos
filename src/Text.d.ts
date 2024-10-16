import type { Constructable, Draw } from "./helpers";

interface Text extends Draw<Text.Output, [position: Vector3, text: string]> {
	readonly adornee: PVInstance;
	readonly container: Instance;
	color?: Color3;
	scale: number;
	transparency: number;
	zindex: number;
	alwaysOnTop: boolean;
}

declare namespace Text {
	interface Output {
		billboard: BillboardGui;
		label: TextLabel;
	}
}

interface TextConstructor extends Text, Constructable<Text, [adornee: PVInstance, container: Instance]> {
	readonly __index: TextConstructor;
}

declare const Text: TextConstructor;

export = Text;
