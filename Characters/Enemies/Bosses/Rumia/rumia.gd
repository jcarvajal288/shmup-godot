extends Enemy

func _ready() -> void:
	$SpellSequence.init(self)
	Global.health_bar_visible.emit(true)
	$Health.on_health_changed.connect(_on_health_changed)
	Global.health_bar_percentage_changed.emit(100.0)


func _physics_process(_delta: float) -> void:
	super(_delta)
	if velocity.length() > 40.0:
		$AnimationPlayer.play("moving")
	elif $AnimationPlayer.current_animation == "moving":
		$AnimationPlayer.play("moveTransition")


func _on_health_changed(current_health: int, max_health: int) -> void:
	var percentage = float(current_health) / float(max_health) * 100.0
	Global.health_bar_percentage_changed.emit(percentage)