class_name State extends Node

var subject: Enemy
var signal_state_change


func enter() -> void:
	pass


func exit() -> void:
	pass


func process_input(_event: InputEvent) -> State:
	return null


func process_physics(_delta: float) -> State:
	return null


func process_frame(_delta: float) -> State:
	return null
