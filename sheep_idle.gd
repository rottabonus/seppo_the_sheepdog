extends State
class_name SheepIdle

var idle_time: float

func randomize_idle():
	idle_time = randf_range(2, 9)
	
func enter():
	randomize_idle()

func update(delta: float):
	if idle_time > 0:
		idle_time -= delta
	
	else:
		Transitioned.emit(self, "SheepWalk")
