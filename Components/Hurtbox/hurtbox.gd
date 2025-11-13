extends Area2D

@export var target: Global.CollisionLayer = Global.CollisionLayer.SHOT


func _ready() -> void:
	set_collision_layer_value(target, true)


func _on_area_entered(_area: Area2D) -> void:
	get_parent().queue_free()

