extends Node2D

var master_caller: AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	$MainMusic.play()
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first.dialogue"), "start")
	#master_caller = AudioStreamPlayer.new()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if Globals.has_player_talked_to_master == true:
		#master_caller.stop()
		pass

func call_seppo():
	var audio_stream_array = [load("res://sound/seppo1.wav"), load("res://sound/seppo2.wav"), load("res://sound/seppo3.wav")]
	randomize()
	var clip_to_play = audio_stream_array[randi() % audio_stream_array.size()]
	master_caller.set_stream(clip_to_play)
	master_caller.play()

func _on_master_call_timer_timeout():
	print("did this happen?")
	#call_seppo()
	$CallLoop.start()


func _on_call_loop_timeout():
	print("call again")
	#call_seppo()


func _on_audio_stream_player_finished():
	$MainMusic.play()
