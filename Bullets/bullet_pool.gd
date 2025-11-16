extends Node

const POOL_SIZE = 500
var pool = {}

func _ready() -> void:
	for bullet_type in Global.BulletType:
		pool[bullet_type] = []


func fill_pool() -> void:
	for bullet_type in Global.BulletType:
		pool[bullet_type] = range(0, POOL_SIZE).map(func(_i): 
			return Global.BULLET_SCENES[bullet_type].instantiate()
		)


func get_bullet(bullet_type: Global.BulletType) -> Bullet:
	if pool[bullet_type].is_empty():
		return Global.BULLET_SCENES[bullet_type].instantiate()
	else:
		return pool[bullet_type].pop_back()


func put_bullet(bullet: Bullet) -> void:
	pool[bullet.type].push_back(bullet)