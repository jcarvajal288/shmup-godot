extends CharacterBody2D

var color = "blue"

func _ready() -> void:
	$AnimationPlayer.play(color + "Standard")


func _physics_process(_delta: float) -> void:
	move_and_slide()