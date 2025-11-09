class_name BigFairy extends Enemy


func _physics_process(_delta: float) -> void:
	$AnimationPlayer.play("standard")
	move_and_slide()
