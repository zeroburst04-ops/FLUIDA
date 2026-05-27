extends Node2D

func _process(delta: float) -> void:
	for i in range(%Pipes.get_child_count()):
		print(%Pipes.get_child(i).Is_Overlapping)
