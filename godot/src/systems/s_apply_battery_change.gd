class_name ApplyBatteryChangeSystem
extends System

func query():
	return q.with_all([C_SocialBattery]).iterate([C_SocialBattery])

func process(entities: Array[Entity], components: Array, _delta: float):
	for entity in entities:
		var c_battery = components[0][0] as C_SocialBattery
		c_battery.amount += c_battery.change
		c_battery.change = 0.0
