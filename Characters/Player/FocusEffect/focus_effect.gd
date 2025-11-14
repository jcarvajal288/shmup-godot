extends Node2D

var rotation_rate = 1

func _ready() -> void:
	$RearSprite.z_index = Global.RenderOrder.PLAYER - 1
	$FrontSprite.z_index = Global.RenderOrder.PLAYER + 1


func _physics_process(delta: float) -> void:
	$FrontSprite.rotation += delta * rotation_rate
