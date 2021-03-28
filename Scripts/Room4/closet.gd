extends Node

export (bool) var interactable = false

func _ready():
	_update_state()

func on_detail_return():
	_update_state()

func _update_state():
	$ClosetClosed.hide()
	$ClosetOpen.hide()
	if GlobalFlowerPot.closet_open:
		$ClosetOpen.show()
		$Keyhole.hide()
	else:
		$ClosetClosed.show()

func on_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if not interactable:
			SceneStack.switch_scene("res://Scenes/Room4/ClosetDetail.tscn")


func on_key_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if not GlobalFlowerPot.closet_open and interactable and Inv.inventory.get_selected_item() == Items.hook_shaped_key:
			GlobalFlowerPot.closet_open = true
			Inv.inventory.remove_item(Items.hook_shaped_key)
			Inv.inventory.add_item(Items.can)
			_update_state()
