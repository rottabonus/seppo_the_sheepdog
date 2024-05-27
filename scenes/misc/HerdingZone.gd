
extends Area2D

@export var goal: int
@export var herding_max: int
var current: int

func _ready():
	current = 0

func _process(_delta):
	pass
	
func start_herding():
	$Zone1.set_disabled(false)
	$HerdingTimer.start()

func _on_body_entered(body):
	if body.has_method("on_goal_entered"):
		body.on_goal_entered()
		current += 1
		
		if current == goal and not Globals.herding_state.is_first_zone_herded:
			$Zone2.set_deferred('disabled', false)
			$Zone1.set_deferred('disabled', true)
			Globals.herding_state.is_first_zone_herded = true
			current = 0
			print("todo: Add a shout audio to indicate player that they can move forward")
		elif current == goal:
			$Zone2.set_deferred('disabled', true)
			Globals.herding_state.are_sheep_herded = true
			Globals.herding_state.herding_time = herding_max - $HerdingTimer.get_time_left()
			$HerdingTimer.stop()

func _on_body_exited(body):
	if body.has_method("on_goal_entered"):
		current -= 1


func _on_herding_timer_timeout():
	print("ended")
	Globals.herding_state.herding_time = herding_max
