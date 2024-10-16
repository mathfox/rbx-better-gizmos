# rbx-better-gizmos

The source code of constructing handles was taken from: https://www.npmjs.com/package/@rbxts/gizmo

## Usage

The `draw` method call always returns a new Instance from the currently configured properties of the gizmo.

Global instance usage:
```ts
const output = Gizmo.point.draw(Vector3.zero)

// some time later
output.Destroy()
```

Constructing new instances that inherit properties from the global one:
```ts
const gizmo = new Gizmo()

const output = gizmo.point.draw(Vector3.zero)

// some time later
output.Destroy()
gizmo.destroy()
```

Note that you cannot destroy the global instance of the Gizmo.

## Repeated usage

Usually you only want to render the latest version of the gizmo.

For this you have to do the following:
```ts
const arrow = Gizmo.arrow.default()

SomeEvent.Connect(() => {
    Gizmo.arrow.assign(arrow, Vector3.zero, Vector3.zero.add(Vector3.one))
})

// when you no longer need to render arrow
arrow.Destroy()
```
