extends Node2D

func _process(delta: float) -> void:
	%FPS.text = str(Engine.get_frames_per_second()) + "FPS"
	
