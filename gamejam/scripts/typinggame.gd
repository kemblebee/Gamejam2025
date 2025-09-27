extends Control


@onready var display_text = $DisplayLabel.text
@onready var write_text = $WriteLabel.text

signal word_correct

func change_label():
	if display_text == write_text:
		word_correct.emit()
