import type { Tuple } from "@rbxts/phantom/src/Util";

/**
 * Basically a wrapper around container and adornee part.
 */
interface Gizmo {
	/**
	 * The container used to hold all of the handles.
	 */
	readonly container: Folder;
	readonly adornee: Part;

	/**
	 * Destroys the container and adornee part.
	 * No further method calls are allow after this call.
	 */
	destroy(): void;

	readonly point: Gizmo.PointConstructor;
}

declare namespace Gizmo {
	export type DefaultProperties<TDefaultsProperties> = TDefaultsProperties & {
		_defaultProps: TDefaultsProperties;
	};

	export interface Draw<TOutput, TParams extends unknown[]> {
		/**
		 * Constructs a new instance from the given parameters.
		 */
		draw(...args: TParams): TOutput;

		/**
		 * Assigns all of the properties of TOutput.
		 * The same as `draw` method, except it does not create a new instance.
		 */
		assign(output: TOutput, ...args: TParams): TOutput;
	}

	export interface PointConstructor
		extends Draw<SphereHandleAdornment, [position: Vector3]>,
			DefaultProperties<{
				color?: Color3;
				radius: number;
				transparency: number;
				zindex: number;
				alwaysOnTop: boolean;
			}> {}

	export interface Box
		extends Draw<
			BoxHandleAdornment,
			[
				orientation: CFrame,
				size: Vector3,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	/**
	 * Returns [x1, x2, x3, x4, y1, y2, y3, y4, z1, z2, z3, z4] handles.
	 */
	export interface WireBox
		extends Draw<LuaTuple<Tuple<12, BoxHandleAdornment>>, [orientation: CFrame, size: Vector3]>,
			DefaultProperties<{
				scale: number;
				color?: Color3;
				transparency: number;
				zindex: number;
				alwaysOnTop: boolean;
			}> {}

	export interface Sphere
		extends Draw<
			SphereHandleAdornment,
			[
				position: Vector3,
				radius: number,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	export interface WireSphere
		extends Draw<
			Tuple<3, CylinderHandleAdornment>,
			[
				position: Vector3,
				radius: number,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	export interface Line
		extends Draw<
			CylinderHandleAdornment,
			[
				from: Vector3,
				to: Vector3,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	export interface Arrow
		extends Draw<
			[CylinderHandleAdornment, ConeHandleAdornment],
			[
				from: Vector3,
				to: Vector3,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	export interface Ray
		extends Draw<
			[CylinderHandleAdornment, ConeHandleAdornment],
			[
				from: Vector3,
				direction: Vector3,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	export interface Plane
		extends Draw<
			BoxHandleAdornment,
			[
				cf: CFrame,
				size?: Vector2,
				style?: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}

	export interface Text
		extends Draw<
			{
				billboard: BillboardGui;
				label: TextLabel;
			},
			[
				position: Vector3,
				text: string,
				style: Partial<{
					scale: number;
					color: Color3;
					transparency: number;
					zindex: number;
					alwaysOnTop: boolean;
				}>,
			]
		> {}
}

declare interface GizmoConstructor {
	__index: GizmoConstructor;

	/**
	 * @default Color3.fromRGB(255, 255, 0)
	 */
	color: Color3;

	new (): Gizmo;
}

declare const Gizmo: GizmoConstructor;

export = Gizmo;
