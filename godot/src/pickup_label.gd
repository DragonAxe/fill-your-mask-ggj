extends PanelContainer

func _process(delta: float) -> void:
	var ray = %PickupRay as RayCast3D
	self.visible = ray.is_colliding() and ray.get_collider() is Pickup
