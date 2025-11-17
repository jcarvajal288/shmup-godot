extends Area2D

@export var target: Global.CollisionLayer = Global.CollisionLayer.ENEMY

func _ready() -> void:
	set_collision_mask_value(target, true)
	

func _on_area_entered(_area: Area2D) -> void:
	get_parent().queue_free()


func enable(is_enabled: bool) -> void:
	monitoring = is_enabled
	monitorable = is_enabled