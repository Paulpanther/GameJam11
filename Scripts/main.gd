extends Node


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
