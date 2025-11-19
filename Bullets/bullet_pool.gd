extends Node

const POOL_SIZE = 500
var pool = {}


func _ready() -> void:
	for bullet_type in Global.BulletType.values():
		pool[bullet_type] = []


# func fill_pool() -> void:
# 	print('filling')
# 	var batch_size = 20
# 	var count = 0
# 	var bullet_types = [Global.BulletType.CIRCLE]
# 	for bullet_type in bullet_types:
# 		pool[bullet_type] = []
# 		print(bullet_type)
# 		for _i in range(POOL_SIZE):
# 			var bullet = create_bullet(bullet_type)
# 			pool[bullet_type].push_back(bullet)
# 			count += 1
# 			if count >= batch_size:
# 				count = 0
# 				await get_tree().process_frame
# 		await Global.wait_for_sec(1.0)
# 	print('fill ended')


func create_bullet(bullet_type: Global.BulletType) -> Bullet:
	var bullet = Global.BULLET_SCENES[bullet_type].instantiate()
	bullet.global_position = Vector2(-100, -100)
	bullet.enable(false)
	get_tree().root.add_child(bullet)
	return bullet


func get_bullet(bullet_type: Global.BulletType) -> Bullet:
	var bullet
	if pool[bullet_type].is_empty():
		print('pool empty')
		bullet = create_bullet(bullet_type)
	else:
		bullet = pool[bullet_type].pop_back()
	bullet.enable(true)
	return bullet


func put_bullet(bullet: Bullet) -> void:
	bullet.enable(false)
	pool[bullet.type].push_back(bullet)
