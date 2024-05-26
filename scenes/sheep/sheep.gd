extends CharacterBody2D
class_name Sheep

var move_direction: Vector2
var speed = 80

func _ready():
	pass

func _physics_process(delta):
	if move_direction.length() > 0:
		velocity = move_direction * speed * delta
	
	move_and_collide(velocity * delta)
	
	if velocity.length() > 0:		
		if velocity.y < 0:
			$AnimatedSprite2D.play("back_walk")
		elif velocity.y == 0:
			$AnimatedSprite2D.play("side_walk")
			$AnimatedSprite2D.flip_h = velocity.x < 0
		else: 
			$AnimatedSprite2D.play("front_walk")
	else: 
		$AnimatedSprite2D.play("idle")

func get_herded():
	$StateMachine.change_state("SheepGetHerded")

func on_goal_entered():
	print("i was herded!")
	# play a cool sound to make player happy

func _on_sheep_collision_area_body_exited(body):
	if body.name == "Player":
		$StateMachine.change_state("Idle")
		move_direction = Vector2()
