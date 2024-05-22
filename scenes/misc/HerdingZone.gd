extends Area2D

@export var goal: float
@export var herding_max = 60
var current: float

func _ready():
	current = 0

func _process(_delta):
	pass
	
func start_herding():
	$CollisionShape2D.set_disabled(false)
	$HerdingTimer.start()
	$ColorRect.set_visible(true)

func _on_body_entered(body):
	if body.has_method("on_goal_entered"):
		body.on_goal_entered()
		current += 1
		
		if current == goal:
			Globals.are_sheep_herded = true
			Globals.herding_time = herding_max - $HerdingTimer.get_time_left()
			$HerdingTimer.stop()

func _on_body_exited(body):
	if body.has_method("on_goal_entered"):
		current -= 1


func _on_herding_timer_timeout():
	Globals.herding_time = 60
