class_name UpdateSocialBatteryIndicatorSystem
extends System

func query():
    return q.with_relationship([Relationship.new(C_Visualizes.new(), Player)]).with_all([C_SocialBatteryIndicator])

func process(entities: Array[Entity], _components: Array, _delta: float):
    for indicator_entity in entities:
        var comp = indicator_entity.get_component(C_SocialBatteryIndicator) as C_SocialBatteryIndicator
        var rel = indicator_entity.get_relationship(Relationship.new(C_Visualizes.new()))
        var ents_with_c_socialbattery = ECS.world.query.with_all([C_SocialBattery]).matches([rel.target])
        
        for player_entity in ents_with_c_socialbattery:
            var c_battery = player_entity.get_component(C_SocialBattery) as C_SocialBattery
            var battery_bar_node = indicator_entity.get_node(comp.battery_bar_path) as Range
            var stress_bar_up_node = indicator_entity.get_node(comp.stress_bar_up_path) as Range
            var stress_bar_down_node = indicator_entity.get_node(comp.stress_bar_down_path) as Range
            battery_bar_node.value = c_battery.amount
            stress_bar_up_node.value = lerpf(stress_bar_up_node.value, maxf(c_battery.change, 0.0) * 1000.0, 0.05)
            stress_bar_down_node.value = lerpf(stress_bar_down_node.value, maxf(-c_battery.change, 0.0) * 1000.0, 0.05)
