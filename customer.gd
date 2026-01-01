extends CharacterBody2D

var rng = RandomNumberGenerator.new()
@onready var Start = $"../Start"
@onready var Limit = $"../Limit"
const BOUNDARY = 15
var movement_time_left = rng.randf_range(1, 3.5)
var ScoopsNeeded = rng.randi_range(1,3)
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var direction = -1
@export var Scoops = 0


func _ready():
	position = Start.position
	
func _physics_process(delta: float) -> void:	
	if movement_time_left > 0:
		var motion = Vector2.LEFT * SPEED * delta
		move_and_collide(motion)
		movement_time_left -= delta

	move_and_slide()

#func ScoopsCount(_value:int):
	#Scoops += 1
	#print("HIT", self)
	#if Scoops >= ScoopsNeeded:
		#print("DONE")
		#Scoops = 0
		#queue_free()
	#
	
