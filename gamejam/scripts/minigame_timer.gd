extends Node

#Lowers the percentage on the bar by 1 each second that passes.
func _on_timer_timeout() -> void:
	$ProgressBar.value -= 1



func _on_node_test_sig() -> void:
	$ProgressBar.value += 2
	$AffBar.value += 2
