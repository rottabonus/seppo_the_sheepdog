extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func play(animation: String):
	$AnimatedSprite2D.play(animation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
