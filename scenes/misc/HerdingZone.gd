extends Area2D

@export var goal: float
var current: float

func _ready():
	current = 0

func _process(_delta):
	pass

func _on_body_entered(body):
	if body.has_method("on_goal_entered"):
		body.on_goal_entered()
		print("yippikayjee")
		current += 1
		
		if current == goal:
			print("win game should happen!")


func _on_body_exited(body):
	if body.has_method("on_goal_entered"):
		print("sheep left the area")
		current -= 1
