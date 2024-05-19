extends CharacterBody2D

@export var speed = 400
var screen_size
signal BarkMovement

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if Input.is_action_pressed("bark"):
		$AudioStreamPlayer.play()
		$BarkInfluence/CollisionShape2D.set_disabled(false)
		$BarkTimer.start()
		
		var bodies = $BarkInfluence.get_overlapping_bodies()
		for body in bodies:
			if body.name != "Player":
				body.move_from_bark()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		$AnimatedSprite2D.play("idle")
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_bark_timer_timeout():
	$BarkInfluence/CollisionShape2D.set_disabled(true)
