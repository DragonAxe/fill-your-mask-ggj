extends Node

@onready var world: World = $World

func _ready():
    ECS.world = world

    # Load and instantiate the player entity scene
    var player_scene = preload("res://scenes/e_player.tscn")  # Adjust path as needed
    var e_player = player_scene.instantiate() as Player
    add_child(e_player)
    ECS.world.add_entity(e_player)

    var social_battery_indicator_scene = preload("res://scenes/e_social_battery_indicator.tscn")
    var e_social_battery_indicator = social_battery_indicator_scene.instantiate() as SocialBatteryIndicator
    add_child(e_social_battery_indicator)
    ECS.world.add_entity(e_social_battery_indicator)

    #ECS.world.add_system(ConstantBatteryDrainSystem.new())
    #ECS.world.add_system(EndGameEmptyBatterySystem.new())
    #ECS.world.add_system(UpdateSocialBatteryIndicatorSystem.new())

func _process(delta):
    # Process all systems
    if ECS.world:
        #ECS.process(delta)
        ECS.process(delta, "first")
        ECS.process(delta, "update")
        ECS.process(delta, "last")
