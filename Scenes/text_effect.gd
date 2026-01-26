extends Control

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(label,"position",Vector2(label.position.x,label.position.y-50),0.25)
	tween.tween_property(label,"modulate:a",0.0,0.5)
	label.text = str(GameController.ConsecutiveOrder,"x")
	await get_tree().create_timer(1.0).timeout
	self.queue_free()
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
