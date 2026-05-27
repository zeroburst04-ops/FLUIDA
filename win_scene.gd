extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%CoolAnimation.play("RESET")
	%Score.text = "Score : " + str(LevelData.Overall_Score)
	%"Used-Pipes".text = "Pipes used : " + str(LevelData.Pipe_Score)
	
	match LevelData.Level:
		11:
			SAVE_DATA.update_score("Score_Normal_1", LevelData.Overall_Score)
		12:
			SAVE_DATA.update_score("Score_Normal_2", LevelData.Overall_Score)
		13:
			SAVE_DATA.update_score("Score_Normal_3", LevelData.Overall_Score)
		14:
			SAVE_DATA.update_score("Score_Normal_4", LevelData.Overall_Score)
		15:
			SAVE_DATA.update_score("Score_Normal_5", LevelData.Overall_Score)
		21:
			SAVE_DATA.update_score("Score_Hard_1", LevelData.Overall_Score)
		22:
			SAVE_DATA.update_score("Score_Hard_2", LevelData.Overall_Score)
		23:
			SAVE_DATA.update_score("Score_Hard_3", LevelData.Overall_Score)
		24:
			SAVE_DATA.update_score("Score_Hard_4", LevelData.Overall_Score)
		25:
			SAVE_DATA.update_score("Score_Hard_5", LevelData.Overall_Score)
			
			
			
	SAVE_DATA.save_game()
	await get_tree().create_timer(1.0).timeout # Wait for 2 seconds
	%CoolAnimation.play("FAHK")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels_menu.tscn")
	
