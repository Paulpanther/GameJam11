extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _process(delta):
	var target_vector = get_parent().get_parent().get_node("player").global_position
	target_vector += Vector2(-960,-540)
	var target_angle = rad2deg(target_vector.angle()) + 45
	var current_angle = rad2deg(global_rotation)

	
	var a = target_angle - current_angle
	if(a > 180):
		a -= 360
	elif(a < -180):
		a += 360
	
	var a_normalized = a / abs(a)
	
	rotate(a_normalized * delta * 4.5)

func is_blockade():
	return true
