extends Node2D

@onready var Kyoger : = %Kyogre
@onready var Start : float = Kyoger.global_position.y
@onready var Threshold : float = Start - 70

func _ready() -> void:
	%Win_Label.visible = false
	
func _process(delta: float) -> void:
	if Kyoger.global_position.y < Threshold:
		LevelData.I_Win = true
		%Win_Label.visible = true
