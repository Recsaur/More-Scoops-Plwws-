extends CharacterBody2D

@export var Scoops = 0
const JUMP_VELOCITY = -400.0
const BOUNDARY = 15
var rng = RandomNumberGenerator.new()
var Speed = rng.randf_range(150, 300)
var movement_time_left = rng.randf_range(0.75, 3.5)
var ScoopsNeeded = rng.randi_range(1,3)
var direction = -1



func _ready():
	pass
	
func _physics_process(delta: float) -> void:	
	pass

#func ScoopsCount(_value:int):
	#Scoops += 1
	#print("HIT", self)
	#if Scoops >= ScoopsNeeded:
		#print("DONE")
		#Scoops = 0
		#queue_free()
	#
	
