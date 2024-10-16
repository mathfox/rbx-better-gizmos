# rbx-better-gizmos

The source code of constructing handles was taken from: https://www.npmjs.com/package/@rbxts/gizmo

## Usage

Global instance usage:
```ts
const output = Gizmo.point.draw(Vector3.zero)
```

Constructing new instances that inherit properties from the global one:
```ts
const gizmo = new Gizmo()

const output = gizmo.point.draw(Vector3.zero)

gizmo.destroy()
```

Note that you cannot destroy the global instance of the Gizmo.
