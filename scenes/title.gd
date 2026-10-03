extends Label

signal typing_finished  # <-- New custom signal

@export var typing_speed: float = 0.1

func _ready():
	type_text()

func type_text():
	var full_text = text
	visible_characters = 0
	
	for i in range(full_text.length()):
		visible_characters += 1
		await get_tree().create_timer(typing_speed).timeout
	
	typing_finished.emit()  # <-- Announce that we're done!
