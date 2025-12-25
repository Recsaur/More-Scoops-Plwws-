extends Control

@onready var label = $Label
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	EventController.connect("IceCreamLanded", On_IceCreamPointsAdd) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func On_IceCreamPointsAdd(value: int):
	label.text = str(value)
