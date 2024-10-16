export type TextImpl = {
	__index: TextImpl,

	draw: (
		self: Text,
		position: Vector3,
		text: string,
		style: {
			scale: number?,
			color: Color3?,
			transparency: number?,
			zindex: number?,
			alwaysOnTop: boolean?,
		}?
	) -> { TextLabel | BillboardGui },
}

export type Text = typeof(setmetatable({} :: GizmoProperties, (nil :: any) :: TextImpl))
