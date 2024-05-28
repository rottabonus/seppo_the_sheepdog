extends CanvasLayer

func _ready():
	hide()

func _on_main_is_paused(next):
	if next:
		show()
	else:
		hide()
