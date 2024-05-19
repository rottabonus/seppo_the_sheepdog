extends State
class_name SheepBarkMove

@export var sheep: CharacterBody2D
@export var move_speed: = 20.0

var move_direction: Vector2
var move_time: float
var player: CharacterBody2D

func calculate_direction():
		move_time = 2
		player = get_tree().get_first_node_in_group("Player")
		if player:
			var difference = sheep.position - player.position
			move_direction = difference
			#print("sheep.global_position: ", sheep.global_position)
			#print("sheep.position: ", sheep.position)
			#print("player.global_position: ", player.global_position)
			#print("player.position: ", player.position)
			#print("difference ", sheep.position - player.position)
			#print("direction ", direction)
			#print("move_direction (barkmove): ", move_direction)
			
	
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
		sheep.velocity = move_direction
