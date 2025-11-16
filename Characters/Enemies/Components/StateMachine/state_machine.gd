class_name StateMachine extends Node

@export var starting_state: State

var current_state: State

signal signal_state_change

func init(subject: Enemy, animation_player: AnimationPlayer) -> void:
	for child in get_children():
		child.subject = subject
		child.animation_player = animation_player
		child.signal_state_change = signal_state_change
	change_state(starting_state)
	signal_state_change.connect(change_state)


func change_state(new_state: State) -> void:
	if new_state == current_state:
		return
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()


func process_input(event: InputEvent) -> void:
	if not current_state:
		return
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)


func process_physics(delta: float) -> void:
	if not current_state:
		return
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)


func process_frame(delta: float) -> void:
	if not current_state:
		return
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)