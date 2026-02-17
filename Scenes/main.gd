extends Node2D
const TutBalloon = preload("res://balloon.tscn")
const DayAppear = preload("res://Scenes/day_control.tscn")
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
	add_child(DayNew)
	DayNew.position = Vector2(0,0)
	await get_tree().create_timer(3).timeout
	GameController.Preston = true
	print("ok do preston")
	add_child(PrestonNOW)
	get_tree().paused = true
	
