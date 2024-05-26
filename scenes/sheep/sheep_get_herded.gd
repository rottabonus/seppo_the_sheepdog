extends State
class_name SheepGetHerded

@export var sheep: CharacterBody2D
@export var move_speed: = 80.0

var move_direction: Vector2
var move_time: float
var player: CharacterBody2D

func calculate_direction():
		move_time = 2
		player = get_tree().get_first_node_in_group("Player")
		move_direction = Vector2()
		if player:
			move_direction = sheep.global_position - player.global_position
			
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
	sheep.velocity = move_direction * move_speed * delta
