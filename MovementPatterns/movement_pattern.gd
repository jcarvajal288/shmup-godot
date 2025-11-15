class_name MovementPattern extends Node

@export var subject: CharacterBody2D

func copy_pattern(scene: PackedScene) -> MovementPattern:
	var copy = scene.instantiate()
	copy.subject = subject
	return copy