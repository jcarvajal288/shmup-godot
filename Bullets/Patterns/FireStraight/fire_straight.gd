class_name FireStraight extends BulletPattern


func shoot() -> void:
	var bullet = BulletPool.get_bullet(bullet_type)
	bullet.build(bullet_color, global_position, direction, speed)
	do_repetitions()