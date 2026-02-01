@tool
class_name Pickup
extends Entity

func on_ready():
    # Sync the entity's scene position to the Transform component
    if has_component(C_Transform):
        var c_trs = get_component(C_Transform) as C_Transform
        c_trs.position = self.global_position
