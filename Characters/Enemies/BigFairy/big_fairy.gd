class_name BigFairy extends Enemy

func _init() -> void:
	hp = 10


func _ready() -> void:
	super()
	$AnimationPlayer.play("standard")

