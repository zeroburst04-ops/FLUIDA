extends Node2D

enum States {
	Normal,
	Reducer
}

@onready var Pipe_Area := %Pipe_Area
@export var CurrentState = States.Normal
var Is_Overlapping : bool = false

func _ready() -> void:
	Snapfunc()
	match CurrentState:
		States.Normal:
			%Reducer.visible = false
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D7".disabled = true
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D8".disabled = true
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D9".disabled = true
			$"TS_Socket Collision/TS_Socket_Reducer Collision/TS_Socket_Reducer Collision/CollisionShape2D10".disabled = true
		States.Reducer:
			pass

var Is_Dragging : bool = false
var offset = Vector2(0, 0)

var Snap = 50

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50
	
	
	
func _process(delta: float) -> void:
	Snapfunc()
	if Is_Dragging:
		var NewPos = get_global_mouse_position() - offset
		position = Vector2(snapped(NewPos.x, Snap), snapped(NewPos.y, Snap))
		if Input.is_action_just_pressed("Rotate"):
			rotation_degrees += 90
		
	if Pipe_Area: 
		Overlap()

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	# 2. Check if the array contains any overlapping areas
	if Pipe_Area.get_overlapping_areas().size() > 0:
		# Areas are overlapping: Remove green and blue (turns the shape Red)
		%"TS_Socket Shape".modulate.g = 0.0
		%"TS_Socket Shape".modulate.b = 0.0
		Is_Overlapping = true
	else:
		# No overlaps: Reset green and blue to normal (turns the shape back to White/Normal)
		%"TS_Socket Shape".modulate.g = 255
		%"TS_Socket Shape".modulate.b = 255
		Is_Overlapping = false
		
func _on_drag_button_down() -> void:
	if not LevelData.I_Running:
		Is_Dragging = true
		offset = get_global_mouse_position() - global_position
	
func _on_drag_button_up() -> void:
	if not LevelData.I_Running:
		Is_Dragging = false
