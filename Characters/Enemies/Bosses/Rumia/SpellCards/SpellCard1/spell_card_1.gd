extends SpellCard


func enter() -> void:
	super()
	$StateMachine.init(subject)
	subject.health.set_health(30)


func process_physics(delta: float) -> void:
	$StateMachine.process_physics(delta)