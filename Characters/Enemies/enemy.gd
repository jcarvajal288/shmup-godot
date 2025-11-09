class_name Enemy extends CharacterBody2D


func _init() -> void:
	set_collision_layer_value(Global.CollisionLayer.PLAYER, false)
	set_collision_mask_value(Global.CollisionLayer.PLAYER, false)
	set_collision_layer_value(Global.CollisionLayer.ENEMY, true)
