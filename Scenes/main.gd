extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_pressed() -> void:
	if get_tree().paused == true:	
		get_tree().paused = false
	else:
		get_tree().paused = true
	
