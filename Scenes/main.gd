extends Node2D
const TutBalloon = preload("res://balloon.tscn")
const DayAppear = preload("res://Scenes/day_control.tscn")
@export var dialogue_resource =  preload("res://BeginningDia.dialogue")
@export var dialogue_start: String = "start"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.dialogue_ended.connect(DiaEnded)
	$ColorRect/AnimationPlayer.play("FadeIn")
	await $ColorRect/AnimationPlayer.animation_finished
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true
	TutDialogue()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func TutDialogue():
	var balloon: Node = TutBalloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	print("gaa")
	balloon.start(dialogue_resource,dialogue_start)

func DiaEnded(_chuunibyo):
	var DayNew = DayAppear.instantiate()
	$CanvasLayer/Pause.show()
	add_child(DayNew)
	DayNew.position = Vector2(0,0)
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = false
	$Vector.process_mode = $Vector.PROCESS_MODE_INHERIT

func _process(_delta: float) -> void:
	pass
	
func _on_pause_pressed() -> void:
	$Blopp.play()
	if get_tree().paused == true:	
		$CanvasLayer/Control.hide()
		$Kittencatpuppydog88Endingelevator152337.stop()
		get_tree().paused = false
	else:
		get_tree().paused = true
		$Kittencatpuppydog88Endingelevator152337.play()
		$CanvasLayer/Control.show()
