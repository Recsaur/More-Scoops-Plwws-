extends Node2D

@onready var wantedpos = $Sprite2D.position.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.scale = Vector2(0.65,0.2)
	$Sprite2D.position.y += 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.position.y = move_toward($Sprite2D.position.y,wantedpos,2)
	$Sprite2D.scale.x = move_toward($Sprite2D.scale.x,0.344,0.05)
	$Sprite2D.scale.y = move_toward($Sprite2D.scale.y,0.344,0.05)
