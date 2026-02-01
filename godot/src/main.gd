extends Node

@onready var world: World = $World

func _ready():
	ECS.world = world

func _process(delta):
	# Process all systems
	if ECS.world:
		#ECS.process(delta)
		ECS.process(delta, "first")
		ECS.process(delta, "update")
		ECS.process(delta, "last")
