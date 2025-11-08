class_name Bullet extends CharacterBody2D

@export var bullet_size = 16.0
@export var bullet_color = Global.BulletColor.GRAY
@export var bullet_type = Global.BulletType.BEAM

var speed = 0
var direction = Vector2.UP


func _ready() -> void:
	set_collision_layer_value(Global.CollisionLayer.PLAYER, false)
	set_collision_mask_value(Global.CollisionLayer.PLAYER, false)
	set_collision_layer_value(Global.CollisionLayer.BULLET, true)
	velocity = direction * speed


func _physics_process(_delta: float) -> void:
	move_and_slide()
