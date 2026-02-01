class_name PickupInputProcessingSystem
extends System

var _pickup_key_pressed = false

func _input(_event: InputEvent) -> void:
    if Input.is_action_just_pressed("pickup"):
        _pickup_key_pressed = true

func query():
    return q.with_all([C_Player, C_SwagItem]).iterate([C_Player, C_SwagItem])

func process(entities: Array[Entity], components: Array, _delta: float):
    for e_player in entities:
        if not _pickup_key_pressed:
            return
        _pickup_key_pressed = false
        
        # Drop item
        var c_swag_item = components[1][0] as C_SwagItem
        if c_swag_item.type != C_SwagItem.SwagType.NONE:
            print("Dropped item: ", c_swag_item.type)
            c_swag_item.type = C_SwagItem.SwagType.NONE
            # print("Relationship before? ", e_player.has_relationship(Relationship.new(C_Holding.new())))
            e_player.remove_relationship(Relationship.new(C_Holding.new()))
            # print("Relationship after? ", e_player.has_relationship(Relationship.new(C_Holding.new())))
            return

        var c_player = components[0][0] as C_Player
        var ray = e_player.get_node(c_player.pickup_ray_path) as RayCast3D
        if not ray.is_colliding():
            return
        if not ray.get_collider() is Pickup:
            return
        var e_pickup = ray.get_collider() as Pickup
        e_player.add_relationship(Relationship.new(C_Holding.new(), e_pickup))
        c_swag_item.type = (e_pickup.get_component(C_SwagItem) as C_SwagItem).type
        print("Picked up item: ", c_swag_item.type)
