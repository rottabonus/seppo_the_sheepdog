extends Area2D

func throw() -> void:
	var tween = create_tween().set_parallel(true)
	tween.chain().tween_interval(1.1)
	tween.chain().tween_property(self, "position", Vector2(-11, -2), 0.15)
	tween.chain().tween_property(self, "position", Vector2(-14, -7), 0.26)
	tween.chain().tween_property(self, "position", Vector2(-8, -16), 0.26)
	tween.parallel().tween_property(self, "rotation_degrees", 90, 0.26)
	tween.chain().tween_property(self, "position", Vector2(-80, 10), 0.2)
	tween.parallel().tween_property(self, "rotation_degrees", 90, 0.2)
	tween.chain().tween_property(self, "position", Vector2(-120, 40), 0.2)
	tween.parallel().tween_property(self, "rotation_degrees", 180, 0.2)
	
	$CollisionShape2D.set_disabled(false)


func _on_body_entered(body):
	if body.has_method("ending_thoughts"):
		body.ending_thoughts()
