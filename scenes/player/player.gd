extends CharacterBody2D

@export var speed = 400
var direction: Vector2
signal BarkMovement

func _ready():
	pass

func _unhandled_input(_event: InputEvent) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if Input.is_action_pressed("bark"):
		$AudioStreamPlayer.play()
		$BarkInfluence/CollisionShape2D.set_disabled(false)
		$BarkTimer.start()
		
		var bodies = $BarkInfluence.get_overlapping_bodies()
		for body in bodies:
			if body.has_method("move_from_bark"):
				body.move_from_bark()
				
		var areas = $BarkInfluence.get_overlapping_areas()
		for area in areas:
			if area.has_method("action"):
				area.action()
	
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


func _on_bark_timer_timeout():
	$BarkInfluence/CollisionShape2D.set_disabled(true)
	
	
func ending_thoughts():
	$Camera2D.zoom.x += 1.5
	$Camera2D.zoom.y += 1.5
	velocity = Vector2()
	speed = 0
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/final_thoughts.dialogue"), "start")
	
