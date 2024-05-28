extends Node

signal is_paused(next)

func _ready():
	pass
	
	
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		var current_pause = get_tree().paused
		var next_pause = !current_pause
		get_tree().paused = next_pause
		is_paused.emit(next_pause)
