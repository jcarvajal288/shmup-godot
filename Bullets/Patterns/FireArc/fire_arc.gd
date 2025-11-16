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
		var bullet = Global.BULLET_SCENES[bullet_type].instantiate()
		bullet.build(bullet_color, global_position, Vector2.from_angle(angle), speed)
		return bullet
	)
	for bullet in bullets:
		get_tree().root.add_child(bullet)	
	# 	await Global.wait_for_sec(0.0001)
	# await Global.wait_for_sec(0.01)
	do_repetitions()
