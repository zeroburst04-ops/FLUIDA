extends Control

@onready var Brightness : = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://option.tscn")
