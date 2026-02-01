class_name BatteryDrainMoodMismatchSystem
extends System

func query():
    return q.with_all([C_SocialBattery, C_Mood, C_Transform]).iterate([C_SocialBattery, C_Mood, C_Transform])

func process(entities: Array[Entity], components: Array, delta: float):
    for entity in entities:
        var c_battery = components[0][0] as C_SocialBattery
        c_battery.amount -= 1.0 * delta
