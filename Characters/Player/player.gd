class_name Player extends CharacterBody2D

var speed = 150

func _physics_process(_delta: float) -> void:
	movement()


func movement() -> void:
	var movement_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var snapped_vector = Vector2(
		snapped(movement_vector.x, 0.5), 
		snapped(movement_vector.y, 0.5)
	)
	velocity = snapped_vector * speed
	move_and_slide()
