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


func _on_texture_button_pressed():
	var current_mute = AudioServer.is_bus_mute(0)
	AudioServer.set_bus_mute(0, !current_mute)


func _on_icon_en_pressed():
	TranslationServer.set_locale("en")

func _on_icon_fi_pressed():
	TranslationServer.set_locale("fi")
