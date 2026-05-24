extends Camera2D

@export var scroll_speed: float = 400.0
@export var smooth_speed: float = 10.0

var target_y: float

func _ready() -> void:
	target_y = global_position.y

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			target_y += scroll_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			target_y -= scroll_speed
		
		# Automatically clamp using your Inspector Limit properties
		target_y = clamp(target_y, limit_top, limit_bottom)

func _process(delta: float) -> void:
	global_position.y = lerp(global_position.y, target_y, smooth_speed * delta)
