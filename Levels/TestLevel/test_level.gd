extends Level


func _ready() -> void:
	# first_wave()
	# await wait_for_sec(1.0)
	big_fairy()
	# spawn_left()
	# await wait_for_sec(1.0)
	# spawn_middle()
	# await wait_for_sec(1.0)
	# spawn_right()


func spawn_left() -> void:
	var move_pattern = MOVE_STRAIGHT_PATTERN.instantiate()
	move_pattern.build(Vector2.DOWN, SLOW_SPEED)

	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.ARROW, Global.BulletColor.BRIGHT_RED)
	bullet_pattern.set_fire_timings(0.5, 0.25, 10)
	bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, MEDIUM_SPEED)
	spawn_enemy(build_fairy(SPAWN_TOP_LEFT, "blue", bullet_pattern, move_pattern))


func spawn_middle() -> void:
	var move_pattern = MOVE_STRAIGHT_PATTERN.instantiate()
	move_pattern.build(Vector2.DOWN, SLOW_SPEED)

	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.CIRCLE, Global.BulletColor.LIGHT_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 8)
	bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, MEDIUM_SPEED)
	spawn_enemy(build_fairy(SPAWN_TOP_RIGHT, "red", bullet_pattern, move_pattern))


func spawn_right() -> void:
	var move_pattern = MOVE_STRAIGHT_PATTERN.instantiate()
	move_pattern.build(Vector2.DOWN, SLOW_SPEED)

	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.DARK_PELLET, Global.BulletColor.DARK_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 5)
	bullet_pattern.set_velocity(Vector2.DOWN, 350)

	spawn_enemy(build_fairy(SPAWN_TOP_MIDDLE, "green", bullet_pattern, move_pattern))


func first_wave() -> void:
	var move_pattern = MOVE_STRAIGHT_PATTERN.instantiate()
	move_pattern.build(Vector2.from_angle(PI / 4), SLOW_SPEED)

	var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.ARROW, Global.BulletColor.BRIGHT_RED)
	bullet_pattern.set_fire_timings(0.5, 0.25, 10)
	bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, FASTEST_SPEED)

	var fairies = range(5).map(func(_i):
		var move_pattern_copy = move_pattern.copy_pattern(MOVE_STRAIGHT_PATTERN)
		var bullet_pattern_copy = bullet_pattern.copy_pattern(FIRE_STRAIGHT_PATTERN)
		return build_fairy(SPAWN_TOP_LEFT, "blue", bullet_pattern_copy, move_pattern_copy)
	)
	spawn_series(fairies, 0.25)


func big_fairy() -> void:
	var move_pattern = MOVE_STRAIGHT_PATTERN.instantiate()
	move_pattern.build(Vector2.DOWN, SLOWEST_SPEED)

	var bullet_pattern = FIRE_ARC_PATTERN.instantiate()
	bullet_pattern.set_bullet(Global.BulletType.DARK_PELLET, Global.BulletColor.DARK_BLUE)
	bullet_pattern.set_fire_timings(1.0, 0.5, 10)
	bullet_pattern.set_velocity(Vector2.DOWN, 350)
	bullet_pattern.set_spread(PI / 4, 4)

	spawn_enemy(build_big_fairy(SPAWN_TOP_MIDDLE, bullet_pattern, move_pattern))
