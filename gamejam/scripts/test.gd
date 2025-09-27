extends Node

signal test_sig
var numberTimed = 0

func _on_timer_timeout() -> void:
	numberTimed += 1
	$Label.text = str(numberTimed)
	test_sig.emit()
