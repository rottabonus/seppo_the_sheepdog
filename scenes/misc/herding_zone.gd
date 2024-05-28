
extends Area2D

@export var goal: int
@export var herding_max: int
@onready var master = get_tree().get_first_node_in_group("Master")
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
		
		if current == goal and not Globals.herding_state.is_first_zone_herded:
			$Zone2.set_deferred('disabled', false)
			$Zone1.set_deferred('disabled', true)
			Globals.herding_state.is_first_zone_herded = true 
			master.shout("half_done")
		elif current == goal:
			$Zone2.set_deferred('disabled', true)
			Globals.herding_state.are_sheep_herded = true
			Globals.herding_state.herding_time = to_decimal(herding_max - $HerdingTimer.get_time_left(), 2)
			$HerdingTimer.stop()
			master.shout("all_done")

func _on_body_exited(body):
	if body.has_method("on_goal_entered"):
		current -= 1


func _on_herding_timer_timeout():
	Globals.herding_state.herding_time = herding_max
