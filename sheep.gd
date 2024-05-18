extends CharacterBody2D
class_name Sheep

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	
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
