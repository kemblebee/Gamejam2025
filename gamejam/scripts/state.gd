extends Node

var scene_num: int = 0
var aff_value: int = 0

var minigame_json = "res://dialogue/dialogue_minigame.json"
var story_json = "res://dialogue/dialogue_story.json"

func load_json_file(filePath):
	var dataFile = FileAccess.open(filePath, FileAccess.READ)
	var parsedResult = JSON.parse_string(dataFile.get_as_text())
	
	#print(parsedResult)
	#print()
	#print("---------")
	return parsedResult

func get_dialog(dict_val):
	var dialogue = []
	
	for i in dict_val:
		#print(i)
		if i['scene'] == State.scene_num:
			dialogue.append([i['talk_person'], i['dialogue']])
	return dialogue

func get_terms(dict_val):
	var dialogue = []
	for i in dict_val:
		if i['scene'] == State.scene_num:
			dialogue.append(['Moira', i['dialogue']])
	return dialogue

var json_minigame = load_json_file(minigame_json)
var json_story = load_json_file(story_json)
