extends Node

@export var subject: Enemy
@export var animation_player: AnimationPlayer
@export var first_card: SpellCard

signal signal_spell_change

func _ready() -> void:
	for child in get_children():
		child.set_enabled(false)
		child.subject = subject
		child.animation_player = animation_player
		child.signal_spell_change = signal_spell_change
	first_card.set_enabled(true)
	first_card.enter()
