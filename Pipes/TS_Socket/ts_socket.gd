extends Node2D

enum States {
	Normal,
	Reducer
}

@onready var Pipe_Area := %Pipe_Area
@export var CurrentState = States.Normal
var Is_Overlapping : bool = false

var Is_Dragging : bool = false
var offset = Vector2(0, 0)
var Snap = 25

func _ready() -> void:
	Snapfunc()
	match CurrentState:
		States.Normal:
			%Reducer.visible = false
			# Disabling unnecessary collision shapes for Normal mode
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D7".disabled = true
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D8".disabled = true
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D9".disabled = true
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D10".disabled = true
		States.Reducer:
			pass

func Snapfunc() -> void:
	# Godot 4 built-in snapping math (handles negative coordinates perfectly)
	global_position = global_position.snapped(Vector2(Snap, Snap))
	
func _process(delta: float) -> void:
	if Is_Dragging:
		var NewPos = get_global_mouse_position() - offset
		# Snap the position to the grid WHILE dragging
		global_position = NewPos.snapped(Vector2(Snap, Snap))
		
		if Input.is_action_just_pressed("Rotate"):
			rotation_degrees += 90
		
	if Pipe_Area: 
		Overlap()

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	if Pipe_Area.get_overlapping_areas().size() > 0:
		# Turns the shape Red (No Green, No Blue)
		%"TS_Socket Shape".modulate.g = 0.0
		%"TS_Socket Shape".modulate.b = 0.0
		Is_Overlapping = true
	else:
		# Resets back to standard White (1.0 is max)
		%"TS_Socket Shape".modulate.g = 1.0
		%"TS_Socket Shape".modulate.b = 1.0
		Is_Overlapping = false
		
func _on_drag_button_down() -> void:
	if not LevelData.I_Running:
		Is_Dragging = true
		offset = get_global_mouse_position() - global_position
	
func _on_drag_button_up() -> void:
	if not LevelData.I_Running:
		Is_Dragging = false
		Snapfunc() # Make sure it firmly locks into place upon release
