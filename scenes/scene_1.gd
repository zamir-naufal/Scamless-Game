extends Control

@onready var popup1 = $popup1

func _ready() -> void:
	var target_position = popup1.position
	popup1.position.y = -300
	await get_tree().create_timer(0.5).timeout
	var tween = create_tween()
	tween.tween_property(
		popup1,
		"position",
		target_position,
		0.8
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

func _on_button_pressed() -> void:
	$panelpopup2.show()
	$popup1.hide()

func _on_button_2_pressed() -> void:
	SceneTransition.change_scene("res://scenes/scene_2.tscn")
