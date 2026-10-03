extends Button

@export var tagline_label: Label  # Assign in the Inspector

func _ready():
	visible = false  # Hide the button at the start
	# Optionally disable it so it can't be clicked while hidden
	disabled = true
	tagline_label.typing_finished.connect(_on_tagline_finished)

func _on_tagline_finished():
	visible = true
	disabled = false
	
	# Optional: fade in for a nicer effect
	modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5)
