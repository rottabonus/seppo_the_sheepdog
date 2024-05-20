extends CharacterBody2D

@export var speed = 400
var screen_size
signal BarkMovement

func _ready():
	screen_size = get_viewport_rect().size

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
			if body.name != "Player":
				body.move_from_bark()

	if velocity.length() > 0:
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		$AnimatedSprite2D.play("idle")


func _on_bark_timer_timeout():
	$BarkInfluence/CollisionShape2D.set_disabled(true)
