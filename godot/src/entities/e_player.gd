@tool
class_name Player
extends Entity

func on_ready():
    # Sync the entity's scene position to the Transform component
    if has_component(C_Transform):
        var c_trs = get_component(C_Transform) as C_Transform
        c_trs.position = self.global_position
    var c_mood = get_component(C_Mood) as C_Mood
    c_mood.type = C_Mood.random_mood()
    print("Assigned mood to player: ", c_mood.type)
    $ESocialBatteryIndicator.add_relationship(Relationship.new(C_Visualizes.new(), self))
