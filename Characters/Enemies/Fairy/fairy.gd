extends CharacterBody2D

var color = "blue"

func _ready() -> void:
	$AnimationPlayer.play(color + "Standard")