extends Level


func _ready() -> void:
	first_wave()
	# await wait_for_sec(1.0)
	# spawn_left()
	# await wait_for_sec(1.0)
	# spawn_middle()
	# await wait_for_sec(1.0)
	# spawn_right()


func spawn_left() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.ARROW, Global.BulletColor.BRIGHT_RED)
	bullet_pattern.set_fire_timings(0.5, 0.25, 10)
	bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, 400)
	spawn_fairy(build_fairy(SPAWN_TOP_LEFT, "blue", bullet_pattern, Vector2.DOWN, 200))


func spawn_middle() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.CIRCLE, Global.BulletColor.LIGHT_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 8)
	bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, 400)
	spawn_fairy(build_fairy(SPAWN_TOP_RIGHT, "red", bullet_pattern, Vector2.DOWN, 200))


func spawn_right() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.DARK_PELLET, Global.BulletColor.DARK_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 5)
	bullet_pattern.set_velocity(Vector2.DOWN, 350)
	spawn_fairy(build_fairy(SPAWN_TOP_MIDDLE, "green", bullet_pattern, Vector2.DOWN, 200))


func first_wave() -> void:
	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.ARROW, Global.BulletColor.BRIGHT_RED)
	bullet_pattern.set_fire_timings(0.5, 0.25, 10)
	bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, 400)
	var fairies = range(5).map(func(_i):
		var bullet_pattern_copy = bullet_pattern.copy_pattern(FIRE_STRAIGHT_PATTERN)
		return build_fairy(SPAWN_TOP_LEFT, "blue", bullet_pattern_copy, Vector2.DOWN, 200)
	)
	spawn_line(fairies, 0.25)
