extends CharacterBody2D

var speed = 1000
var direction = Vector2.UP


func _ready() -> void:
	z_index = Global.RenderOrder.SHOT
	velocity = speed * direction


func _physics_process(_delta: float) -> void:
	move_and_slide()

