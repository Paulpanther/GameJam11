extends Node

export (bool) var interactable = false

func _ready():
	_update_state()

func on_detail_return():
	_update_state()

func _update_state():
	$DrawerClosed.hide()
	$DrawerOpen.hide()
	if GlobalFlowerPot.drawer_open:
		$DrawerOpen.show()
	else:
		$DrawerClosed.show()

func on_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if interactable:
			if not GlobalFlowerPot.drawer_open:
				GlobalFlowerPot.drawer_open = true
				Inv.inventory.add_item(Items.seeds)
				_update_state()
		else:
			SceneStack.switch_scene("res://Scenes/Room1/DrawerDetail.tscn")
