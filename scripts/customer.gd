extends CharacterBody2D


@onready var Start = $"../Start"
@onready var Limit = $"../Limit"
@export var Scoops = 0
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const BOUNDARY = 15
var rng = RandomNumberGenerator.new()
var movement_time_left = rng.randf_range(0.75, 3.5)
var ScoopsNeeded = rng.randi_range(1,3)
var direction = -1



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
	
