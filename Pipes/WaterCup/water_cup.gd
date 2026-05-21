extends Node2D

@onready var Pipe_Area : = %Pipe_Area
var Is_Overlapping : bool = false
enum Plugs {
	Bottom,
	Bottom_Left,
	Upper_Left,
	Bottom_Right,
	Upper_Right
}

@export var Openedside = Plugs.Bottom

func _ready() -> void:
	match Openedside:
		Plugs.Bottom:
			%Bottom_Plug.modulate.a = 0
			%BottomPlug_Collision.disabled = true
		Plugs.Bottom_Left:
			%"Bottom-Left_Plug".modulate.a = 0
			%BottomLeftPlug_Collision.disabled = true
		Plugs.Bottom_Right:
			%"Bottom-Right_Plug".modulate.a = 0
			%BottomRightPlug_Collision.disabled = true
		Plugs.Upper_Right:
			%"Upper-Right_Plug".modulate.a = 0
			%UpperRightPlug_Collision.disabled = true
		Plugs.Upper_Left:
			%"Upper-Left_Plug".modulate.a = 0
			%UpperLeftPlug_Collision.disabled = true
			
func _process(delta: float) -> void:
	if Pipe_Area: 
		Overlap()

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	# 2. Check if the array contains any overlapping areas
	if Pipe_Area.get_overlapping_areas().size() > 0:
		# Areas are overlapping: Remove green and blue (turns the shape Red)
		%CupShape.modulate.g = 0.0
		%CupShape.modulate.b = 0.0
		Is_Overlapping = true
	else:
		# No overlaps: Reset green and blue to normal (turns the shape back to White/Normal)
		%CupShape.modulate.g = 255
		%CupShape.modulate.b = 255
		Is_Overlapping = false
