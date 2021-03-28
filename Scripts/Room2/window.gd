extends Node


export (bool) var interactable = false


func _ready():
	_update_sprites()

func on_window_clicked(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if interactable:
			if GlobalFlowerPot.window_state == "closed":
				GlobalFlowerPot.window_state = "open_small"
				get_tree().get_root().get_node("Main").get_node("DoorOpen").play()
				_update_sprites()
		else:
			SceneStack.switch_scene("res://Scenes/Room2/WindowDetail.tscn")

func on_detail_return():
	_update_sprites()

func on_paper_clicked(viewport, event, shape_idx):
	if interactable and (event is InputEventMouseButton && event.pressed):
		if GlobalFlowerPot.window_state == "open_small":
			GlobalFlowerPot.window_state = "open_big"
			Inv.inventory.add_item(Items.poem_paper)
			_update_sprites()

func _update_sprites():
	$Closed.hide()
	$OpenSmall.hide()
	$OpenBig.hide()
	
	if GlobalFlowerPot.window_state == "closed":
		$Closed.show()
	if GlobalFlowerPot.window_state == "open_small":
		$OpenSmall.show()
	if GlobalFlowerPot.window_state == "open_big":
		$OpenBig.show()
