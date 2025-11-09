class_name Level extends Node

const SPAWN_TOP_LEFT = Vector2(25, -25)
const SPAWN_TOP_MIDDLE = Vector2(180, -25)
const SPAWN_TOP_RIGHT = Vector2(335, -25)


const FAIRY: PackedScene = preload("res://Characters/Enemies/Fairy/Fairy.tscn")


const FIRE_STRAIGHT_PATTERN: PackedScene = preload("res://Bullets/Patterns/FireStraight.tscn")

func wait_for_sec(secs: float) -> void:
	await get_tree().create_timer(secs).timeout


func build_fairy(location: Vector2, color: String, bullet_pattern: FireStraight, direction: Vector2, speed: int) -> Fairy:
	var fairy = FAIRY.instantiate()
	fairy.global_position = location
	fairy.color = color
	fairy.add_child(bullet_pattern)
	fairy.velocity = direction * speed
	return fairy


func spawn_fairy(fairy: Fairy) -> void:
	get_parent().add_child.call_deferred(fairy)


func spawn_line(fairies: Array, delay: float) -> void:
	for fairy in fairies:
		spawn_fairy(fairy)
		await wait_for_sec(delay)
