extends Node

var current_health = 5

signal on_death

func _on_hit() -> void:
	current_health -= 1
	if current_health <= 0:
		on_death.emit()


