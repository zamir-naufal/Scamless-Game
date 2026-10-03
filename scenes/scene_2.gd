extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interactionarea_body_entered(body: Node2D) -> void:
	if body.name == "samuel":
		$CanvasLayer/ui/buy1ketoprak.show()


func _on_interactionarea_body_exited(body: Node2D) -> void:
	if body.name == "samuel":
		$CanvasLayer/ui/buy1ketoprak.hide()


func _on_buy_1_ketoprak_pressed() -> void:
	$"CanvasLayer/ui/buy1ketoprak".hide()

	var item = $"CanvasLayer/ui/+ketoprak"
	item.show()

	item.modulate.a = 1.0

	var start_position = item.position

	var tween = create_tween()
	tween.set_parallel(true)

	tween.tween_property(
		item,
		"position",
		start_position + Vector2(0, -50),
		1.2
	)

	tween.tween_property(
		item,
		"modulate:a",
		0.0,
		1.2
	)

	await tween.finished

	item.hide()
	item.position = start_position
	item.modulate.a = 1.0

	# MUNCULKAN PAY NOW
	var paynow = $"CanvasLayer/ui/paynow"
	paynow.show()

	# Animasi melayang
	var pay_start_position = paynow.position

	var float_tween = create_tween().set_loops()
	float_tween.tween_property(
		paynow,
		"position:y",
		pay_start_position.y - 5,
		0.7
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	float_tween.tween_property(
		paynow,
		"position:y",
		pay_start_position.y + 5,
		0.7
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)



	


func _on_paynow_pressed() -> void:
	$"qrpopup".show()
	


func _on_button_1_pressed() -> void:
	$"moneylost".show()
	$"qrpopup".hide()


func _on_button_2_pressed() -> void:
	$"smartmovepanel".show()
	$"qrpopup".hide()


func _on_button_4_pressed() -> void:
	SceneTransition.change_scene("res://scenes/scene_3.tscn")

func _on_button_3_pressed() -> void:
	SceneTransition.change_scene("res://scenes/scene_3.tscn")
