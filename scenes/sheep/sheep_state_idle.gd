extends State
class_name SheepWalk

@export var sheep: RigidBody2D
@export var move_speed: = 10.0

var move_direction: Vector2
var wander_time: float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1, 3)
	
func enter():
	randomize_wander()

func update(delta: float):
	if wander_time > 0:
		wander_time += -delta
	
	else:
		randomize_wander()

func physics_update(delta: float):
	if sheep:
		sheep.velocity - move_direction * move_speed
