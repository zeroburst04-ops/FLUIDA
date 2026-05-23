extends Node2D

signal trigger_win_movie

@onready var Kyoger := %Kyogre
@onready var Start : float = Kyoger.global_position.y
@onready var Threshold : float = Start - 30
@onready var Pipe_Area := %Pipe_Area

var Is_Overlapping : bool = true
var direction : float = 0.0
var timer : float = 6.0
var animation_started : bool = false 

func _ready() -> void:
	%Win_Label.visible = false
	if has_node("Timer"):
		$Timer.start() 
	
	# Connect our custom signal to the isolated handler function
	trigger_win_movie.connect(_on_trigger_win_movie)

func _on_timer_timeout():
	var sprite = %Kyogre.get_node_or_null("Area2D/AnimatedSprite2D")
	if sprite:
		sprite.play("default")
	
func _physics_process(delta: float) -> void:
	# --- Logika Kondisi Menang ---
	if Kyoger.global_position.y < Threshold:
		timer -= delta
		%Win_Label.visible = true
		%Win_Label.text = str(ceil(timer)) 
		
		# --- PLAY MOVIE ANIMATION WHEN TIMER IS 0 ---
		if timer <= 0:
			timer = 0
			%Win_Label.text = "YOU WIN !!"
			
			if not animation_started:
				animation_started = true
				trigger_win_movie.emit() # Fire the signal safely once!
			
	else:
		timer = 6.0
		animation_started = false 
		%Win_Label.text = "6"
		%Win_Label.visible = false
	
	if Pipe_Area: 
		Overlap()

# This runs safely outside the continuous physics processor loops
func _on_trigger_win_movie() -> void:
	var sprite = $Kyogre/Area2D/AnimatedSprite2D
	if sprite:
		sprite.play("default")
		# Holds the script execution right here until the animation frames finish
		await sprite.animation_finished 
	
	# Change scenes ONLY after the full sprite animation finishes playing
	LevelData.I_Win = true
	get_tree().change_scene_to_file("res://win_scene.tscn")

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	if Pipe_Area.get_overlapping_areas().size() > 1:
		%CupShape.modulate.g = 0.0
		%CupShape.modulate.b = 0.0
		Is_Overlapping = true
	else:
		%CupShape.modulate.g = 1.0
		%CupShape.modulate.b = 1.0
		Is_Overlapping = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("OUT_OF_BOUNDS"):
		LevelData.I_Lose = false
