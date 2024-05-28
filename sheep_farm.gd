extends Node2D

func _ready():
	$MainMusic.play()
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first.dialogue"), "start")
	
	
func call_seppo():
	$Master/SeppoCaller.play()


func _on_master_call_timer_timeout():
	print("did this happen?")
	call_seppo()
	$CallLoop.start()


func _on_call_loop_timeout():
	print("call again")
	call_seppo()


func _on_audio_stream_player_finished():
	print("play again the music??")
	$MainMusic.play()
