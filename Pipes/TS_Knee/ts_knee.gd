extends Node2D

var Is_Dragging : bool = false
var offset = Vector2(0, 0)

var Snap = 50

func Snapfunc() -> void:
	global_position.x -= int(global_position.x) % 50
	global_position.y -= int(global_position.y) % 50
	
func _ready() -> void:
	Snapfunc()
	
func _process(delta: float) -> void:
	Snapfunc()
	if Is_Dragging:
		var NewPos = get_global_mouse_position() - offset
		position = Vector2(snapped(NewPos.x, Snap), snapped(NewPos.y, Snap))
		if Input.is_action_just_pressed("Rotate"):
			rotation_degrees += 90

func _on_drag_button_down() -> void:
	Is_Dragging = true
	offset = get_global_mouse_position() - global_position
	
func _on_drag_button_up() -> void:
	Is_Dragging = false


func _on_pipe_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Pipe"):
		%"TS_Knee Shape".modulate.g = 0
		%"TS_Knee Shape".modulate.b = 0


func _on_pipe_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("Pipe"):
		%"TS_Knee Shape".modulate.g = 255
		%"TS_Knee Shape".modulate.b = 255
