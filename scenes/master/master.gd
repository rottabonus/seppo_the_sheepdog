extends StaticBody2D


func _ready():
	pass


func play(animation: String):
	$AnimatedSprite2D.play(animation)
	if animation == "throw":
		$Bone.throw()


func _process(_delta):
	pass
