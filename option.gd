extends Control

func _process(delta: float) -> void:
	%Music_Player.volume_db =  (($BackGround_Music_SO.value * 24) - 22)
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")

func _on_music_player_finished() -> void:
	%Music_Player.play()
