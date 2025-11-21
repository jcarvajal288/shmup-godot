class_name Health extends Node

@export var max_health = 5
@onready var current_health = max_health

signal on_death


func set_health(hp: int) -> void:
	max_health = hp
	current_health = max_health


func _on_hit() -> void:
	current_health -= 1
	print(current_health)
	if current_health <= 0:
		on_death.emit()


