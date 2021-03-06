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
		if not GlobalFlowerPot.closet_open and interactable:
			if Inv.inventory.get_selected_item() == Items.hook_shaped_key:
				GlobalFlowerPot.closet_open = true
				Inv.inventory.remove_item(Items.hook_shaped_key)
				Inv.inventory.add_item(Items.can)
				get_tree().get_root().get_node("Main").get_node("DoorOpen").play()
				_update_state()
			else:
				Inv.message.show_text("The closet is locked")
				get_tree().get_root().get_node("Main").get_node("LockRattle").play()
