extends State
class_name SheepBarkMove

@export var sheep: CharacterBody2D
@export var move_speed: = 20.0

var move_direction: Vector2
var move_time: float

func calculate_direction():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1,1)).normalized()
	move_time = 2
	
func enter():
	calculate_direction()

func update(delta: float):
	if move_time > 0:
		move_time -= delta
	
	else:
		Transitioned.emit(self, "SheepIdle")
		if sheep:
			sheep.velocity = Vector2()

func physics_update(delta: float):
	if sheep:
		sheep.velocity = move_direction * move_speed
