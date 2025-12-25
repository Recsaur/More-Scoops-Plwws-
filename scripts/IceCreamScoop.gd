class_name ICP_Vanilla extends RigidBody2D


func _ready():
	pass
	
func _process(delta: float) -> void:
	pass

func launch(force : Vector2) -> void:
	sleeping = false
	freeze = false
	await get_tree().physics_frame
	apply_central_impulse(force*6.75)
	await get_tree().create_timer(5.0).timeout
	queue_free()
	#apply_impulse(Vector2.ZERO, force)
	
