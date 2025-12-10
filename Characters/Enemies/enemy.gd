class_name Enemy extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var health = $Health

var hp = 5
var bullet_pattern: BulletPattern


func _init() -> void:
	set_collision_layer_value(Global.CollisionLayer.PLAYER, false)
	set_collision_mask_value(Global.CollisionLayer.PLAYER, false)
	set_collision_layer_value(Global.CollisionLayer.ENEMY, true)
	set_collision_mask_value(Global.CollisionLayer.SHOT, true)
	z_index = Global.RenderOrder.ENEMY


func _ready() -> void:
	$Health.set_health(hp)
	bullet_pattern.enter()


func _on_death() -> void:
	queue_free()


func _physics_process(_delta: float) -> void:
	$Sprite2D.flip_h = velocity.x < 0
	move_and_slide()
