extends Node2D

var Is_Dragging : bool = false
var offset = Vector2(0, 0)

var Snap = 50
@onready var Pipe_Area : = %Pipe_Area

var Is_Overlapping : bool = false

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50
	
func _ready() -> void:
	Snapfunc()
	
var overlap_timer: float = 0.0

func _process(delta: float) -> void:
	# Handle movement every frame
	if Is_Dragging:
		var NewPos = get_global_mouse_position() - offset
		position = Vector2(snapped(NewPos.x, Snap), snapped(NewPos.y, Snap))
		if Input.is_action_just_pressed("Rotate"):
			rotation_degrees += 90
			
	Snapfunc()
	# Only call Overlap if Pipe_Area was successfully found
	if Pipe_Area: 
		Overlap()

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	# 2. Check if the array contains any overlapping areas
	if Pipe_Area.get_overlapping_areas().size() > 0:
		# Areas are overlapping: Remove green and blue (turns the shape Red)
		%"TS_Knee Shape".modulate.g = 0.0
		%"TS_Knee Shape".modulate.b = 0.0
		Is_Overlapping = true
	else:
		# No overlaps: Reset green and blue to normal (turns the shape back to White/Normal)
		%"TS_Knee Shape".modulate.g = 255
		%"TS_Knee Shape".modulate.b = 255
		Is_Overlapping = false
		
func _on_drag_button_down() -> void:
	Is_Dragging = true
	offset = get_global_mouse_position() - global_position
	
func _on_drag_button_up() -> void:
	Is_Dragging = false
