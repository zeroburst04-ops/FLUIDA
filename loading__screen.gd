extends Node2D

var progress = []
var sceneName: String = ""
var scene_load_status = 0
var loading_selesai_bisa_pindah: bool = false

@onready var Brightness := $Brightness_Overlay
@onready var VideoPlayer = $VideoStreamPlayer 

func _physics_process(delta: float) -> void:
	Brightness.modulate.a = Settings.Brightness

func _process(delta: float) -> void:
	if sceneName == "":
		return
		
	scene_load_status = ResourceLoader.load_threaded_get_status(sceneName, progress)
	
	if progress.size() > 0:
		$progress.text = str(floor(progress[0] * 100)) + "%"
		
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED and loading_selesai_bisa_pindah == true:
		var newScene = ResourceLoader.load_threaded_get(sceneName)
		get_tree().change_scene_to_packed(newScene)

func _ready() -> void:
	# Reset variabel standar
	loading_selesai_bisa_pindah = false
	scene_load_status = 0
	progress.clear()
	
	# Karena scene manager sekarang membuat instance baru, 
	# perintah play() di bawah ini dijamin akan memutar video dari detik ke-0!
	if VideoPlayer:
		VideoPlayer.play()
	
	sceneName = SceneManager.target_scene_path
	
	if sceneName == "":
		sceneName = "res://LEVELS/level_1.tscn"
		
	ResourceLoader.load_threaded_request(sceneName)
	mulai_audio_dan_timer()

func mulai_audio_dan_timer() -> void:
	$kyogre_cry.volume_db = -3.0
	await get_tree().create_timer(5.0).timeout
	await get_tree().process_frame
	loading_selesai_bisa_pindah = true
	
	while true:
		$kyogre_cry.play()
		await get_tree().create_timer(13.0).timeout
