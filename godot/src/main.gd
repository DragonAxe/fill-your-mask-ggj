extends Node

@onready var world: World = $World

func _ready():
    ECS.world = world

    # Load and instantiate the player entity scene
    var player_scene = preload("res://scenes/e_player.tscn")  # Adjust path as needed
    var e_player = player_scene.instantiate() as Player

    # Add components to the entity
    e_player.add_components([])

    add_child(e_player)  # Add to scene tree
    ECS.world.add_entity(e_player)  # Add to ECS world

    ECS.world.add_system(ConstantBatteryDrainSystem.new())
    ECS.world.add_system(EndGameEmptyBatterySystem.new())

func _process(delta):
    # Process all systems
    if ECS.world:
        ECS.process(delta)
