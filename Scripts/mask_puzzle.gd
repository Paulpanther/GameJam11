extends Node2D

# i = x du bastard
#happy = (1,0)
#sad = (4,0)
#angry = (1,3)

const win_coordinates = [Vector2(810,690), Vector2(1260,240), Vector2(810, 240)]

var wallhook = preload("res://Sprites/wall_hook.png")
var sprites = {}
var hooks_masks = {}
var current_mask

const offset_x = 240
const offset_y = 660
const distance_hooks = 150

func _ready():
	current_mask = "AngryMask"
	
	for i in range(5):
		hooks_masks[i] = {}
	
	
	hooks_masks[0][0] = get_node("AngryMask")
	hooks_masks[0][1] = get_node("SadMask")
	hooks_masks[0][2] = get_node("HappyMask")
	hooks_masks[0][3] = init_new_hook()
	hooks_masks[0][4] = init_new_hook()
	for i in range(5):
		for j in range(1,5):
			hooks_masks[j][i] = init_new_hook()
	
	
	for i in range(5):
		for j in range(5):
			hooks_masks[i][j].offset = Vector2(offset_y + i * distance_hooks, offset_x + j * distance_hooks)
			add_child(hooks_masks[i][j])

func register_selected(node_name):
	current_mask = node_name
	
func hook_click(hook):
	move_current_mask_to(hook)

func move_current_mask_to(target_hook):
	var current_mask_position_old = get_node(current_mask).offset
	get_node(current_mask).offset = target_hook.offset
	target_hook.offset = current_mask_position_old
	
	check_win_condition()

func init_new_hook():
	var hook = Sprite.new()
	hook.set_texture(wallhook)
	hook.set_script(load("res://Scripts/hook.gd"))
	return hook

func check_win_condition():
	if(get_node("AngryMask").offset == win_coordinates[0] && get_node("SadMask").offset == win_coordinates[1] && get_node("HappyMask").offset == win_coordinates[2]):
		print("win")
