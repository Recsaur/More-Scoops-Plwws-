extends Node2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var LaunchPitch
	LaunchPitch = rng.randf_range(1, 1.2)
	$Splay.pitch_scale = LaunchPitch
	$Splay.play()
	
	rotation = GameController.ICS_Rotation
	await get_tree().create_timer(3.0).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
