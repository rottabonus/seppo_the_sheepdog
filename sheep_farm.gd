extends Node2D

func _ready():
	$MainMusic.play()
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first.dialogue"), "start")
	
	
func call_seppo():
	$Master/SeppoCaller.play()


func _on_call_loop_timeout():
	$CallLoop.set_wait_time(5)
	$CallLoop.start()
	call_seppo()


func _on_main_music_finished():
	$MainMusic.play()
