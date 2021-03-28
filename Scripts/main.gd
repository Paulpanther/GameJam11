extends Node

func _ready():
	RoomHandler.init()
	SceneStack.init()
	Inv.init()
	$Message.show_text("Huh?! What happened?")

func set_room(to):
	_set_view(to)
	$InteractableHUD.hide()
	$HUD.show()

func set_detail(to):
	_set_view(to)
	$InteractableHUD.show()
	$HUD.hide()

func _set_view(to):
	for n in $View.get_children():
		$View.remove_child(n)
	$View.add_child(to)

func current_view():
	return $View.get_children()[0]

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		get_node("MouseClick").play()

func _ready():
	get_node("Music").play()
