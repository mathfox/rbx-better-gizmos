--!nonstrict
--!native
--!optimize 2

local Arrow = require(script.Arrow)
local Box = require(script.Box)
local Gizmo = require(script.Gizmo)
local Line = require(script.Line)
local Plane = require(script.Plane)
local Point = require(script.Point)
local Ray = require(script.Ray)
local Sphere = require(script.Sphere)
local Text = require(script.Text)
local WireBox = require(script.WireBox)
local WireSphere = require(script.WireSphere)

type ModifiedGizmoProperties = Gizmo.GizmoProperties & {
	arrow: Arrow.Arrow,
	box: Box.Box,
	line: Line.Line,
	plane: Plane.Plane,
	point: Point.Point,
	ray: Ray.Ray,
	sphere: Sphere.Sphere,
	text: Text.Text,
	wirebox: WireBox.WireBox,
	wiresphere: WireSphere.WireSphere,
}

type ModifiedGizmoImpl = Gizmo.GizmoImpl & ModifiedGizmoProperties

Gizmo.arrow = Arrow
Gizmo.box = Box
Gizmo.line = Line
Gizmo.plane = Plane
Gizmo.point = Point
Gizmo.ray = Ray
Gizmo.sphere = Sphere
Gizmo.text = Text
Gizmo.wirebox = WireBox
Gizmo.wiresphere = WireSphere

return Gizmo :: typeof(setmetatable({} :: ModifiedGizmoProperties, (nil :: any) :: ModifiedGizmoImpl))
