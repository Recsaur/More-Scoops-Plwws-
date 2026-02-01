extends Node2D

var drawlen = false
var start_pos: Vector2
var end_pos: Vector2
var dist = 0
var MaxLen = false
var dir_x = "NA"
var dir_y = "NA"
var y_comp = 0.0
var x_comp = 0.0
var ScoopRo = 0
#const ICECREAM = preload("res://Scenes/IceCream.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("STAR")
			ScoopRo = self.global_rotation
			drawlen = true
			start_pos = event.position
			end_pos = event.position
		else:
			if start_pos.x < end_pos.x:
				dir_x = "L"
			elif start_pos.x > end_pos.x:
				dir_x = "R"
				
			if start_pos.y < end_pos.y:
				dir_y = "U"
			elif start_pos.y > end_pos.y:
				dir_y = "D"
				
			drawlen = false
			print("SHOOT")
			#var new_icecream = ICECREAM.instantiate()
			#get_parent().add_child(new_icecream)
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
