extends SpellCard


func enter() -> void:
	super()
	subject.health.set_health(30)
	$MoveBetween.subject = subject
	$MoveBetween.enter()
	$FireSpiral.enter()


func process_physics(delta) -> void:
	$MoveBetween.process_physics(delta)
	$FireSpiral.process_physics(delta)
