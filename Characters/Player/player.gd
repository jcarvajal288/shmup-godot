class_name Player extends CharacterBody2D

var speed = 150
var focus_speed = 75
var shot_cooldown = 0.1
var can_shoot = true

const SHOT: PackedScene = preload("res://Characters/Player/Shot/Shot.tscn")

func _ready() -> void:
	z_index = Global.RenderOrder.PLAYER
	$ShotTimer.timeout.connect(manage_shot_cooldown)
	$ShotTimer.start(shot_cooldown)

func _physics_process(_delta: float) -> void:
	move()
	shoot()
	animate()


func manage_shot_cooldown() -> void:
	can_shoot = true


func move() -> void:
	var movement_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var is_focused = Input.is_action_pressed("focus")
	var snapped_vector = Vector2(
		snapped(movement_vector.x, 0.5), 
		snapped(movement_vector.y, 0.5)
	).normalized()
	if is_focused:
		velocity = snapped_vector * focus_speed
	else:
		velocity = snapped_vector * speed
	move_and_slide()
	Global.PLAYER_LOCATION = global_position


func shoot() -> void:
	if can_shoot and Input.is_action_pressed("shoot"):
		var shot = SHOT.instantiate()
		shot.global_position = global_position
		get_tree().root.add_child(shot)
		can_shoot = false


func animate() -> void:
	if velocity.x != 0:
		$AnimationPlayer.play("side")
	else:
		$AnimationPlayer.play("standard")
	$Sprite2D.flip_h = velocity.x > 0