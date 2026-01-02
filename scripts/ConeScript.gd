class_name BaseCone extends Area2D

@export var Value: int = 1
var Scoops = 0
const ICECREAM = preload("res://OnConeScoop.tscn")
#Heyyyyyooo ts can be made so like, have a check for the flavors, and maybe
#even do somethign like if the cone is like chocolate or golden the value is more
#when passed
var rng = RandomNumberGenerator.new()
var ScoopsNeeded = rng.randi_range(1,5)
func _ready() -> void:
	$"../../Label".text = str(ScoopsNeeded)
		
func _on_body_entered(body: Node2D) -> void:
	if body is ICP_Vanilla and body.has_method("MyScoop"):
		
		if body.MyScoop():
			GameController.IceCreamLanded(Value)
			#self.queue_free() #add back when you want to stop em from getting
							   #more points, for now I js did liek so testing
			
			#this section makes it so that the cone disappears okayayr
			#await get_tree().create_timer(3.0).timeout
			#$"..".queue_free()
			Scoops += 1
			GameController.ScoopsToCustomers += 1
			$".".position.y -= 100
			var IceCreamNew = ICECREAM.instantiate()
			var parent = get_parent()
			if parent:
				parent.add_child(IceCreamNew)
				IceCreamNew.global_position = global_position
			
			
			#print("HIT", self)
			if Scoops >= ScoopsNeeded:
				GameController.CustomersServed += 1
				#print("DONE")
				Scoops = 0
				get_parent().get_parent().queue_free()
				queue_free()
		else:
			pass
			#print("Naw not mine")
			
		
	
