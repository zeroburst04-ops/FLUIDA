extends Node2D

@onready var Wintext := %Win_state
@onready var Overlap := %Overlap_text
@onready var Pipe_parent := %Pipes

var overlap_text_timer : float = 0.0
var last_ticks: float = 0.0

func _ready() -> void:
	# Allows this script to run while Engine.time_scale is 0
	process_mode = Node.PROCESS_MODE_ALWAYS 
	
	LevelData.I_Running = false
	%Overlap_text.visible = false
	Engine.time_scale = 0.0
	Snapfunc()
	last_ticks = Time.get_ticks_msec() 
	
func _process(delta: float) -> void:
	# Calculate real-world time passed since last frame (unscaled delta)
	var current_ticks = Time.get_ticks_msec()
	var unscaled_delta = (current_ticks - last_ticks) / 1000.0
	last_ticks = current_ticks

	if LevelData.I_Win:
		Wintext.text = "ウィン！！！"
		return
	if LevelData.I_Lose:
		Wintext.text = "ぉせ"
		return

	if has_node("%FPS"):
		%FPS.text = str(Engine.get_frames_per_second()) + "FPS"
	
	if %Overlap_text.visible:
		overlap_text_timer += unscaled_delta
		if overlap_text_timer >= 1.0:
			overlap_text_timer = 0.0
			%Overlap_text.visible = false
			
func _on_start_pressed() -> void:
	# Reset timer whenever start is pressed to prevent state carryover
	overlap_text_timer = 0.0 
	
	for i in range(%Pipes.get_child_count()):
		var Pipe = %Pipes.get_child(i)
		# Note: Ensure 'Is_Overlapping' is spelled exactly like this in your Pipe script
		if Pipe.Is_Overlapping:
			%Overlap_text.visible = true
			return
			
	LevelData.I_Running = true
	Engine.time_scale = 1.0

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50

func _on_end_pressed() -> void:
	get_tree().reload_current_scene()
