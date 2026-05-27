extends Node

const SAVE_PATH = "user://save_data.cfg"
const SCORE_SECTION = "HighScores"

# Storing your requested floats in a Dictionary.
# These act as the default values if no save file exists.
var scores: Dictionary = {
	"Score_Normal_1": 0.0,
	"Score_Normal_2": 0.0,
	"Score_Normal_3": 0.0,
	"Score_Normal_4": 0.0,
	"Score_Normal_5": 0.0,
	"Score_Hard_1": 0.0,
	"Score_Hard_2": 0.0,
	"Score_Hard_3": 0.0,
	"Score_Hard_4": 0.0,
	"Score_Hard_5": 0.0
}

func _ready() -> void:
	# Automatically attempt to load data when the game starts
	load_game()

# ---------------------------------------------------------
# CORE SAVE/LOAD METHODS
# ---------------------------------------------------------

func save_game() -> void:
	var config = ConfigFile.new()
	
	# Loop through our dictionary and write every key/value to the config
	for key in scores.keys():
		config.set_value(SCORE_SECTION, key, scores[key])
		
	var err = config.save(SAVE_PATH)
	if err != OK:
		push_error("Failed to save game data. Error code: ", err)
	else:
		print("Game saved successfully to: ", SAVE_PATH)

func load_game() -> void:
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)
	
	if err != OK:
		print("No save file found or failed to load. Sticking to default values.")
		return
		
	# Update our dictionary with saved values. 
	# The '0.0' is a fallback just in case a key is missing in the file.
	for key in scores.keys():
		scores[key] = config.get_value(SCORE_SECTION, key, 0.0)
		
	print("Game loaded successfully.")

# ---------------------------------------------------------
# SCORE UPDATING & GETTING
# ---------------------------------------------------------

func update_score(score_key: String, new_score: float) -> void:
	if scores.has(score_key):
		# Standard logic: Only update if the new score is higher than the old one
		if new_score > scores[score_key]:
			scores[score_key] = new_score
			save_game() # Auto-save immediately upon setting a new high score
	else:
		push_error("Tried to save to an invalid score key: ", score_key)

func get_score(score_key: String) -> float:
	if scores.has(score_key):
		return scores[score_key]
	
	push_error("Tried to get an invalid score key: ", score_key)
	return 0.0

# ---------------------------------------------------------
# SAVE CLEARING (Important Stuff)
# ---------------------------------------------------------

func reset_scores_in_memory() -> void:
	# Resets the current active memory to 0.0, but doesn't delete the actual file
	# (Helpful if the player hits "restart" but hasn't confirmed yet)
	for key in scores.keys():
		scores[key] = 0.0
	print("Scores reset in active memory.")

func clear_save_file() -> void:
	# Physically deletes the save file from the hard drive
	if FileAccess.file_exists(SAVE_PATH):
		var err = DirAccess.remove_absolute(SAVE_PATH)
		if err == OK:
			print("Save file permanently deleted.")
			reset_scores_in_memory() # Clear the variables in the game too
		else:
			push_error("Failed to delete save file. Error code: ", err)
	else:
		print("No save file exists to delete.")
