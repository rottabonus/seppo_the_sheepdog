extends Control


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/ui/start_menu.tscn")
