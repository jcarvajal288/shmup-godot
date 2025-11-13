class_name Fairy extends Enemy

var color = "blue"


func _init() -> void:
	hp = 3


func _ready() -> void:
	$AnimationPlayer.play(color + "Standard")
	$Health.current_health = hp


func _physics_process(_delta: float) -> void:
	move_and_slide()