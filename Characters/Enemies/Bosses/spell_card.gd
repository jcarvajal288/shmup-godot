class_name SpellCard extends Node

@export var next_card: SpellCard

var subject: Enemy
var animation_player: AnimationPlayer

var signal_spell_change


func set_enabled(is_enabled: bool) -> void:
	set_process(is_enabled)
	set_physics_process(is_enabled)
	set_process_input(is_enabled)


func enter() -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	$StateMachine.process_input(event)


func _physics_process(delta: float) -> void:
	$StateMachine.process_physics(delta)


func _process(delta: float) -> void:
	$StateMachine.process_frame(delta)