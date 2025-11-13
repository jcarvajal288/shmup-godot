extends Level


func _ready() -> void:
	var locations: Array[Vector2] = [SPAWN_TOP_LEFT, SPAWN_TOP_MIDDLE_LEFT, SPAWN_TOP_MIDDLE, SPAWN_TOP_MIDDLE_RIGHT, SPAWN_TOP_RIGHT]
	await wait_for_sec(1.0)
	wave_1(locations)
	await wait_for_sec(2.0)
	locations.reverse()
	wave_1(locations)
	await wait_for_sec(2.0)
	locations.reverse()
	wave_1(locations)


func wave_1(locations: Array[Vector2]) -> void:
	var move_pattern = move_straight(Vector2.DOWN, SLOW_SPEED)


	var fairies = locations.map(func(location):
		var move_pattern_copy = move_pattern.copy_pattern(MOVE_STRAIGHT_PATTERN)

		var bullet_pattern = FIRE_STRAIGHT_PATTERN.instantiate()
		bullet_pattern.set_bullet(Global.BulletType.ARROW, Global.BulletColor.BRIGHT_RED)
		bullet_pattern.set_fire_timings(rand(0.5, 2.0), rand(5.0, 10.0), INFINITE)
		bullet_pattern.set_velocity(Global.TOWARDS_PLAYER, FASTEST_SPEED)

		return build_fairy(location, "blue", bullet_pattern, move_pattern_copy)
	)
	spawn_series(fairies, 0.25)
