extends Node2D

@onready var Pipe_Area : = %Pipe_Area

func _process(delta) -> void:
	if LevelData.I_Running:
		%Litteral_Butt_plug.disabled = true
	else:
		%Litteral_Butt_plug.disabled = false
