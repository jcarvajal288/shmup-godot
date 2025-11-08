extends Level


func _ready() -> void:
	await wait_for_sec(1.0)
	spawn_left()
	await wait_for_sec(1.0)
	spawn_middle()
	await wait_for_sec(1.0)
	spawn_right()


func spawn_left() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(ARROW, Global.BulletColor.BRIGHT_RED)
	bullet_pattern.set_fire_timings(0.5, 0.25, 10)
	bullet_pattern.set_velocity(Vector2.RIGHT, 400)
	spawn_fairy(SPAWN_TOP_LEFT, "blue", bullet_pattern, Vector2.DOWN, 200)


func spawn_middle() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(CIRCLE, Global.BulletColor.LIGHT_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 8)
	bullet_pattern.set_velocity(Vector2.LEFT, 400)
	spawn_fairy(SPAWN_TOP_RIGHT, "red", bullet_pattern, Vector2.DOWN, 200)


func spawn_right() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(DARK_PELLET, Global.BulletColor.DARK_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 5)
	bullet_pattern.set_velocity(Vector2.DOWN, 350)
	spawn_fairy(SPAWN_TOP_MIDDLE, "green", bullet_pattern, Vector2.DOWN, 200)