class_name Enemy extends CharacterBody2D

var hp = 5

func _init() -> void:
	set_collision_layer_value(Global.CollisionLayer.PLAYER, false)
	set_collision_mask_value(Global.CollisionLayer.PLAYER, false)
	set_collision_layer_value(Global.CollisionLayer.ENEMY, true)
	set_collision_mask_value(Global.CollisionLayer.SHOT, true)
	z_index = Global.RenderOrder.ENEMY


func _ready() -> void:
	$Health.set_health(hp)


func set_health(new_hp: int) -> void:
	$Health.set_health(new_hp)


func _on_death() -> void:
	queue_free()


func _physics_process(_delta: float) -> void:
	$Sprite2D.flip_h = velocity.x < 0
	move_and_slide()
