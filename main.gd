extends Node2D

@export var level: PackedScene

func _ready() -> void:
	var instanced_level = level.instantiate()
	add_child(instanced_level)
