extends Node

#Lowers the percentage on the bar by 1 each second that passes.
func _on_timer_timeout() -> void:
	$ProgressBar.value -= 1
	
	if $ProgressBar.value == 1:
		$Timer.one_shot = true
	#Do something when the progress bar hits 0
	elif $ProgressBar.value == 0:
		print("SCENE OVER!")
		


func _on_typing_checker_word_correct() -> void:
	$ProgressBar.value += 2
	$AffBar.value += 5
