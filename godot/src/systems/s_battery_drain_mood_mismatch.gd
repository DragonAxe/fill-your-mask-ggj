class_name BatteryDrainConstantSystem
extends System

func query():
    return q.with_all([C_SocialBattery]).iterate([C_SocialBattery])

func process(entities: Array[Entity], components: Array, delta: float):
    for entity in entities:
        var c_battery = components[0][0] as C_SocialBattery
        c_battery.amount -= 1.0 * delta
