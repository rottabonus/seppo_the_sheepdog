extends Node

signal is_paused(next)

func _ready():
	Globals.has_player_talked_to_master = false
	Globals.herding_state = {
			"is_first_zone_herded": false,
			"are_sheep_herded": false,
			"herding_time": 0
	}
	
	
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		var current_pause = get_tree().paused
		var next_pause = !current_pause
		get_tree().paused = next_pause
		is_paused.emit(next_pause)
