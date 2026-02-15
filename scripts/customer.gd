extends CharacterBody2D


@onready var Start = $"../Start"
@onready var Limit = $"../Limit"
@export var Scoops = 0
@onready var TimerLabel = $Label2 
const JUMP_VELOCITY = -400.0
const BOUNDARY = 15
var rng = RandomNumberGenerator.new()
var Speed = rng.randf_range(150, 300)
var movement_time_left = rng.randf_range(0.75, 3.5)
var ScoopsNeeded = rng.randi_range(1,3)
var direction = -1
var flag = 0


func _ready():
	$Timer.wait_time = 15 + GameController.CustTimeInc
	$Timer.start()
	position = Start.position
	
	
func _physics_process(delta: float) -> void:	
	TimerLabel.text = str("%.1f" % $Timer.time_left)
	if $Timer.is_stopped():
		hide()
		if flag == 0:
			flag +=1
			$Gone.play()
		await get_tree().create_timer(1.0).timeout
		print("GBSHBHFDBSFISDBIFUENIFWENI")
		queue_free()

	if Speed >250 and movement_time_left >2.75:
		print("TOO FAST")
		print("Speed is: ", Speed)
		print("Time Move is:", movement_time_left)
		movement_time_left = rng.randf_range(1.75,2)
		print("New:", movement_time_left)
	if movement_time_left > 0:
		var motion = Vector2.LEFT * Speed * delta
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
	


func _on_timer_timeout() -> void:
	GameController.Points -= GameController.CustLossPenalty
	pass # Replace with function body.
