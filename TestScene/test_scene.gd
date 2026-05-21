extends Node2D

@onready var Pipe_parent : = %Pipes
func _ready() -> void:
	%Overlap_text.visible = false
	Engine.time_scale = 0
	Snapfunc()

var overlap_text_timer : float = 0.00000000

func _process(delta: float) -> void:
	%FPS.text = str(Engine.get_frames_per_second()) + "FPS"
	if %Overlap_text.visible:
		overlap_text_timer += delta
		if overlap_text_timer >= 1:
			
			overlap_text_timer = 0
			%Overlap_text.visible = false
		
func _on_start_pressed() -> void:
	for i in range(%Pipes.get_child_count()):
		var Pipe = %Pipes.get_child(i)
		if Pipe.Is_Overlapping:
			%Overlap_text.visible = true
			
			return
			
	Engine.time_scale = 1

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50
	

	
