# idle_state.gd

extends State

class_name IdleState

func _ready():
	animated_sprite.play("idle")
