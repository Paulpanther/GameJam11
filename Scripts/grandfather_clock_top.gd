extends Node2D


var minute_following = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_hands()
	pass # Replace with function body.


func _process(delta):
	if minute_following:
		move_minute_hand(delta) 
		update_hands()
	


	
func update_hands():
	get_node("GFC/Hours").rotation_degrees = GlobalFlowerPot.get_rotation_hour_deg()
	get_node("GFC/Minutes").rotation_degrees = GlobalFlowerPot.get_rotation_minute_deg()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		minute_following = !minute_following

func move_minute_hand(delta):
	var target_angle = rad2deg(get_global_mouse_position().angle()) +90
	print(target_angle)
	var current_angle = (fmod(GlobalFlowerPot.minutes, 60.0) / 60.0) * 360
	
	var a = target_angle - current_angle
	if(a > 180):
		a -= 360
	elif(a < -180):
		a += 360

	var a_normalized = a / abs(a)
	
	GlobalFlowerPot.minutes += a_normalized * delta * 50



#var target_angle = get_parent().get_parent().get_node("player").get_angle() + 45
#	var current_angle = rad2deg(global_rotation)
#
#
#	var a = target_angle - current_angle
#	if(a > 180):
#		a -= 360
#	elif(a < -180):
#		a += 360
#
#	var a_normalized = a / abs(a)
#
#	rotate(a_normalized * delta * 4.5)
