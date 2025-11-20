extends Node

@export var max_health = 5
@onready var current_health = max_health

signal on_death

func _on_hit() -> void:
	current_health -= 1
	print(current_health)
	if current_health <= 0:
		on_death.emit()


