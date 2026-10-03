extends Control

@onready var popup1bank = $popup1bank

func _ready() -> void:
	var target_position = popup1bank.position
	popup1bank.position.y = -300
	await get_tree().create_timer(0.5).timeout
	var tween = create_tween()
	tween.tween_property(
		popup1bank,
		"position",
		target_position,
		0.8
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

func _on_buttonpopup_1_pressed() -> void:
	popup1bank.hide()
	$panelpopup2.show()

func _on_verifybutton_pressed() -> void:
	$"verifyidentity".show()
	$"verifyidentity".bounce_in()   # <-- Add this
	$panelpopup2.hide()

func _on_reportbutton_pressed() -> void:
	$"smartmovepanel".show()
	$panelpopup2.hide()

func _on_send_button_pressed() -> void:
	$verifyidentity/Panel/box/answerinput.show()

func _on_button_3_pressed() -> void:
	SceneTransition.change_scene("res://scenes/finalscene.tscn")


func _on_button_4_pressed() -> void:
	SceneTransition.change_scene("res://scenes/finalscene.tscn")
