extends CharacterBody2D

@export var speed = 400
signal BarkMovement

func _ready():
	pass

func _process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	
	move_and_collide(velocity * delta)
		
	if Input.is_action_pressed("bark"):
		$AudioStreamPlayer.play()
		$BarkInfluence/CollisionShape2D.set_disabled(false)
		$BarkTimer.start()
		
		var bodies = $BarkInfluence.get_overlapping_bodies()
		for body in bodies:
			if body.has_method("move_from_bark"):
				body.move_from_bark()

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
