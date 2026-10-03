extends Control

@onready var otpcode = $otpcode

func bounce_in() -> void:
	# Capture original position (the "resting" spot)
	var target_position = otpcode.position
	
	# Move it up above its resting spot
	otpcode.position.y = target_position.y - 300
	
	await get_tree().create_timer(0.1).timeout
	
	var tween = create_tween()
	tween.tween_property(otpcode, "position", target_position, 3.0) \
		.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
