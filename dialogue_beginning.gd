extends Control
var tween = create_tween()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.visible_ratio = 0
	tween.tween_property($Label2,"visible_ratio",1,7.5)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("NextDia") or Input.is_action_just_pressed("ui_touch"):
		$Label2.visible_ratio = 1
		tween.kill()
		print("yoo u pressed")
	pass
