extends CanvasLayer

func _ready():
	hide()

func _on_main_is_paused(next):
	if next:
		show()
		$UI/Panel/VBoxContainer/ResumeButton.grab_focus()
	else:
		hide()

func _on_resume_button_pressed():
	hide()
	get_tree().paused = false


func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_button_pressed():
	get_tree().quit()
