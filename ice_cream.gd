extends RigidBody2D


func _ready():
	self.physics_material_override.set_bounce(5)
	self.physics_material_override.set_friction(5)

func launch(force : Vector2) -> void:
	apply_impulse(Vector2.ZERO, force)
