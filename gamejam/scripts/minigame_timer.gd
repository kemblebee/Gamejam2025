extends Node
var str_new = "temp"
var last_check_num = 0

signal aff_max

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
	print("CHECK")
	
	#Check if max value, then emit signal
	if $AffBar.value == 100:
		aff_max.emit()
	
	$TypingChecker.instantiate_new(str_new)
	$TypingChecker.visible = true
