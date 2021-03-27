extends Node

var return_function_name = "on_detail_return"

var scene_stack = []
var root

func _ready():
	root = get_tree().get_root()

func switch_scene(to_scene):
	call_deferred("_switch_scene_deferred", to_scene)

func _switch_scene_deferred(to_scene):
	var level = _get_current_scene()
	scene_stack.append(level)
	level.hide()

	# Add the next level
	var next_level_resource = load(to_scene)
	var next_level = next_level_resource.instance()
	
	root.add_child(next_level)

func exit_scene():
	call_deferred("_exit_scene_deferred")

func _exit_scene_deferred():
	var current = _get_current_scene()
	current.free()
	
	var next = scene_stack.pop_back()
	next.show()
	if next.has_method(return_function_name):
		next.on_detail_return()
	root.add_child(next)

func _get_current_scene():
	return root.get_child(root.get_child_count() - 1)
