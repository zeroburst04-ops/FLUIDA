extends Node2D

@onready var Kyoger : = %Kyogre
@onready var Start : float = Kyoger.global_position.y
@onready var Threshold : float = Start - 30

var timer : float = 6

func _ready() -> void:
	%Win_Label.visible = false
	
func _process(delta: float) -> void:
	if Kyoger.global_position.y < Threshold:
		timer -= delta
		%Win_Label.visible = true
		%Win_Label.text = str(int(timer))
		if timer < 1:
			%Win_Label.text = "YOU WIN !!"
			LevelData.I_Win = true
	else:
		timer = 6
		%Win_Label.text = "3"
		%Win_Label.visible = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("OUT_OF_BOUNDS"):
		LevelData.I_Lose = false
		
