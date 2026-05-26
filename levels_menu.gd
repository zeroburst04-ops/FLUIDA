extends Control

@onready var Brightness : = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness

func _process(delta: float) -> void:
	%Music.volume_db = Settings.BackGround_Music
	if Input.is_action_just_pressed("1"):
		get_tree().change_scene_to_file("res://SANE_LEVELS/SANE_LEVEL_1/level_1_SL.tscn")
	if Input.is_action_just_pressed("2"):
		get_tree().change_scene_to_file("res://SANE_LEVELS/SANE_LEVEL_2/level_2_SL.tscn")
	if Input.is_action_just_pressed("3"):
		pass
	if Input.is_action_just_pressed("4"):
		pass
	if Input.is_action_just_pressed("5"):
		pass




func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")

func _ready():
	$Music.volume_db = -5.0


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://LEVELS/level_1.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://TestScene/test_scene.tscn")


func _on_level_2_button_down() -> void:
	get_tree().change_scene_to_file("res://LEVELS/level_2.tscn")
