extends State

@export var next_state: State
@export var bullet_type: Global.BulletType
@export var bullet_color: Global.BulletColor
@export var num_arms: int
@export var rotation_speed: float
@export var fire_interval: float

func enter() -> void:
	super()
	fire()


func fire() -> void:
	var pattern = BulletPatterns.SPIRAL.instantiate()
	pattern.bullet_type = bullet_type
	pattern.bullet_color = bullet_color
	pattern.num_arms = num_arms
	pattern.rotation_speed = rotation_speed
	pattern.fire_interval = fire_interval
	pattern.global_position = subject.global_position
	get_tree().root.add_child(pattern)