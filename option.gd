extends Control


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")
