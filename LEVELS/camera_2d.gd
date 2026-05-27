extends Camera2D

@export var scroll_speed: float = 400
@export var smooth_speed: float = 10.0

var target_y: float
var pipe_panel_start_y: float
var Camera_start_y : float
var Camera_end_y : float

var I_CUTSCENE_Play : bool = false
var Cam_mentok_atas : bool = false
var Cam_mentok_bawah : bool = false

func _ready() -> void:
	
	pipe_panel_start_y = %Pipe_panel.global_position.y
	Camera_start_y = %Camera2D.global_position.y
	Camera_end_y = %Camera2D.global_position.y + 7500
	
	
	await get_tree().create_timer(1).timeout
	var tween = create_tween()

# Apply smooth easing to make the movement feel natural
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	
# 1. Move DOWN by 50 pixels over 0.5 seconds (In 2D, positive Y is down)
	tween.tween_property(%Camera2D, "position:y", 7500, 2).as_relative()
	
	await get_tree().create_timer(2.5).timeout
# 2. Move UP by 50 pixels over 0.5 seconds
	var tween2 = create_tween()
	
	tween2.set_trans(Tween.TRANS_SINE)
	tween2.set_ease(Tween.EASE_IN_OUT)
	tween2.tween_property(%Camera2D, "position:y", -7559.0, 2).as_relative()
	I_CUTSCENE_Play = true
	await get_tree().create_timer(1.5).timeout
	%Explanatory_Panel.visible = false
	
func _process(delta: float) -> void:
	if I_CUTSCENE_Play:
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
