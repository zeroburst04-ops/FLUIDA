extends Node2D

@onready var Kyoger : = %Kyogre
@onready var Start : float = Kyoger.global_position.y
@onready var Threshold : float = Start - 30
@onready var Pipe_Area : = %Pipe_Area
var Is_Overlapping : bool = true
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
	
# Only call Overlap if Pipe_Area was successfully found
	if Pipe_Area: 
		Overlap()

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	# 2. Check if the array contains any overlapping areas
	if Pipe_Area.get_overlapping_areas().size() > 1:
		# Areas are overlapping: Remove green and blue (turns the shape Red)
		%CupShape.modulate.g = 0.0
		%CupShape.modulate.b = 0.0
		Is_Overlapping = true
	else:
		# No overlaps: Reset green and blue to normal (turns the shape back to White/Normal)
		%CupShape.modulate.g = 255
		%CupShape.modulate.b = 255
		Is_Overlapping = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("OUT_OF_BOUNDS"):
		LevelData.I_Lose = false
		
