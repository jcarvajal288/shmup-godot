class_name SpellCard extends Node

@export var next_card: SpellCard

var subject: Enemy

var signal_spell_change


func set_enabled(is_enabled: bool) -> void:
	set_process(is_enabled)
	set_physics_process(is_enabled)
	set_process_input(is_enabled)


func enter() -> void:
	if not subject.health.on_death.is_connected(_on_death):
		subject.health.on_death.connect(_on_death)
	set_enabled(true)


func exit() -> void:
	set_enabled(false)


func _on_death() -> void:
	if next_card:
		signal_spell_change.emit(next_card)
	else:
		print("boss defeated")


# func _unhandled_input(event: InputEvent) -> void:
# 	$StateMachine.process_input(event)


# func _physics_process(delta: float) -> void:
# 	$StateMachine.process_physics(delta)


# func _process(delta: float) -> void:
# 	$StateMachine.process_frame(delta)
