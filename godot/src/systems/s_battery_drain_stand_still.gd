class_name BatteryDrainStandStillSystem
extends System

func query():
    return q.with_all([C_Transform, C_Player, C_SocialBattery]).iterate([C_Transform, C_SocialBattery])

func process(entities: Array[Entity], components: Array, delta: float):
    for entity in entities:
        var c_transform = components[0][0] as C_Transform
        var c_battery = components[1][0] as C_SocialBattery
        if c_transform.get_last_positions()[0] == c_transform.position:
            c_battery.change -= 1.0 * delta
