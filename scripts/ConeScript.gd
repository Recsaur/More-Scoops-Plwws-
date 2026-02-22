class_name BaseCone extends Area2D

@onready var Ding = $"../AudioStreamPlayer2D"
@onready var CODCTimer = get_tree().current_scene.get_node("ConsecutiveOrder")
@export var Value: int = 10

var Scoops = 0
var ComboAdd = 0
const ICECREAM = preload("res://OnConeScoop.tscn")
const TEXTEFFECT = preload("res://Scenes/TextEffect.tscn")
#Heyyyyyooo ts can be made so like, have a check for the flavors, and maybe
#even do somethign like if the cone is like chocolate or golden the value is more
#when passed
var rng = RandomNumberGenerator.new()
var ScoopsNeeded = rng.randi_range(1,3)

func _ready() -> void:
	add_to_group("audio_controllers")
	var CUSTParent = get_parent().get_parent()
	if CUSTParent.name == "Customer":
		print("Found as Customer")
		ScoopsNeeded = rng.randi_range(1,3)
	elif CUSTParent is Jason :
		print("Found as Jason")
		ScoopsNeeded = rng.randi_range(3,6)
	$"../../Label".text = str(ScoopsNeeded)
	print("THIS GUY NEEDS", ScoopsNeeded, CUSTParent.name)
	
	
	#var VectorNode = get_tree().current_scene.find_child("Vector",true)
	#if VectorNode:
	#	print(VectorNode.name)
	
func _on_body_entered(body: Node2D) -> void:
	if body is ICP_Vanilla and body.has_method("MyScoop"):
		
		if body.MyScoop():
			ComboAdd = GameController.ConsecutiveOrder+1
			GameController.IceCreamLanded(Value*ComboAdd)
			#self.queue_free() #add back when you want to stop em from getting
							   #more points, for now I js did liek so testing
			
			#this section makes it so that the cone disappears okayayr
			#await get_tree().create_timer(3.0).timeout
			#$"..".queue_free()
			Scoops += 1
			GameController.ScoopsToCustomers += 1
			GameController.ScoopsToCustomersDay += 1
			$".".position.y -= 100
			var IceCreamNew = ICECREAM.instantiate()
			var parent = get_parent()
			if parent:
				parent.add_child(IceCreamNew)
				IceCreamNew.global_position = Vector2(global_position.x,global_position.y+15)
			
			
			#var TextEffect = TEXTEFFECT.instantiate()
			#var TEparent = get_parent()
			#print("TS THE PARENT",TEparent)
			#if TEparent:
				#parent.add_child(TextEffect)
				#TextEffect.global_position = Vector2(global_position.x,global_position.y+80)
			
			
			#print("HIT", self)
			if Scoops >= ScoopsNeeded:
				GameController.TEx = global_position.x
				GameController.TEy = global_position.y+15
				PitchCalc()
				#if GameController.ConsecutiveOrder > 1: 
					#Ding.pitch_scale = rng.randf_range((GameController.ConsecutiveOrder*0.15)+0.9,(GameController.ConsecutiveOrder*0.15)+1.1)
				#Ding.play()
				GameController.CustomersServed += 1
				GameController.ConsecutiveOrder += 1
				GameController.CODC_done = true
				CODCTimer.start()
				print("DONE")
				GameController.Completion = true
				Scoops = 0
				#await get_tree().create_timer(3.0).timeout
				
				GameController.Points += GameController.OrderFinBonus
				
				get_parent().get_parent().queue_free()
				queue_free()
		else:
			pass
			#print("Naw not mine")
			
		

func PitchCalc():
	var Pitch: float = 0
	var val1 = (GameController.ConsecutiveOrder*0.15)
	#if GameController.ConsecutiveOrder > 1: 
		
	Pitch = rng.randf_range(val1+0.95, val1+1.05)
	get_tree().call_group("audio_controllers", "AudioPlayDone", Pitch)
