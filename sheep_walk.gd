extends State
class_name SheepWalk

@export var sheep: CharacterBody2D
@export var move_speed: = 50.0

var move_direction: Vector2
var wander_time: float

func randomize_wander():
	move_direction = Vector2(randf_range(-10, 10), randf_range(-10,10))
	wander_time = randf_range(1, 3)
	
func enter():
	randomize_wander()

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	
	else:
		Transitioned.emit(self, "SheepIdle")
		sheep.velocity = Vector2()

func physics_update(delta: float):
	sheep.velocity = move_direction * move_speed * delta
