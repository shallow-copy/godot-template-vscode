# Godot VSCode Template

This is an opinionated starter template for Godot 4 projects. It's geared towards quickly starting new projects for game jams, but it's suitable for any Godot project.


## Nice-to-knows

This should work out of the box. There are just a few things to be aware of:

1. You'll probably want to change the project name from "New Game Project" to something else. That property lives in `project.godot`. You can either update that file directly or via Project Settings.
2. The root node in the main scene/script is just a `Node`. It works and it should be fine for most cases, but feel free to change its type to whatever makes sense for your project.
3. The Godot files live in `~/godot` and this is the directory you should open in VSCode. The subdirectory was included in case you want to track other things in this repo that don't typically live in a Godot project folder (e.g. working files, Rust bindings, deployment scripts, tangential assets like Steam capsule images, etc).


## Explanation of changes

**Note:** Feel free to revert/edit any of these changes to suit your needs and preferences.

1. `project.godot`
	- Tweaks GDScript settings (Project Settings > Debug > GDScript); it'll warn you about unsafe/untyped code.
	- Adds a main scene (`scenes/main.tscn`) with its own script (`scenes/main.gd`), which is set to be the default scene.
	- Sets the renderer to "Mobile".
2. `.vscode/godot.code-snippets`
	- `fn`: like the `func` snippet that comes with the godot-tools extension but with a return type.
3. `.vscode/launch.json`
	- Adds a debug launch configuration for VSCode.
4. `.vscode/settings.json`
	- Points at the Godot executable for the godot-tools extension (you'll need to change this if you're on Linux/Windows).
	- Adds a cSpell ignore list (e.g. "onready").
	- Makes tab indents the default (to match GDScript conventions).
5. `export_presets.cfg`
	- Adds a web export preset (exports to `build/` whose contents are gitignore'd).
	- Additionally enables VRAM Texture Compression for Mobile.
6. `lib/reconciler.gd` + `state/state.gd`
	- Adds a `Reconciler` class for a (somewhat) React-like development experience. A boilerplate example is included in scenes/main.gd.
