extends State

@export var next_state: State
@export var bullet_type: Global.BulletType
@export var bullet_color: Global.BulletColor

func enter() -> void:
	super()
	fire()
	await Global.wait_for_sec(1.0)
	signal_state_change.emit(next_state)


func fire() -> void:
	var speeds = [100, 125, 150, 175, 200]
	var patterns = speeds.map(func(speed):
		var pattern = BulletPatterns.FIRE_ARC.instantiate()
		pattern.set_bullet(bullet_type, bullet_color)
		pattern.set_velocity(Vector2.DOWN, speed)
		pattern.set_spread(2 * PI, 64)
		pattern.global_position = subject.global_position
		return pattern
	)
	for pattern in patterns:
		get_tree().root.add_child(pattern)
		# await Global.wait_for_sec(0.01)
