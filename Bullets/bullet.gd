class_name Bullet extends CharacterBody2D

var speed = 0
var direction = Vector2.UP


func _ready() -> void:
	set_collision_layer_value(Global.COLLISION_LAYER.PLAYER, false)
	set_collision_mask_value(Global.COLLISION_LAYER.PLAYER, false)
	set_collision_layer_value(Global.COLLISION_LAYER.BULLET, true)
	velocity = direction * speed


func _physics_process(_delta: float) -> void:
	move_and_slide()


