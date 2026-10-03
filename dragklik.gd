extends Control

var dragging: bool = false
var mouse_offset: Vector2 = Vector2.ZERO

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				# Calculate offset so the box doesn't snap to its top-left corner
				mouse_offset = global_position - get_global_mouse_position()
			else:
				dragging = false

	elif event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() + mouse_offset
