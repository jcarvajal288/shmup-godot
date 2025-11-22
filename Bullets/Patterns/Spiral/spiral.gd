extends BulletPattern

var num_arms: int
var rotation_speed: float
var fire_interval: float

var fire_arc: BulletPattern


func _ready() -> void:
	fire_arc = BulletPatterns.FIRE_ARC.instantiate()
	fire_arc.set_bullet(bullet_type, bullet_color)
	fire_arc.set_velocity(direction, speed)
	fire_arc.set_fire_timings(direction.angle(), fire_interval, Global.INFINITE)
	fire_arc.set_spread(2 * PI, num_arms + 1)
	fire_arc.global_position = global_position
	get_tree().root.add_child(fire_arc)


func _physics_process(delta: float) -> void:
	fire_arc.direction = Vector2.from_angle(fire_arc.direction.angle() + delta * rotation_speed)
