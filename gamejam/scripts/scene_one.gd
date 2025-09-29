extends Node2D

var minigame = preload("res://scenes/minigame_timer.tscn")
var dialog = preload("res://scenes/dialogue_box.tscn")

var dia_load = dialog.instantiate()
var mini_load = minigame.instantiate()


func _ready():
	
	
	add_child(dialog.instantiate())
	
	#var dia_manage = dia_load.get_node("DialogueBox")
	#dia_manage._on_dialogue_box_donedone.connect(_on_dialogue_box_donedone)

func _on_dialogue_box_donedone() -> void:
	State.scene_num += 1
	if State.scene_num % 2 != 0:
		add_child(mini_load)
