extends Area2D


@export var maximum_length := 200
const BALL = preload("res://ball.tscn")
var touch_down := false
var position_start := Vector2.ZERO
var position_end := Vector2.ZERO

var vector := Vector2.ZERO

func _ready() -> void:
	
	connect("input_event", Callable(self, "_on_input_event"))


func _draw() -> void:
	draw_line(position_start - global_position, (position_end - global_position), Color.BLUE, 8)
	
	draw_line(position_start - global_position, position_start - global_position + vector, Color.RED, 16)
	


func _reset() -> void:
	position_start = Vector2.ZERO
	position_end = Vector2.ZERO
	vector = Vector2.ZERO
	
	queue_redraw()
	

func _input(event) -> void:
	
	if event.is_action_released("ui_touch"):
		touch_down = false
		var new_ball = BALL.instantiate()
		var parent = get_parent()
		if parent:
			parent.add_child(new_ball)
			new_ball.global_position = $"../Marker2D".global_position
			new_ball.launch(vector)
		_reset()
		
	if not touch_down:
		return
	
	if event is InputEventMouseMotion:
		position_end = event.position
		vector = -(position_end - position_start).limit_length(maximum_length)
		
		queue_redraw()


func _on_input_event(_viewport, event, _shape_idx) -> void:
	
	if event.is_action_pressed("ui_touch"):
		touch_down = true
		position_start = event.position
