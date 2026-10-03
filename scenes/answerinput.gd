extends LineEdit

@export var correct_otp: String = "160527"
@export var verifyidentity: Control
@export var consequens: Control

func _ready() -> void:
	grab_focus()
	text_changed.connect(_on_text_changed)
	text_submitted.connect(_on_text_submitted)

# Filter to digits only, and auto-check when full length is reached
func _on_text_changed(new_text: String) -> void:
	var digits_only = ""
	for c in new_text:
		if c.is_valid_int():
			digits_only += c
	if digits_only != new_text:
		text = digits_only
		caret_column = text.length()
	
	# Auto-check when the player has typed the full OTP
	if text.length() == correct_otp.length():
		_check_otp()

# Also allow Enter key to trigger the check
func _on_text_submitted(_submitted_text: String) -> void:
	_check_otp()

func _check_otp() -> void:
	if text == correct_otp:
		# Correct — trigger the scam reveal
		verifyidentity.hide()
		consequens.show()
	else:
		await get_tree().create_timer(0.4).timeout
		text = ""
		grab_focus()


	
