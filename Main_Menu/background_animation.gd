extends VideoStreamPlayer

func _ready() -> void:
	# Ensure the video settings are perfectly configured on spawn
	expand = true
	loop = true
	process_mode = PROCESS_MODE_ALWAYS # Keeps it running even if menus pause
	
	# Small delay to let the UI layout settle before rendering frames
	await get_tree().process_frame
	play()
