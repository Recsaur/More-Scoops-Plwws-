extends Node

@export var Points: int = 0


var Consecutive = 0
var ConsecutiveOrder = 0
var Completion = false

var TEy = 0
var TEx = 0


var CODC_done = false
var ICS_Rotation = 1
#EVERYTHING TO CALC STATISTICS HERE
var NumScoopsLaunched = 0 #Number of scoops launched
var CustomersServed = 0 #Number of Customers served
var ScoopsToCustomers = 0 #Number of scoops that got to custoemrs (dont show to players)
var Accuracy = 0 #Accuracy gotten by dividing number of scoops launched by scoops that got to customers
@onready var ticked = GameController.ConsecutiveOrder -1
#Money earned
#add in stats for different flavors

func _process(delta: float) -> void:
	while true:
		await get_tree().create_timer(5.0).timeout
		#print("0")

func IceCreamLanded(value:int):
	Points += value
	EventController.emit_signal("IceCreamLanded",Points)
