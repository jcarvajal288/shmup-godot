class_name Fairy extends Enemy

var color = "blue"


func _init() -> void:
	hp = 3


func _ready() -> void:
	super()
	$AnimationPlayer.play(color + "Standard")
	$Health.current_health = hp

