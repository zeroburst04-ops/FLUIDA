extends Node2D

@onready var Brightness : = $Brightness_Overlay
func _physics_process(delta:float) -> void:
	Brightness.modulate.a = Settings.Brightness

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready():
	$kyogre_cry.volume_db = -3.0
	await get_tree().create_timer(5.0).timeout
	$kyogre_cry.play()
	while true:
		$kyogre_cry.play()
		await get_tree().create_timer(13.0).timeout 
