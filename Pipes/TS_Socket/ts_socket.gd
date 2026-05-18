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
