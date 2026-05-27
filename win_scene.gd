extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%CoolAnimation.play("RESET")
	await get_tree().create_timer(1.0).timeout # Wait for 2 seconds
	%CoolAnimation.play("FAHK")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels_menu.tscn")
	
