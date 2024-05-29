extends Node

signal is_paused(next)

func _ready():
	Globals.has_player_talked_to_master = false
	Globals.herding_state = {
			"is_first_zone_herded": false,
			"are_sheep_herded": false,
			"herding_time": 0
	}
	$SheepFarm/MainMusic.play()
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)
	DialogueManager.show_dialogue_balloon(load("res://dialogue/first.dialogue"), "start")

	
	
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		var current_pause = get_tree().paused
		var next_pause = !current_pause
		get_tree().paused = next_pause
		is_paused.emit(next_pause)


func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	if(resource.resource_path == 'res://dialogue/true_ending.dialogue'):
		get_tree().change_scene_to_file("res://scenes/ui/credits.tscn")
