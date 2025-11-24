class_name SpellSequence extends Node2D

@export var first_card: SpellCard

var current_spell: SpellCard

signal signal_spell_change

func init(subject: Enemy) -> void:
	for child in get_children():
		child.set_enabled(false)
		child.subject = subject
		child.signal_spell_change = signal_spell_change
	signal_spell_change.connect(change_spell)
	change_spell(first_card)


func change_spell(new_spell: SpellCard) -> void:
	print("changing spell")
	if current_spell:
		current_spell.exit()
	current_spell = new_spell
	current_spell.enter()
