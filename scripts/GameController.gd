extends Node

@export var Points: int = 0

var DayCounter = 1
var Consecutive = 0
var ConsecutiveOrder = 0
var Completion = false
var TEy = 0
var TEx = 0
var DayPosY
var Preston = false
var BGMusicMain = 0


var Card1flipped = false
var Card2flipped = false

var CustLossPenalty = 100
var CustTimeInc = 0
var OrderFinBonus = 50


var CODC_done = false
var ICS_Rotation = 1
#EVERYTHING TO CALC STATISTICS HERE
var NumScoopsLaunched = 0 #Number of scoops launched
var CustomersServed = 0 #Number of Customers served
var ScoopsToCustomers = 0 #Number of scoops that got to custoemrs (dont show to players)
var Accuracy = 0 #Accuracy gotten by dividing number of sgot to customerscoops launched by scoops that 
var BonusAcc = 150
var PenaltyAcc = 100
var AccuracyDay = 0
var ScoopsToCustomersDay = 0
var NumScoopsLaunchedDay = 0
@onready var ticked = GameController.ConsecutiveOrder -1
#Money earned
#add in stats for different flavors

func _ready() -> void:
	#pass
	EventController.connect("IceCreamLanded", PointsFunc)

func PointsFunc(value: int):
	Points = value
	
func NextDia():
	var DiaAudio = AudioStreamPlayer2D.new()
	DiaAudio.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(DiaAudio)
	DiaAudio.stream = load("res://audio/blop.wav")
	DiaAudio.play()
	DiaAudio.finished.connect(DiaAudio.queue_free)

func ShopDing():
	var ShopAudio = AudioStreamPlayer2D.new()
	ShopAudio.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(ShopAudio)
	ShopAudio.stream = load("res://audio/freesound_community-cash-register-purchase-87313.mp3")
	ShopAudio.play()
	ShopAudio.finished.connect(ShopAudio.queue_free)

func Error():
	var NotEnough = AudioStreamPlayer2D.new()
	NotEnough.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(NotEnough)
	NotEnough.stream = load("res://audio/Insufficient.wav")
	NotEnough.play()
	NotEnough.finished.connect(NotEnough.queue_free)

func _process(delta: float) -> void:
	#print(Points)
	while true:
		await get_tree().create_timer(5.0).timeout
		#print("0")

func IceCreamLanded(value:int):
	Points += value
	EventController.emit_signal("IceCreamLanded",Points)
