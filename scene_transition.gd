extends CanvasLayer

var fade_rect: ColorRect
var fade_duration: float = 1.0  # Change this once to affect all fades

func _ready() -> void:
	# Make sure this autoload persists across scene changes
	layer = 100  # Draw on top of everything
	
	# Create the black overlay
	fade_rect = ColorRect.new()
	fade_rect.color = Color.BLACK
	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fade_rect.modulate.a = 0.0
	fade_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(fade_rect)
	
	# Fade in whenever a new scene loads
	get_tree().node_added.connect(_on_node_added)

func _on_node_added(node: Node) -> void:
	# Only fade in when a scene root is added (not every child node)
	if node == get_tree().current_scene:
		fade_in()

func fade_in() -> void:
	fade_rect.modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, fade_duration)
	await tween.finished
	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

func change_scene(path: String) -> void:
	fade_rect.mouse_filter = Control.MOUSE_FILTER_STOP
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, fade_duration)
	await tween.finished
	get_tree().change_scene_to_file(path)
