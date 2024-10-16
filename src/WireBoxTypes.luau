export type WireBoxImpl = {
	__index: WireBoxImpl,

	draw: (
		self: WireBox,
		orientation: CFrame,
		size: Vector3,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { BoxHandleAdornment },
}

export type WireBox = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: WireBoxImpl))
