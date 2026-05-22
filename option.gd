extends Control

@onready var Brightness : = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness
	
func _ready() -> void:
	%Brightness_SO.value = Settings.Brightness_Slider
	%BackGround_Music_SO.value = Settings.BackGround_Music_Slider

func _process(delta: float) -> void:
	Settings.BackGround_Music_Slider = %BackGround_Music_SO.value
	Settings.Brightness_Slider = %Brightness_SO.value
	
	Settings.BackGround_Music = ((%BackGround_Music_SO.value * 24) - 15)
	Settings.Brightness = 1 - %Brightness_SO.value 
	
	%Music_Player.volume_db = Settings.BackGround_Music

	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")

func _on_music_player_finished() -> void:
	%Music_Player.play()

func _on_key_button_pressed() -> void:
	get_tree().change_scene_to_file("res://KEYBINDS2.tscn")
	
