
extends Node2D

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
			
