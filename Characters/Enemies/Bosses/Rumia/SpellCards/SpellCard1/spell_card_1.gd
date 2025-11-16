extends SpellCard


func _ready() -> void:
	$StateMachine.init(subject)
