extends Node2D


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Bullet:
		BulletPool.put_bullet(body)
	else:
		body.queue_free()


func _on_area_exited(area: Area2D) -> void:
	if area is Bullet:
		BulletPool.put_bullet(area)
