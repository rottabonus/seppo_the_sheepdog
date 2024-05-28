extends StaticBody2D

var state_reason: String


func play(animation: String):
	$AnimatedSprite2D.play(animation)
	if animation == "throw":
		$Bone.throw()
		
	
func shout(reason: String):
	$ShoutTimer.start()
	state_reason = reason


func _on_shout_timer_timeout():
	$ShoutTimer.stop()
	if(state_reason == "half_done"):
		$HalfDoneShout.play()
	else:
		$AllDoneShout.play()
