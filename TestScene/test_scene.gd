extends Node2D

func _ready() -> void:
	Engine.time_scale = 0
	Snapfunc()
	
func _process(delta: float) -> void:
	%FPS.text = str(Engine.get_frames_per_second()) + "FPS"
	
func _on_start_pressed() -> void:
	Engine.time_scale = 1

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50
	
	
