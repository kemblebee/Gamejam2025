extends Control

#Regular story: 0. Minigame: 1
#id for story - scene (in json)
#id for minigame - word (in json)

var dia_index = 0
var finished = false
var dialogue = []
var minigame = false

#Gets the dialogue from get_dialog function
func _ready():
	if State.scene_num % 2 == 0: 
		get_dialog(State.json_story)
	else:
		get_dialog(State.json_minigame)
		minigame = true
	
	load_dialog()

#Gets all of the dialogue needed for scene
func get_dialog(dict_val):
	for i in dict_val:
		#print(i)
		if i['scene'] == State.scene_num and minigame == false:
			dialogue.append([i['talk_person'], i['dialogue'], i['image']])
		elif minigame and State.recent_vocab == i['word']:
			dialogue = ['Moira', i['dialogue'], i['image']]
	#print(dialogue)

#Checks if ui_accept is pressed, and if so, loads the next dialogue
@warning_ignore("unused_parameter")
func _process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		load_dialog()

func load_dialog():
	if dia_index < dialogue.size():
		$Speaker.bbcode_text = dialogue[dia_index][0]
		$Text.bbcode_text = dialogue[dia_index][1]
		
		#Check if image specification exists if not hide
		#0: Do nothing, -1: Hide
		if dialogue[dia_index][2] == "-1":
			$Character.visible = not visible
		elif dialogue[dia_index][2] != "0":
			var texture_path = "res://assets/Character/" + dialogue[dia_index][2] + ".png"
			var texture = load(texture_path)
			
			$Character.visible = true
			$Character.texture = texture
	
	else:
		queue_free()
	
	dia_index += 1
