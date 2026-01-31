class_name BatteryDrainStandStillSystem
extends System

func query():
    return q.with_all([C_Transform, C_Player])

func process(entities: Array[Entity], _components: Array, _delta: float):
    for entity in entities:
        pass
