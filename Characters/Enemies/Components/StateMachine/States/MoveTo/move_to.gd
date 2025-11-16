extends State

@export var destination: Vector2
@export var time_to_dest: float
@export var next_state: State

var deceleration = 0.0


func enter() -> void:
	super()
	var displacement = destination - subject.global_position
	var speed = displacement.length() * 2.0 / time_to_dest
	deceleration = -speed / time_to_dest
	subject.velocity = displacement.normalized() * speed


func process_physics(delta: float) -> State:
	super(delta)
	if subject.velocity.length() <= 1.0:
		return next_state
	var direction = subject.velocity.normalized()
	subject.velocity += direction * deceleration * delta
	return null