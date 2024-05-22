extends State
class_name PlayerTalk

	
func enter():
	InputMap.action_erase_events("move_up")
	InputMap.action_erase_events("move_down")
	InputMap.action_erase_events("move_right")
	InputMap.action_erase_events("move_left")

func update(_delta: float):
	pass
