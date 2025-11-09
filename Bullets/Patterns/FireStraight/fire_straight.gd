class_name FireStraight extends BulletPattern


func shoot() -> void:
	var bullet = Global.BULLET_SCENES[bullet_type].instantiate()
	bullet.build(bullet_color, global_position, direction, speed)
	get_tree().root.add_child(bullet)	
	do_repetitions()