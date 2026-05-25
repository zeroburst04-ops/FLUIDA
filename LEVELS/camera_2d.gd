extends Camera2D

@export var scroll_speed: float = 400
@export var smooth_speed: float = 10.0

var target_y: float
var pipe_panel_start_y: float
var Camera_start_y : float
var Camera_end_y : float

var Cam_mentok_atas : bool = false
var Cam_mentok_bawah : bool = false

func _ready() -> void:
	pipe_panel_start_y = %Pipe_panel.global_position.y
	Camera_start_y = %Camera2D.global_position.y
	Camera_end_y = %Camera2D.global_position.y + 7500
	
func _process(delta: float) -> void:
	if %Camera2D.global_position.y < Camera_start_y:
		%Camera2D.global_position.y = Camera_start_y
	if %Pipe_panel.global_position.y < pipe_panel_start_y:
		%Pipe_panel.global_position.y = pipe_panel_start_y
	
	if %Camera2D.global_position.y <= Camera_start_y:
		Cam_mentok_atas = true
	else:
		Cam_mentok_atas = false
	
	if %Camera2D.global_position.y >= Camera_end_y:
		Cam_mentok_bawah = true
	else:
		Cam_mentok_bawah = false
		
	if Input.is_action_just_pressed("Go_up") and not Cam_mentok_atas:
		%Camera2D.position.y -= scroll_speed
	if Input.is_action_just_pressed("Go_Down") and not Cam_mentok_bawah:
		%Camera2D.position.y += scroll_speed
