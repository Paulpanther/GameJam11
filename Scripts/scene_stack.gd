extends Node


var scene_stack = []
var root

func _ready():
    root = get_tree().get_root()
    scene_stack.append(_get_current_scene())

func switch_scene(to_scene):
	call_deferred("_switch_scene_deferred", to_scene)

func _switch_scene_deferred(to_scene):
	var level = _get_current_scene()
	level.hide()

	# Add the next level
	var next_level_resource = load(to_scene)
	var next_level = next_level_resource.instance()
	scene_stack.append(next_level)
	print(scene_stack.size())
	root.add_child(next_level)

func exit_scene():
	call_deferred("_exit_scene_deferred")

func _exit_scene_deferred():
	print(scene_stack.size())
	var current = _get_current_scene()
	current.free()
	scene_stack.pop_back()
	
	var next = scene_stack[scene_stack.size() - 1]
	next.show()
	root.add_child(next)
	

func _get_current_scene():
	return root.get_child(root.get_child_count() - 1)
