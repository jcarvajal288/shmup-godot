extends SpellCard


func enter() -> void:
	super()
	$StateMachine.init(subject)
	subject.health.set_health(30)
