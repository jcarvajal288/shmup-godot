extends Node2D

@export var bullet_type: PackedScene
@export var delay_time = 1.0
@export var repeat_time = 0.5
@export var repetitions = 5
@export var direction = Vector2.DOWN
@export var speed = 200


func _ready() -> void:
	$DelayTimer.timeout.connect(shoot_bullet)
	$RepeatTimer.timeout.connect(shoot_bullet)
	$DelayTimer.start(delay_time)


func shoot_bullet() -> void:
	var bullet = bullet_type.instantiate()	
	bullet.speed = speed
	bullet.direction = direction
	bullet.global_position = global_position
	bullet.bullet_type = Global.BulletType.CARD
	bullet.bullet_color = Global.BulletColor.VIOLET
	get_tree().root.add_child(bullet)	
	if repetitions > 0:
		repetitions -= 1
	if repetitions != 0:
		$RepeatTimer.start(repeat_time)
	if repetitions == 0:
		queue_free()