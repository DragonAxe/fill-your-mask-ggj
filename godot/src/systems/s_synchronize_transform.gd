class_name SynchronizeTransformSystem
extends System

func query():
    return q.with_all([C_Transform]).iterate([C_Transform])

func process(entities: Array[Entity], components: Array, _delta: float):
    for entity in entities:
        for component in components[0]:
            var c_transform = component as C_Transform
            if c_transform.synchronized_position:
                var node = entity.get_node(c_transform.synchronized_position) as Node3D
                c_transform.position = node.global_position
