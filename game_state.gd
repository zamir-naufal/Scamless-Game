extends Node

var score: int = 0

func add_point() -> void:
	score += 1
	print("[GameState] add_point called. Score is now: ", score)

func reset_score() -> void:
	print("[GameState] reset_score called. Resetting from ", score, " to 0")
	score = 0
