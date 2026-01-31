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
            var bar_node = indicator_entity.get_node(comp.bar_node) as Range
            bar_node.value = c_battery.amount
