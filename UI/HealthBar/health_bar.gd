extends ProgressBar


func _ready() -> void:
	Global.health_bar_visible.connect(_on_health_bar_visible)


func _on_health_bar_visible(vis: bool) -> void:
	visible = vis