extends SpellCard


func enter() -> void:
	super()
	$StateMachine.init(subject, animation_player)
	subject.set_health(30)
