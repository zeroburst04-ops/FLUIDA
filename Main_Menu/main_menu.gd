extends Control

@onready var video_player: VideoStreamPlayer = $Background_Animation
@onready var BGM = %BackGround_Music
func _process(delta: float) -> void:
	BGM.volume_db = Settings.BackGround_Music3
	
@onready var Brightness = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels_menu.tscn")
	
func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://TestScene/test_scene.tscn")
	#get_tree().change_scene_to_file("res://loading _screen.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://option.tscn")
	
func _on_test_button_pressed() -> void:
	get_tree().change_scene_to_file("res://TestScene/test_scene.tscn")

func _enter_tree() -> void:
	if video_player:
		video_player.stop() 
		video_player.play()

func _ready() -> void:
	if video_player and not video_player.is_playing():
		video_player.play()
