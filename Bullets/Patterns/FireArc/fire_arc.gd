class_name FireArc extends BulletPattern

var arc: float
var num_bullets: int


func set_spread(a: float, num: int) -> void:
	arc = a
	num_bullets = num


func shoot() -> void:
	var start = direction.angle() - arc / 2.0
	if num_bullets < 2:
		num_bullets = 2
	var step = arc / float(num_bullets - 1)
	var angles = range(num_bullets).map(func(i):
		return start + i * step
	)
	var bullets = angles.map(func(angle):
		var bullet = BulletPool.get_bullet(bullet_type)
		bullet.build(bullet_color, global_position, Vector2.from_angle(angle), speed)
		return bullet
	)
	for bullet in bullets:
		bullet.enable(true)
	do_repetitions()
