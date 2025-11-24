extends Enemy

func _physics_process(_delta: float) -> void:
	super(_delta)
	if velocity.length() > 40.0:
		$AnimationPlayer.play("moving")
	elif $AnimationPlayer.current_animation == "moving":
		$AnimationPlayer.play("moveTransition")


func _ready() -> void:
	$SpellSequence.init(self)
