class_name BulletPattern extends Node2D

var bullet_type: Global.BulletType
var bullet_color: Global.BulletColor
var delay_time = 0.01
var repeat_time = 0.01
var repetitions = 1
var direction = Vector2.DOWN
var speed = 200


func _ready() -> void:
	$DelayTimer.timeout.connect(shoot)
	$RepeatTimer.timeout.connect(shoot)
	$DelayTimer.start(delay_time)


func set_bullet(bt: Global.BulletType, bc: Global.BulletColor) -> void:
	bullet_type = bt
	bullet_color = bc


func set_fire_timings(d: float, r: float, reps: int) -> void:
	delay_time = d
	repeat_time = r
	repetitions = reps


func set_velocity(dir: Vector2, spd: int) -> void:
	direction = dir
	speed = spd


func copy_pattern(scene: PackedScene) -> FireStraight:
	var copy = scene.instantiate()
	copy.set_bullet(bullet_type, bullet_color)
	copy.set_fire_timings(delay_time, repeat_time, repetitions)
	copy.set_velocity(direction, speed)
	return copy


func shoot() -> void:
	pass


func do_repetitions() -> void:
	if repetitions > 0:
		repetitions -= 1
	if repetitions != 0:
		$RepeatTimer.start(repeat_time)
	if repetitions == 0:
		queue_free()
