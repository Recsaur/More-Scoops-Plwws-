extends Node2D
@onready var wantedpos = $Sprite2D.position.y
@onready var LandSFX = $AudioStreamPlayer2D
@onready var LandSFX2 = $AudioStreamPlayer2D2
@onready var LandSFX3 =$C
@onready var Spritescoop = $Sprite2D
var PitchAmt = GameController.Consecutive*0.05

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GPUParticles2D.emitting = true
	if GameController.Consecutive > 1:	
		LandSFX.pitch_scale = PitchAmt+1
		LandSFX2.pitch_scale = PitchAmt+1
		LandSFX3.pitch_scale = PitchAmt+1
	#print(PitchAmt+1)
	#print("UPP")
	LandSFX.play()
	LandSFX2.play()
	LandSFX3.play()
	
	
	Spritescoop.scale = Vector2(0.7,0.15)
	Spritescoop.position.y += 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Spritescoop.position.y = move_toward(Spritescoop.position.y,wantedpos,2)
	Spritescoop.scale.x = move_toward(Spritescoop.scale.x,0.344,0.05)
	Spritescoop.scale.y = move_toward(Spritescoop.scale.y,0.344,0.05)
