class_name BatteryDrainMoodMismatchSystem
extends System

@onready var group_query = q.with_all([C_Group, C_Transform, C_Mood])

func query():
    return q.with_all([C_SocialBattery, C_Mood, C_Transform, C_Player]).iterate([C_SocialBattery, C_Mood, C_Transform])

func process(entities: Array[Entity], components: Array, delta: float):
    var group_entities = group_query.execute()

    for player_entity: Player in entities:
        var player_social_battery = components[0][0] as C_SocialBattery
        var player_mood = components[1][0] as C_Mood
        var player_transform = components[2][0] as C_Transform
        
        for group_entity: Group in group_entities:
            var group_mood = group_entity.get_component(C_Mood) as C_Mood
            var group_transform = group_entity.get_component(C_Transform) as C_Transform
            
            var distance = (group_transform.position - player_transform.position).length()
            var proximity = maxf(4 - distance, 0.0)
            
            if player_mood.type == group_mood.type:
                player_social_battery.change += clampf(2.0 * proximity * delta, 0.0, 0.03)
            else:
                player_social_battery.change -= clampf(1.0 * proximity * delta, 0.0, 0.02)
