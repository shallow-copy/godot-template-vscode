extends Node

var state := State.new()

@onready var reconciler := Reconciler.create($Dynamic)


func _ready() -> void:
	state.changed.connect(render)
	render()


func render() -> void:
	var size := get_viewport().get_visible_rect().size
	var label: Label = reconciler.node(Label, "Count")
	label.text = str(state.count)
	label.position = size / 2

	for direction in [-1, 1] as Array[int]:
		var btn: Button = reconciler.node(Button, "Btn%s" % direction)
		btn.text = "+" if direction == 1 else "-"
		btn.position = size / 2
		btn.position.x += 32 * direction
		if !btn.pressed.has_connections():
			btn.pressed.connect(func () -> void: state.increment_count(direction))

	reconciler.flush()
