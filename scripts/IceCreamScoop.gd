class_name ICP_Vanilla extends RigidBody2D

var Claimed = false
const SPLAT = preload("res://Scenes/splat.tscn")

func _ready():
	pass
	
func _process(delta: float) -> void:
	pass

func launch(force : Vector2) -> void:	
	GameController.NumScoopsLaunched += 1
	GameController.NumScoopsLaunchedDay += 1
	print(GameController.Consecutive)
	print("Scoops Launched: ",GameController.NumScoopsLaunched)
	print("Scoops To Customers: ",GameController.ScoopsToCustomers)
	print("Customers Served: ", GameController.CustomersServed)
	if GameController.NumScoopsLaunched > 0 and GameController.ScoopsToCustomers > 0:
		print("Accuracy: ",(float(GameController.ScoopsToCustomers)/GameController.NumScoopsLaunched)*100,"%")
	print()
	sleeping = false
	freeze = false
	await get_tree().physics_frame
	#apply_central_impulse(force*6.75)
	apply_central_impulse(force*7)
	await get_tree().create_timer(10.0).timeout
	var IceCreamNew = SPLAT.instantiate()
	var parent = get_parent()
	if parent:
		parent.add_child(IceCreamNew)
		IceCreamNew.global_position = global_position
	GameController.ICS_Rotation = linear_velocity.angle()
	queue_free()
	#apply_impulse(Vector2.ZERO, force)
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is BaseCone or area is TestCone:
		#print("ITS HERE",area)
		set_deferred("monitoring", false)
		GameController.Consecutive += 1
		queue_free()


func _on_body_entered(body: Node) -> void:
	var SplatNew = SPLAT.instantiate()
	var parent = get_parent()
	if parent:
		parent.add_child(SplatNew)
		SplatNew.global_position = global_position
	GameController.ICS_Rotation = linear_velocity.angle()
	GameController.Consecutive = 0
	GameController.ConsecutiveOrder = 0
	print("AWWW RESET LOL")
	#print("Lost", GameController.Consecutive)
	queue_free()

func  _physics_process(delta: float) -> void:
	$Sprite2D.rotation = linear_velocity.angle()
	#print(linear_velocity.angle())

func MyScoop():
	if Claimed:
		return false
	Claimed = true
	return true
		
	
