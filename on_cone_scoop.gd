extends Node2D
@onready var wantedpos = $Sprite2D.position.y
@onready var LandSFX = $AudioStreamPlayer2D
@onready var LandSFX2 = $AudioStreamPlayer2D2
@onready var LandSFX3 =$C
var PitchAmt = GameController.Consecutive*0.05

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameController.Consecutive > 1:	
		LandSFX.pitch_scale = PitchAmt+1
		LandSFX2.pitch_scale = PitchAmt+1
		LandSFX3.pitch_scale = PitchAmt+1
	#print(PitchAmt+1)
	#print("UPP")
	LandSFX.play()
	LandSFX2.play()
	LandSFX3.play()
	
	
	$Sprite2D.scale = Vector2(0.65,0.2)
	$Sprite2D.position.y += 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.position.y = move_toward($Sprite2D.position.y,wantedpos,2)
	$Sprite2D.scale.x = move_toward($Sprite2D.scale.x,0.344,0.05)
	$Sprite2D.scale.y = move_toward($Sprite2D.scale.y,0.344,0.05)
