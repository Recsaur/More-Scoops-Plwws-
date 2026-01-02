extends Node

@export var Points: int = 0

#EVERYTHING TO CALC STATISTICS HERE
var NumScoopsLaunched = 0 #Number of scoops launched
var CustomersServed = 0 #Number of Customers served
var ScoopsToCustomers = 0 #Number of scoops that got to custoemrs (dont show to players)
var Accuracy = 0 #Accuracy gotten by dividing number of scoops launched by scoops that got to customers
#Money earned
#add in stats for different flavors


func IceCreamLanded(value:int):
	Points += value
	EventController.emit_signal("IceCreamLanded",Points)
