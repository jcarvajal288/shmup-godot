extends Node2D


func _ready() -> void:
	$PlayArea.body_exited.connect(_on_play_area_body_exited)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Bullet:
		BulletPool.put_bullet(body)
	else:
		body.queue_free()


func _on_area_exited(area: Area2D) -> void:
	if area is Bullet:
		BulletPool.put_bullet(area)


func _on_play_area_body_exited(body: Node2D) -> void:
	print("in exit play area")
	if body is Enemy and body.bullet_pattern != null:
		print("disabling firing")
		body.bullet_pattern.queue_free()
