class_name MoveStraight extends MovementPattern

var direction = Vector2.ZERO
var speed = 0


func build(dir: Vector2, spd: float) -> void:
	direction = dir
	speed = spd


func _ready() -> void:
	subject.velocity = direction * speed


func copy_pattern(pattern: PackedScene) -> MovementPattern:
	var copy = super(pattern)
	copy.direction = direction
	copy.speed = speed
	return copy
