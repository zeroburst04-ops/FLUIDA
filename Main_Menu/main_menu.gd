extends Control

@onready var BGM = %BackGround_Music
func _process(delta: float) -> void:
	BGM.volume_db = Settings.BackGround_Music
	
@onready var Brightness : = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels_menu.tscn")
	
func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://loading _screen.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://option.tscn")
	
func _on_test_button_pressed() -> void:
	get_tree().change_scene_to_file("res://TestScene/test_scene.tscn")
	
func _ready():
	$kyogre_cry.volume_db = -2.5
	await get_tree().create_timer(5.0).timeout
	$kyogre_cry.play()
	while true:
		$kyogre_cry.play()
		await get_tree().create_timer(18.0).timeout 
