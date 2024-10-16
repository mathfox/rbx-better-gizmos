# rbx-better-gizmos

Source: https://www.npmjs.com/package/@rbxts/gizmo

## Difference

There is no longer such term as "global" gizmo.

## Usage

Global instance usage:
```ts
const output = Gizmo.point.draw(Vector3.zero)
```


Constructing new instances that inherit properties from the global one.
```ts
const gizmo = new Gizmo()

const output = gizmo.point.draw(Vector3.zero)
```
