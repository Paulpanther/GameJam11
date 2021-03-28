extends Node


export (bool) var interactable = false


func _ready():
	_update_image()

func on_detail_return():
	_update_image()

func on_flower_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if interactable:
			if GlobalFlowerPot.flower_state == 0 and Inv.inventory.get_selected_item() == Items.seeds:
				Inv.inventory.remove_item(Items.seeds)
				GlobalFlowerPot.flower_state = 1
			elif GlobalFlowerPot.flower_state == 2:
				GlobalFlowerPot.flower_state = 3
				#Inv.inventory.add_item(Items.door_key)
		_update_image()

func on_table_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if not interactable:
			if GlobalFlowerPot.flower_state == 3:
				SceneStack.switch_scene("res://Scenes/Room3/CatMouse.tscn")
			else:
				SceneStack.switch_scene("res://Scenes/Room3/TableDetail.tscn")

func _update_image():
	$Flower0.hide()
	$Flower1.hide()
	$Flower2.hide()
	$Flower3.hide()
	if GlobalFlowerPot.flower_state == 0:
		$Flower0.show()
	if GlobalFlowerPot.flower_state == 1:
		$Flower1.show()
	if GlobalFlowerPot.flower_state == 2:
		$Flower2.show()
	if GlobalFlowerPot.flower_state == 3:
		$Flower3.show()
