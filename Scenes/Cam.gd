extends Camera2D
@export var RandStrength: float = 5.0 
@export var ShakeFade: float = 5.0
var OffsetAmt: Vector2 = Vector2(0,0)
var rng = RandomNumberGenerator.new()
var ShakeStrength: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("IceCreamLanded", ScreenShake) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if ShakeStrength > 0.0:
		ShakeStrength = lerpf(ShakeStrength,0,ShakeFade*delta)
		
		offset = RandOffset()
		
	
func ScreenShake(value: int):
	ShakeStrength = RandStrength
	
func RandOffset() -> Vector2:
	if GameController.Completion:
		#print(ShakeStrength* GameController.Consecutive)
		GameController.Completion = false
		OffsetAmt = Vector2(rng.randf_range(-ShakeStrength* GameController.Consecutive*2,ShakeStrength* GameController.Consecutive*2),rng.randf_range(-ShakeStrength* GameController.Consecutive*2,ShakeStrength* GameController.Consecutive*2))
		OffsetAmt = OffsetAmt.clamp(Vector2.ZERO,Vector2.ONE*28) #change liek the max max what maximum screenshaking amount
	else:
		OffsetAmt = Vector2(rng.randf_range(-ShakeStrength* GameController.Consecutive,ShakeStrength* GameController.Consecutive),rng.randf_range(-ShakeStrength* GameController.Consecutive,ShakeStrength* GameController.Consecutive))
		OffsetAmt = OffsetAmt.clamp(Vector2.ZERO,Vector2.ONE*25)
		#print(ShakeStrength* GameController.Consecutive)
	
	return OffsetAmt
