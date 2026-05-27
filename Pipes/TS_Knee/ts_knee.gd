extends Control

var Is_Dragging : bool = true
var offset = Vector2(0, 0)

var Snap = 50
@onready var Pipe_Area : = %Pipe_Area
@onready var Pipe_Node : = %Pipes
var Is_Overlapping : bool = false

func Snapfunc() -> void:
	global_position.x = floor(global_position.x / 50.0) * 50
	global_position.y = floor(global_position.y / 50.0) * 50
	
func _ready() -> void:
	Snapfunc()
	Pipe_Area.monitorable = false
	Pipe_Area.monitoring = false
	
var overlap_timer: float = 0.0

func _process(delta: float) -> void:
	if $".".get_parent() == Pipe_Node:
		Pipe_Area.monitorable = true
		Pipe_Area.monitoring = true
	#EXPORTED
	if not LevelData.I_Running:
		for i in range(%StaticBody2D.get_child_count()):
			%StaticBody2D.get_child(i).disabled = true
	else:
		for i in range(%StaticBody2D.get_child_count()):
			%StaticBody2D.get_child(i).disabled = false
			
	if Input.is_action_just_released("Grab"):
		Is_Dragging = false
	
	if not LevelData.I_Running:
		%StaticBody2D.disable_mode = true
	else:
		%StaticBody2D.disable_mode = false
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
		#%Model.modulate.g = 0.0
		#%Model.modulate.b = 0.0
		Is_Overlapping = true
	else:
		# No overlaps: Reset green and blue to normal (turns the shape back to White/Normal)
		#%Model.modulate.g = 255
		#%Model.modulate.b = 255
		Is_Overlapping = false
		
func _on_drag_button_down() -> void:
	if not LevelData.I_Running:
		if $".".get_parent() == %PipeContainer:
			$".".reparent(%Pipes)
		Is_Dragging = true
		offset = get_global_mouse_position() - global_position
	else:
		Is_Dragging = false
		
func _on_drag_button_up() -> void:
	if not LevelData.I_Running:
		
		Is_Dragging = false
