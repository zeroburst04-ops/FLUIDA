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


func _on_level_1_pressed() -> void:
	SceneManager.load_scene("res://LEVELS/level_1.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://TestScene/test_scene.tscn")


func _on_level_2_button_down() -> void:
	SceneManager.load_scene("res://LEVELS/level_2.tscn")
	
func _on_level_3_pressed() -> void:
	SceneManager.load_scene("res://LEVELS/level_3.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://levels_menu.tscn")


func _on_level_4_pressed() -> void:
	SceneManager.load_scene("res://LEVELS/level_4.tscn")


func _on_level_5_pressed() -> void:
	SceneManager.load_scene("res://LEVELS/level_5.tscn")
