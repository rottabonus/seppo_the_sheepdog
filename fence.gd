extends StaticBody2D

var fence1 = preload("res://fence1.png")
var fence2 = preload("res://fence2.png")
var fence3 = preload("res://fence3.png")
var fence4 = preload("res://fence4.png")

var fences: Dictionary = {'1': fence1, '2': fence2, '3': fence3, '4': fence4 }

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = randi_range(1, 4)
	var fence = fences[str(rand)]
	print(rand)
	print("hello world")
	$Sprite2D.texture = (fence)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
