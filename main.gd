extends Node

@export var sheep_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	add_sheeps()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func add_sheeps():
	for x in 5:
		var sheep = sheep_scene.instantiate()
		# Choose a random location on Path2D.
		var sheep_spawn_location = $SheepPath/SheepSpawnLocation
		sheep_spawn_location.progress_ratio = randf()
		# Set the sheep's position to a random location.
		sheep.position = sheep_spawn_location.position
		# Spawn the sheep by adding it to the Main scene.
		add_child(sheep)
