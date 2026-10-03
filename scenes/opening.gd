extends Control

func _ready() -> void:
	pass

func _on_aboutbutton_pressed() -> void:
	$aboutpopup.show()

func _on_exitabout_pressed() -> void:
	$aboutpopup.hide()

func _on_startbutton_pressed() -> void:
	SceneTransition.change_scene("res://scenes/scene_1.tscn")
