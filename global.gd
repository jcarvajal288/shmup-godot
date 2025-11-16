extends Node

@onready var rng = RandomNumberGenerator.new()

const TOWARDS_PLAYER = Vector2.ZERO

var PLAYER_LOCATION = Vector2.ZERO

enum CollisionLayer {
	PLAYER = 1,
	ENEMY = 2,
	BULLET = 3,
	SHOT = 4,
}

enum RenderOrder {
	PLAYER = 10,
	SHOT = 1,
	ENEMY = 5,
	BULLET = 9,
}

enum BulletColor {
	GRAY = 0,
	DARK_RED = 1,
	BRIGHT_RED = 2,
	VIOLET = 3,
	PINK = 4,
	DARK_BLUE = 5,
	LIGHT_BLUE = 6,
	SKY_BLUE = 7,
	GREEN = 8,
	LIGHT_GREEN = 9,
	YELLOW_GREEN = 10,
	YELLOW = 11,
	BRIGHT_YELLOW = 12,
	ORANGE = 13,
	WHITE = 14
}

enum BulletType {
	ARROW = 0,
	BEAM = 1,
	BULLET = 2,
	CARD = 3,
	CIRCLE = 4,
	DARK_PELLET = 5,
	KUNAI = 6,
	KUNAI_2 = 7,
	PELLET = 8,
	RIMMED_CIRCLE = 9,
	SPARKLY_CIRCLE = 10,
	STAR = 11,
}

const BULLET_SCENES = [
	preload("res://Bullets/Types/Arrow.tscn"),
	preload("res://Bullets/Types/Beam.tscn"),
	preload("res://Bullets/Types/Bullet.tscn"),
	preload("res://Bullets/Types/Card.tscn"),
	preload("res://Bullets/Types/Circle.tscn"),
	preload("res://Bullets/Types/DarkPellet.tscn"),
	preload("res://Bullets/Types/Kunai.tscn"),
	preload("res://Bullets/Types/Kunai2.tscn"),
	preload("res://Bullets/Types/Pellet.tscn"),
	preload("res://Bullets/Types/RimmedCircle.tscn"),
	preload("res://Bullets/Types/SparklyCircle.tscn"),
	preload("res://Bullets/Types/Star.tscn")
]

func wait_for_sec(secs: float) -> void:
	await get_tree().create_timer(secs).timeout


