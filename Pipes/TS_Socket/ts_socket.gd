extends Node2D

enum States {
	Normal,
	Reducer
}

@export var CurrentState = States.Normal

func _ready() -> void:
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

func _process(delta: float) -> void:
	if Is_Dragging:
		var NewPos = get_global_mouse_position() - offset
		position = Vector2(snapped(NewPos.x, Snap), snapped(NewPos.y, Snap))
		
func _on_drag_button_down() -> void:
	Is_Dragging = true
	offset = get_global_mouse_position() - global_position
	
func _on_drag_button_up() -> void:
	Is_Dragging = false
