extends MovementPattern

@export var direction: Vector2
@export var starting_speed: float
@export var final_speed: float
@export var time_to_decelerate: float

var deceleration: float


func _ready() -> void:
	subject.velocity = direction * starting_speed
	if time_to_decelerate == 0.0:
		deceleration = 0.0
	deceleration = final_speed - starting_speed / time_to_decelerate


func _physics_process(delta: float) -> void:
	if subject.velocity.length() <= 1.0:
		subject.velocity = Vector2.ZERO
		return
	if subject.velocity.length() > final_speed:
		subject.velocity += direction * deceleration * delta
	

