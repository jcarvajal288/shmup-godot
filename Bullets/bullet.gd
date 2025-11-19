class_name Bullet extends Area2D

var bullet_size = 16.0
var bullet_color = Global.BulletColor.GRAY

var speed = 0
var direction = Vector2.UP


func build(color: Global.BulletColor, pos: Vector2, dir: Vector2, spd: int) -> void:
	bullet_color = color
	global_position = pos
	if dir == Global.TOWARDS_PLAYER:
		var angle_to_target = global_position.angle_to_point(Global.PLAYER_LOCATION)
		rotate(Vector2.DOWN.angle() + angle_to_target)
		direction = Vector2.from_angle(angle_to_target)
	else:
		direction = dir
		rotate(Vector2.DOWN.angle_to(direction))
	speed = spd
	$Sprite2D.region_rect = Rect2(
		Vector2(bullet_size * bullet_color, $Sprite2D.region_rect.position.y),
		Vector2(bullet_size, bullet_size)
	)


func _ready() -> void:
	set_collision_layer_value(Global.CollisionLayer.PLAYER, false)
	set_collision_mask_value(Global.CollisionLayer.PLAYER, false)
	set_collision_layer_value(Global.CollisionLayer.BULLET, true)
	z_index = Global.RenderOrder.BULLET
	enable(false)
	


func _physics_process(delta: float) -> void:
	var displacement = speed * direction * delta
	global_position += displacement


func enable(is_enabled: bool) -> void:
	visible = is_enabled
	set_process(is_enabled)
	set_physics_process(is_enabled)
	set_process_input(is_enabled)

