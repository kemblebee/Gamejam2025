extends Control

signal word_correct

func _on_line_edit_text_changed(new_text: String) -> void:
	#new_text is the FULL STRING DO NOT GET THIS INCORRECT!
	
	#Labelling these here cause I reuse these a lot
	var disp_low = $DisplayLabel.text.to_lower()
	var new_low = new_text.to_lower()
	
	#If everything is correct: emit word_correct and print WOO
	if disp_low == new_low:
		word_correct.emit()
		print("WOO")
		
	#If full word isn't correct, check if current length is correct
	else:
		#Substring to the current length
		#Move this later so it can be done when initalized and not every time
		var disp_cur = disp_low.substr(0, new_low.length())
		
		#Check here
		if disp_cur == new_low:
			print("Curr Correct!")
		else:
			print("ew")

#?? Old legacy input when I didn't know LineEdit existed
#func _input(event):
	#if event is InputEventKey and event.pressed:
		#print(event.as_text())
		#$WriteLabel.text += event.as_text()
