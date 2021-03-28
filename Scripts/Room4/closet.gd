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
	else:
		$ClosetClosed.show()

func on_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if interactable:
			if not GlobalFlowerPot.closet_open:
				GlobalFlowerPot.closet_open = true
				Inv.inventory.add_item(Items.can)
				_update_state()
		else:
			SceneStack.switch_scene("res://Scenes/Room4/ClosetDetail.tscn")
