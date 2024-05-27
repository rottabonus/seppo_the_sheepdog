extends Label

func _ready():
	pass

func to_decimal(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func _process(_delta):
	var are_both_stopped = true
	var timers = get_tree().get_nodes_in_group("HerdingTimer")
	for timer in timers:
		if timer.has_method("is_stopped"):
			var is_stopped = timer.is_stopped()
			if !is_stopped:
				self.set_visible(true)
				self.text = str(to_decimal(timer.get_time_left(), 2))
				are_both_stopped = false
	
	if are_both_stopped:
		self.set_visible(false)
