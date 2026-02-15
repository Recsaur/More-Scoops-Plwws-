extends Control

@onready var label = $Label
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass
	#EventController.connect("IceCreamLanded", On_IceCreamPointsAdd) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(GameController.Points)
