class_name FireStraight extends BulletPattern


func shoot() -> void:
	var bullet = BulletPool.get_bullet(bullet_type)
	bullet.build(bullet_color, global_position, direction, speed)
	get_tree().root.add_child(bullet)	
	do_repetitions()