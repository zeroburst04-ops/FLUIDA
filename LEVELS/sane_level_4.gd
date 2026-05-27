extends Node2D

@onready var Wintext : = %Win_state
@onready var Overlap : = %Overlap_text
@onready var Pipe_parent : = %Pipes

var overlap_text_timer : float = 0.000000000000
var last_ticks: float = 0.0
var Origin : int = 14
func _ready() -> void:
	LevelData.I_Running = false
	%Overlap_text.visible = false
	Snapfunc()
	last_ticks = Time.get_ticks_msec() # Initialize the time tracker
	#Shit
	
func _process(delta: float) -> void:
	# Calculate real-world time passed since last frame (unscaled delta)
	var current_ticks = Time.get_ticks_msec()
	var unscaled_delta = (current_ticks - last_ticks) / 1000.0
	last_ticks = current_ticks
	%AudioStreamPlayer.volume_db = Settings.BackGround_Music2

	if LevelData.I_Win:
		Wintext.text = "ウィン！！！"
		return
	if LevelData.I_Lose:
		Wintext.text = "ぉせ"
		await get_tree().create_timer(1).timeout
		LevelData.I_Lose = false
		get_tree().reload_current_scene()

	%FPS.text = str(Engine.get_frames_per_second()) + "FPS"
	
	if %Overlap_text.visible:
		overlap_text_timer += unscaled_delta # Use our unscaled_delta here instead!
		print(overlap_text_timer)
		if overlap_text_timer >= 1:
			overlap_text_timer = 0
			%Overlap_text.visible = false
			
func _on_start_pressed() -> void:
	for i in range(%Pipes.get_child_count()):
		var Pipe = %Pipes.get_child(i)
		if Pipe.Is_Overlapping:
			%Overlap_text.visible = true
			
			return
			
	LevelData.I_Running = true
	Engine.time_scale = 1

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50

func _on_end_pressed() -> void:
	get_tree().reload_current_scene()
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels_menu.tscn")
