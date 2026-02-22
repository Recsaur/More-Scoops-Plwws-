extends Node2D
const TutBalloon = preload("res://balloon.tscn")
const DayAppear = preload("res://Scenes/day_control.tscn")
const AccBonus = preload("res://AccuracyBonusText.tscn")
const AccPenalty = preload("res://AccuracyPenaltyText.tscn")
@export var dialogue_resource =  preload("res://BeginningDia.dialogue")
@export var dialogue_start: String = "start"
const PrestonShop = preload("res://ShopPreston.tscn")
var finishedtut = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/AnimationPlayer.play("FadeIn")
	await $ColorRect/AnimationPlayer.animation_finished
	await get_tree().create_timer(0.5).timeout
	DialogueManager.dialogue_ended.connect(DiaEnded)
	get_tree().paused = true
	$ClavierMusicSoftJazzPianoMusic233868.process_mode = $ClavierMusicSoftJazzPianoMusic233868.PROCESS_MODE_ALWAYS
	TutDialogue()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func TutDialogue():
	var balloon: Node = TutBalloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	print("gaa")
	balloon.start(dialogue_resource,dialogue_start)

func DiaEnded(_chuunibyo):
	var DayNew = DayAppear.instantiate()
	finishedtut = true
	$CanvasLayer/Pause.show()
	add_child(DayNew)
	$DayTimer.start()
	DayNew.position = Vector2(0,0)
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = false
	$ClavierMusicSoftJazzPianoMusic233868.process_mode = $ClavierMusicSoftJazzPianoMusic233868.PROCESS_MODE_INHERIT
	$Vector.process_mode = $Vector.PROCESS_MODE_INHERIT

func _process(_delta: float) -> void:
	var calc = (float(GameController.ScoopsToCustomersDay)/GameController.NumScoopsLaunchedDay)*100
	GameController.AccuracyDay = "%.2f" % calc
	#print(GameController.AccuracyDay)
	$TimeLeft.text = str("%.0f" % $DayTimer.time_left)
	pass
	
func _on_pause_pressed() -> void:
	#GameController.BGMusicMain = $ClavierMusicSoftJazzPianoMusic233868.get_playback_position()
	#$ClavierMusicSoftJazzPianoMusic233868.stop
	$Blopp.play()
	if get_tree().paused == true and GameController.Preston == false:	
		$CanvasLayer/Control.hide()
		$Kittencatpuppydog88Endingelevator152337.stop()
		get_tree().paused = false
	elif get_tree().paused == false and GameController.Preston == false:
		get_tree().paused = true
		$Kittencatpuppydog88Endingelevator152337.play()
		$CanvasLayer/Control.show()


func _on_day_timer_timeout() -> void:
	var DayNew = DayAppear.instantiate()
	var PrestonNOW = PrestonShop.instantiate()
	var BonusPos = AccBonus.instantiate()
	var PenaltyPos = AccPenalty.instantiate()
	add_child(DayNew)
	DayNew.position = Vector2(0,0)
	#await get_tree().create_timer(1).timeout
	#print()
	#print("Start here")
	#print(GameController.AccuracyDay)
	#print(typeof(GameController.AccuracyDay))
	#print(int(GameController.AccuracyDay))
#	if int(GameController.AccuracyDay) is int:
	if int(GameController.AccuracyDay) > 70:
		print("GOT A BONUS +150")
		GameController.Points += 150
		add_child(BonusPos)
		BonusPos.position = Vector2(429,295)
		
	elif int(GameController.AccuracyDay) < 30:
		print("Nah mate -100")
		GameController.Points -= 100
		add_child(PenaltyPos)
		PenaltyPos.position = Vector2(429,295)
		
	else:
		print("no bonus +nuthin")
#	else:
#		print("U lost like ts much vro",GameController.NumScoopsLaunchedDay*10)
	print("Accuracy reset")
	GameController.AccuracyDay = 0
	GameController.NumScoopsLaunchedDay = 0
	GameController.ScoopsToCustomersDay = 0
	GameController.Preston = true
	await get_tree().create_timer(2.5).timeout
	print("ok do preston")
	add_child(PrestonNOW)
	get_tree().paused = true
	


func _on_clavier_music_soft_jazz_piano_music_233868_finished() -> void:
	$ClavierMusicSoftJazzPianoMusic233868.play()
	pass # Replace with function body.
