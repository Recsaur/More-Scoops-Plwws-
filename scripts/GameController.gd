extends Node

@export var Points: int = 0

func IceCreamLanded(value:int):
	Points += value
	EventController.emit_signal("IceCreamLanded",Points)
