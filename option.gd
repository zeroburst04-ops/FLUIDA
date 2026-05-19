extends Control

func _process(delta: float) -> void:
	Settings.BackGround_Music = (($BackGround_Music_SO.value * 24) - 15)
	%Music_Player.volume_db = Settings.BackGround_Music
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")

func _on_music_player_finished() -> void:
	%Music_Player.play()
