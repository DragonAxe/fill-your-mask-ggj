class_name BatteryDrainConstantSystem
extends System

func query():
    # Find all entities that have both transform and velocity
    return q.with_all([C_SocialBattery])

func process(entities: Array[Entity], components: Array, delta: float):
    # Process each entity in the array
    for entity in entities:
        var c_battery = entity.get_component(C_SocialBattery) as C_SocialBattery

        c_battery.amount -= 1.0 * delta
