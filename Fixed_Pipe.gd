extends Control

func Snapfunc() -> void:
	global_position.x = floor(global_position.x / 50.0) * 50
	global_position.y = floor(global_position.y / 50.0) * 50
	
func _ready() -> void:
	Snapfunc()
	
func _on_rotate_button_down() -> void:
	if not LevelData.I_Running:
		$".".rotation_degrees += 90
