extends Node2D

export (bool) var interactable = false

func _ready():
	_update_state()

func on_detail_return():
	_update_state()

func _update_state():
	hide()
	if GlobalFlowerPot.flower_state == 4:
		show()
	
	$DoorClosed.hide()
	$DoorOpen.hide()
	if GlobalFlowerPot.door_open:
		$DoorOpen.show()
		$Keyhole.hide()
	else:
		$DoorClosed.show()

func on_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if not interactable:
			SceneStack.switch_scene("res://Scenes/Room3/DoorDetail.tscn")


func on_key_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if not GlobalFlowerPot.door_open and interactable:
			if Inv.inventory.get_selected_item() == Items.door_key:
				GlobalFlowerPot.door_open = true
				Inv.inventory.remove_item(Items.door_key)
				Inv.message.show_text("The door is open. You are free!")
				_update_state()
			else:
				Inv.message.show_text("The door is locked")
