extends ProgressBar


func _ready() -> void:
	Global.health_bar_visible.connect(_on_health_bar_visible)
	Global.health_bar_percentage_changed.connect(_on_health_bar_percentage_changed)


func _on_health_bar_visible(vis: bool) -> void:
	visible = vis


func _on_health_bar_percentage_changed(percentage: float) -> void:
	value = percentage