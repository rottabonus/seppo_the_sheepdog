
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
	
func to_decimal(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func _on_body_entered(body):
	if body.has_method("on_goal_entered"):
		body.on_goal_entered()
		current += 1
		print("current", current)
		
		if current == goal and not Globals.herding_state.is_first_zone_herded:
			$Zone2.set_deferred('disabled', false)
			$Zone1.set_deferred('disabled', true)
			Globals.herding_state.is_first_zone_herded = true 
			print("todo: Add a shout audio to indicate player that they can move forward")
		elif current == goal:
			print("second stage done")
			$Zone2.set_deferred('disabled', true)
			Globals.herding_state.are_sheep_herded = true 
			Globals.herding_state.herding_time = to_decimal(herding_max - $HerdingTimer.get_time_left(), 2)
			$HerdingTimer.stop()

func _on_body_exited(body):
	if body.has_method("on_goal_entered"):
		current -= 1


func _on_herding_timer_timeout():
	print("ended")
	Globals.herding_state.herding_time = herding_max
