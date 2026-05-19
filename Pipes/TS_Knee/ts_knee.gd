extends Node2D

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
