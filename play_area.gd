extends Node2D

var drawlen = false
var start_pos: Vector2
var end_pos: Vector2
var dist = 0
var MaxLen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			drawlen = true
			start_pos = event.position
			end_pos = event.position
		else:
			drawlen = false
			print("SHOOT")
			
			print("Mouse Click/Unclick at: ", event.position)
			queue_redraw()
	if event is InputEventMouseMotion and drawlen:
		end_pos = event.position
		queue_redraw()
		
func _draw() -> void:
	if drawlen:
		dist = sqrt((start_pos.x - end_pos.x)**2 + (start_pos.y - end_pos.y)**2)
		if dist < 750:
			draw_line(start_pos, end_pos, Color.GRAY, 10.0)
			MaxLen = false
		else:
			draw_line(start_pos, end_pos, Color.DARK_RED, 10.0)
			MaxLen = true
		print(dist)
