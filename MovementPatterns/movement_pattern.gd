class_name MovementPattern extends Node2D

@export var subject: CharacterBody2D

func copy_pattern(scene: PackedScene) -> MovementPattern:
	var copy = scene.instantiate()
	copy.subject = subject
	return copy