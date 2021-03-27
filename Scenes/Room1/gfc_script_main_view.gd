extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_hands()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_detail_return():
	refresh_hands()

func refresh_hands():
	get_node("Minute").rotation_degrees = GlobalFlowerPot.get_rotation_minute_deg()
	get_node("Hour").rotation_degrees = GlobalFlowerPot.get_rotation_hour_deg()
