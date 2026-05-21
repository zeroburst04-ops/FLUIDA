extends Control

@onready var Brightness : = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness

func _process(delta: float) -> void:
	%Music.volume_db = Settings.BackGround_Music
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")

func _ready():
	$Music.volume_db = -5.0
