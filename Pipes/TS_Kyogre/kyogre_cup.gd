extends Node2D

@onready var Kyoger := %Kyogre
@onready var Start : float = Kyoger.global_position.y
@onready var Threshold : float = Start - 30
@onready var Pipe_Area := %Pipe_Area

var Is_Overlapping : bool = true
var timer : float = 6
var direction : float = 0.0

func _ready() -> void:
	%Win_Label.visible = false
	$Timer.start() # Starts your countdown

func _on_timer_timeout():
	$Area2D/AnimatedSprite2D.play("default")
	
func _physics_process(delta: float) -> void:
	# --- Logika Kondisi Menang ---
	if Kyoger.global_position.y < Threshold:
		timer -= delta
		%Win_Label.visible = true
		%Win_Label.text = str(int(timer))
		
		# Pindah scene ditaruh di sini (di dalam fungsi jalannya game)
		if timer < 1:
			%Win_Label.text = "YOU WIN !!"
			LevelData.I_Win = true
			get_tree().change_scene_to_file("res://win_scene.tscn")
			
	else:
		timer = 6
		%Win_Label.text = "3"
		%Win_Label.visible = false
	
	# --- Pemeriksaan Overlap Fisika ---
	if Pipe_Area: 
		Overlap()

	# --- FORCE PLAY ANIMATION ---
	var sprite = %Kyogre.get_node("Area2D/AnimatedSprite2D") as AnimatedSprite2D
	if sprite:
		sprite.speed_scale = 1.0 # Force speed scale to normal
		if not sprite.is_playing():
			sprite.autoplay = "default"
			sprite.play("default")

func Overlap() -> void:
	if Pipe_Area == null:
		return
		
	# Check if the array contains any overlapping areas
	if Pipe_Area.get_overlapping_areas().size() > 1:
		# Areas are overlapping: Remove green and blue (turns the shape Red)
		%CupShape.modulate.g = 0.0
		%CupShape.modulate.b = 0.0
		Is_Overlapping = true
	else:
		# No overlaps: Reset green and blue to normal (1.0 is standard color in Godot 4)
		%CupShape.modulate.g = 1.0
		%CupShape.modulate.b = 1.0
		Is_Overlapping = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("OUT_OF_BOUNDS"):
		LevelData.I_Lose = false
