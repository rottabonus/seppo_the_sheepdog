extends CharacterBody2D

@export var speed = 400
var direction: Vector2
signal BarkMovement

func _ready():
	pass

func _unhandled_input(event: InputEvent) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if event.is_action_pressed("bark"):
		$AudioStreamPlayer.play()

		var areas = $BarkInfluence.get_overlapping_areas()
		for area in areas:
			if area.has_method("action"):
				area.action()
				velocity = Vector2.ZERO
	
func _process(delta):
	velocity = direction * speed
	
	move_and_collide(velocity * delta)
		
	if velocity.length() > 0:
		if velocity.y > 0:
			$AnimatedSprite2D.play("run_towards")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("run_back")
		else:
			$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		$AnimatedSprite2D.play("idle")
		
				
	var bodies = $BarkInfluence.get_overlapping_bodies()
	for body in bodies:
		if body.has_method("get_herded"):
			body.get_herded()
	
	
func ending_thoughts():
	$Camera2D.zoom.x += 1.5
	$Camera2D.zoom.y += 1.5
	velocity = Vector2()
	speed = 0
	DialogueManager.show_dialogue_balloon(load("res://dialogue/true_ending.dialogue"), "start")
	
