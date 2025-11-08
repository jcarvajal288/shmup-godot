class_name FireStraight extends Node2D

var bullet_type: PackedScene
var bullet_color: Global.BulletColor
var delay_time = 1.0
var repeat_time = 0.5
var repetitions = 5
var direction = Vector2.DOWN
var speed = 200


func _ready() -> void:
	$DelayTimer.timeout.connect(shoot_bullet)
	$RepeatTimer.timeout.connect(shoot_bullet)
	$DelayTimer.start(delay_time)


func set_bullet(bt: PackedScene, bc: Global.BulletColor) -> void:
	bullet_type = bt
	bullet_color = bc


func set_fire_timings(d: float, r: float, reps: int) -> void:
	delay_time = d
	repeat_time = r
	repetitions = reps


func set_velocity(dir: Vector2, spd: int) -> void:
	direction = dir
	speed = spd


func shoot_bullet() -> void:
	var bullet = bullet_type.instantiate()	
	bullet.build(bullet_color, global_position, direction, speed)
	get_tree().root.add_child(bullet)	
	if repetitions > 0:
		repetitions -= 1
	if repetitions != 0:
		$RepeatTimer.start(repeat_time)
	if repetitions == 0:
		queue_free()
