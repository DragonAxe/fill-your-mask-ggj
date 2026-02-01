class_name C_SocialBattery
extends Component

@export var change: float:
    get:
        return _change
    set(value):
        _change = value

@export var amount: float:
    get:
        return _amount
    set(value):
        _amount = clampf(value, 0.0, 100.0)

@export var _change: float = 0.0
@export var _amount: float = 100.0
