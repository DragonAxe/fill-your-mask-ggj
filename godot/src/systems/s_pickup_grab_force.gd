class_name PickupGrabForceSystem
extends System

func query():
    return (
        q.with_all([C_Player])
        .with_relationship([Relationship.new(C_Holding.new())])
        .iterate([C_Player])
    )

func process(entities: Array[Entity], components: Array, delta: float):
    for e_player in entities:
        var c_player = components[0][0] as C_Player
        var e_pickup = e_player.get_relationship(Relationship.new(C_Holding.new())).target as Pickup
        var pickup_handle = e_player.get_node(c_player.pickup_handle_path) as Node3D
        var body = e_pickup as RigidBody3D
        var offset = pickup_handle.global_position - body.global_position
        var force = maxf(offset.length_squared() * delta * 100000, 0.0)
        # Damp
        #force = maxf(force - body.linear_velocity.length_squared() * 10000, 0.0)
        body.apply_central_force(offset.normalized() * force)
        body.linear_velocity = body.linear_velocity.normalized() * clampf(body.linear_velocity.length(), 0.0, 0.1)
