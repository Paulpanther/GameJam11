extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var win_conditon = 560
var translate_center = Vector2(-960,-540)
var start_position
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position



func _physics_process(delta):
		var mouse = get_global_mouse_position()
		var current_position = global_position
		var next_position_direction = mouse - current_position 
		var next_position_direction_normalized = next_position_direction.normalized()
		var next_position = current_position + next_position_direction_normalized * delta * 320 *1.6
		global_position = next_position
		
		check_win_condition()
	
	
func get_angle():
	return rad2deg(global_position.angle())

func check_win_condition():
	var player_position_translated = global_position + translate_center
	
	if player_position_translated.length() > win_conditon:
		win()
		
	#print(player_position_translated.distance_to(Vector2(0,0)))
	

func _on_Area2D_area_entered(area):
	if(area.get_name() == "PlayerArea"):
		print(area.get_name())
		global_position = start_position

func win():
	if !SolvedPuzzleStates.cat_mouse_puzzle_solved:
		SolvedPuzzleStates.cat_mouse_puzzle_solved = true
		Inv.inventory.add_item(Items.potato)
		SceneStack.exit_scene()
