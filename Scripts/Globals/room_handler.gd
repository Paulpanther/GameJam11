extends Node

var rooms = [
	"res://Scenes/Room1/Room1.tscn",
	"res://Scenes/Room2/Room2.tscn",
	"res://Scenes/Room3/Room3.tscn",
	"res://Scenes/Room4/Room4.tscn"
]

var root

func _ready():
	root = get_tree().get_root().get_node("Main")
	root.set_room(load(rooms[0]).instance())

func change_room(left):
	call_deferred("_change_room_deferred", left)
	
func _change_room_deferred(left):
	var current = _get_current_scene()
	var current_index = rooms.find(current.filename)
	current.free()
	
	var dir = -1 if left else 1
	var next = rooms[(current_index + dir) % rooms.size()]
	var next_level = load(next).instance()
	root.set_room(next_level)


func _get_current_scene():
	return root.current_view()
