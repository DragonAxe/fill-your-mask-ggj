class_name C_Transform
extends Component

@export var synchronized_position: NodePath

@export var position: Vector3:
    get:
        return _position
    set(value):
        print(value)
        _push_history(_position)
        _position = value

var _position: Vector3 = Vector3.ZERO
var _last_positions: Array[Vector3] = [Vector3.ZERO, Vector3.ZERO, Vector3.ZERO]

func _push_history(pos: Vector3) -> void:
    # Ignore initial ZERO if you don't want it recorded before first change
    if _last_positions.size() == 0 and pos == Vector3.ZERO:
        return

    _last_positions.push_front(pos)
    if _last_positions.size() > 3:
        _last_positions.pop_back()

func get_last_positions() -> Array[Vector3]:
    return _last_positions.duplicate()
