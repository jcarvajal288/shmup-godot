class_name Level extends Node

const INFINITE = 999999999999

const SPAWN_TOP_LEFT = Vector2(25, -25)
const SPAWN_TOP_MIDDLE_LEFT = Vector2(90, -25)
const SPAWN_TOP_MIDDLE = Vector2(180, -25)
const SPAWN_TOP_MIDDLE_RIGHT = Vector2(270, -25)
const SPAWN_TOP_RIGHT = Vector2(335, -25)

const SLOWEST_SPEED = 50.0 
const SLOWER_SPEED = 75.0 
const SLOW_SPEED = 100.0 
const MEDIUM_SPEED = 125.0 
const FAST_SPEED = 150.0 
const FASTER_SPEED = 175.0 
const FASTEST_SPEED = 200.0 


const FAIRY: PackedScene = preload("res://Characters/Enemies/Fairy/Fairy.tscn")
const BIG_FAIRY: PackedScene = preload("res://Characters/Enemies/BigFairy/BigFairy.tscn")


const FIRE_STRAIGHT_PATTERN: PackedScene = preload("res://Bullets/Patterns/FireStraight/FireStraight.tscn")
const FIRE_ARC_PATTERN: PackedScene = preload("res://Bullets/Patterns/FireArc/FireArc.tscn")

const MOVE_STRAIGHT_PATTERN: PackedScene = preload("res://MovementPatterns/MoveStraight/MoveStraight.tscn")


func wait_for_sec(secs: float) -> void:
	await get_tree().create_timer(secs).timeout


func build_fairy(location: Vector2, color: String, bullet_pattern: BulletPattern, move_pattern: MovementPattern) -> Fairy:
	var fairy = FAIRY.instantiate()
	fairy.global_position = location
	fairy.color = color
	move_pattern.subject = fairy
	fairy.add_child(bullet_pattern)
	fairy.add_child(move_pattern)
	return fairy


func build_big_fairy(location: Vector2, bullet_pattern: BulletPattern, move_pattern: MovementPattern) -> BigFairy:
	var fairy = BIG_FAIRY.instantiate()
	fairy.global_position = location
	move_pattern.subject = fairy
	fairy.add_child(bullet_pattern)
	fairy.add_child(move_pattern)
	return fairy


func spawn_enemy(enemy: Enemy) -> void:
	get_parent().add_child.call_deferred(enemy)


func spawn_series(fairies: Array, delay: float) -> void:
	for fairy in fairies:
		spawn_enemy(fairy)
		await wait_for_sec(delay)


func move_straight(dir: Vector2, spd: float) -> MovementPattern:
	var move_pattern = MOVE_STRAIGHT_PATTERN.instantiate()
	move_pattern.build(dir, spd)
	return move_pattern
