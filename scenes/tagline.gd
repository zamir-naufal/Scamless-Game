extends Label

signal typing_finished

@export var typing_speed: float = 0.1
@export var title_label: Label  # We'll assign this in the Inspector

func _ready():
	visible = false  # Hide the tagline at the start
	title_label.typing_finished.connect(_on_title_finished)

func _on_title_finished():
	visible = true
	type_text()

func type_text():
	var full_text = text
	visible_characters = 0
	
	for i in range(full_text.length()):
		visible_characters += 1
		await get_tree().create_timer(typing_speed).timeout
	
	typing_finished.emit()
