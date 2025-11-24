extends SpellCard


func enter() -> void:
	super()
	subject.health.set_health(30)
	$MoveBetween.subject = subject
	$MoveBetween.enter()
