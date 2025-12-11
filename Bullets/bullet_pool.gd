extends Node

const POOL_SIZE = 500
var pool = {}


func _ready() -> void:
	for bullet_type in Global.BulletType.values():
		pool[bullet_type] = []


func create_bullet(bullet_type: Global.BulletType) -> Bullet:
	var bullet = Global.BULLET_SCENES[bullet_type].instantiate()
	bullet.global_position = Vector2(-100, -100)
	bullet.enable(false)
	get_tree().root.add_child(bullet)
	return bullet


func get_bullet(bullet_type: Global.BulletType) -> Bullet:
	var bullet
	if pool[bullet_type].is_empty():
		bullet = create_bullet(bullet_type)
	else:
		bullet = pool[bullet_type].pop_back()
	bullet.enable(true)
	return bullet
# 

func put_bullet(bullet: Bullet) -> void:
	bullet.enable(false)
	bullet.transform = Transform2D.IDENTITY
	pool[bullet.type].push_back(bullet)
