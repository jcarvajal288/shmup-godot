extends MovementPattern

@export var locations: Array[Vector2]
@export var travel_time: float

var next_location = 0
var deceleration = 0


func enter() -> void:
	move_to_next_location()


func move_to_next_location() -> void:
	var destination = locations[next_location]
	var displacement = destination - subject.global_position
	var speed = displacement.length() * 2.0 / travel_time
	deceleration = -speed / travel_time
	subject.velocity = displacement.normalized() * speed


func process_physics(delta: float) -> void:
	if not subject:
		return
	if subject.velocity.length() <= 5.0:
		next_location = (next_location + 1) % locations.size()
		move_to_next_location()
	else:
		var direction = subject.velocity.normalized()
		subject.velocity += direction * deceleration * delta
