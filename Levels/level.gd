class_name Level extends Node

const SPAWN_TOP_LEFT = Vector2(25, -25)
const SPAWN_TOP_MIDDLE = Vector2(180, -25)
const SPAWN_TOP_RIGHT = Vector2(335, -25)


const FAIRY: PackedScene = preload("res://Characters/Enemies/Fairy/Fairy.tscn")


const FIRE_STRAIGHT_PATTERN: PackedScene = preload("res://Bullets/Patterns/FireStraight.tscn")

const ARROW: PackedScene = preload("res://Bullets/Types/Arrow.tscn")
const BEAM: PackedScene = preload("res://Bullets/Types/Beam.tscn")
const BULLET: PackedScene = preload("res://Bullets/Types/Bullet.tscn")
const CARD: PackedScene = preload("res://Bullets/Types/Card.tscn")
const CIRCLE: PackedScene = preload("res://Bullets/Types/Circle.tscn")
const DARK_PELLET: PackedScene = preload("res://Bullets/Types/DarkPellet.tscn")
const KUNAI: PackedScene = preload("res://Bullets/Types/Kunai.tscn")
const KUNAI2: PackedScene = preload("res://Bullets/Types/Kunai2.tscn")
const PELLET: PackedScene = preload("res://Bullets/Types/Pellet.tscn")
const RIMMED_CIRCLE: PackedScene = preload("res://Bullets/Types/RimmedCircle.tscn")
const SPARKLY_CIRCLE: PackedScene = preload("res://Bullets/Types/SparklyCircle.tscn")
const STAR: PackedScene = preload("res://Bullets/Types/Star.tscn")


func wait_for_sec(secs: float) -> void:
	await get_tree().create_timer(secs).timeout


func spawn_fairy(location: Vector2, color: String, bullet_pattern: FireStraight, direction: Vector2, speed: int) -> void:
	var fairy = FAIRY.instantiate()
	fairy.global_position = location
	fairy.color = color
	fairy.add_child(bullet_pattern)
	fairy.velocity = direction * speed
	get_parent().add_child.call_deferred(fairy)
