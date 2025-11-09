class_name BigFairy extends Enemy


func _ready() -> void:
	$AnimationPlayer.play("standard")


func _physics_process(_delta: float) -> void:
	move_and_slide()
