class_name SpellCard extends Node

@export var next_card: SpellCard

var subject: Enemy

var signal_spell_change


func enter() -> void:
	if not subject.health.on_death.is_connected(_on_death):
		subject.health.on_death.connect(_on_death)


func process_physics(_delta: float) -> void:
	pass


func exit() -> void:
	pass


func _on_death() -> void:
	if next_card:
		signal_spell_change.emit(next_card)
	else:
		subject.queue_free()
		Global.health_bar_visible.emit(false)