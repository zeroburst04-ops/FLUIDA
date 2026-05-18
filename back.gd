extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	pass
func _on_Back_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")
