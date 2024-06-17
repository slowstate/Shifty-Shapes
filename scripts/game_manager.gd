extends Node

@onready var high_score_label = $HighScoreLabel
@onready var score_label = $ScoreLabel
@onready var restart_label = $RestartLabel

signal pressedSpace
func _input(event):
	if event.is_action_pressed("ui_select"):
		pressedSpace.emit()
		
var high_score = 0
var score = 0

func _ready():
	load_game()
	score_label.text = str(score)
	high_score_label.text = str(high_score)

func add_point():
	score += 1
	score_label.text = str(score)

func player_died():
	if score > high_score:
		save_game()
		pass
	Engine.time_scale = 0
	restart_label.text = "Press SPACE to restart"
	await pressedSpace
	Engine.time_scale = 1
	restart_label.text = ""
	get_tree().reload_current_scene()

func save_game():
	var save_dict = {
		"high_score" : score
	}
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save_dict)
	
	save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var node_data = json.get_data()
		
		# Firstly, we need to create the object and add it to the tree and set its position.
		high_score = node_data["high_score"]
