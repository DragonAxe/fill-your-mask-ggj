class_name UpdateSocialBatteryIndicatorSystem
extends System

func query():
    # Find all entities that have both transform and velocity
    return q.with_any([C_SocialBattery, C_SocialBatteryIndicator])

func process(entities: Array[Entity], components: Array, delta: float):
    # Process each entity in the array
    for battery_entity in entities:
        if battery_entity.has_component(C_SocialBattery):
            var c_battery = battery_entity.get_component(C_SocialBattery) as C_SocialBattery
            for indicator_entity in entities:
                if indicator_entity.has_component(C_SocialBatteryIndicator):
                    var c_indicator = indicator_entity.get_component(C_SocialBatteryIndicator) as C_SocialBatteryIndicator
                    indicator_entity
