extends Node

export (bool) var interactable = false

func _ready():
	_update_state()

func on_detail_return():
	_update_state()

func _update_state():
	if GlobalFlowerPot.present_open:
		$Present.hide()
	else:
		$Present.show()

func on_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if interactable:
			if not GlobalFlowerPot.present_open:
				if Inv.inventory.get_selected_item() == Items.scissors:
					GlobalFlowerPot.present_open = true
					Inv.inventory.add_item(Items.door_keys)
					_update_state()
				else:
					Inv.message.show_text("I need something to cut it open")
		else:
			SceneStack.switch_scene("res://Scenes/Room2/DeskDetail.tscn")
