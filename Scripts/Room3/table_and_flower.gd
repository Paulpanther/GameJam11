extends Node


export (bool) var interactable = false


func _ready():
	_update_image()

func on_detail_return():
	_update_image()

func on_flower_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if interactable:
			if GlobalFlowerPot.flower_state == 0:
				if Inv.inventory.get_selected_item() == Items.seeds:
					GlobalFlowerPot.flower_state = 1
				else:
					Inv.message.show_text("The pot is empty")
			elif GlobalFlowerPot.flower_state == 1:
				if Inv.inventory.get_selected_item() == Items.can:
					Inv.inventory.remove_item(Items.can)
					GlobalFlowerPot.flower_state = 2
					print("now 2")
					Inv.message.show_text("Now the flower only needs time to grow")
				else:
					Inv.message.show_text("The flower seems to be to dry")
			elif GlobalFlowerPot.flower_state == 3:
				print("now 4")
				GlobalFlowerPot.flower_state = 4
				Inv.inventory.add_item(Items.scissors)
		_update_image()

func on_table_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if not interactable:
			if GlobalFlowerPot.flower_state == 4:
				SceneStack.switch_scene("res://Scenes/Room3/CatMouse.tscn")
			else:
				SceneStack.switch_scene("res://Scenes/Room3/TableDetail.tscn")

func _update_image():
	print(GlobalFlowerPot.is_minutes_correct())
	if GlobalFlowerPot.flower_state == 2 and GlobalFlowerPot.is_minutes_correct():
		GlobalFlowerPot.flower_state = 3
	
	$Flower0.hide()
	$Flower1.hide()
	$Flower3.hide()
	$Flower4.hide()
	if GlobalFlowerPot.flower_state == 0:
		$Flower0.show()
	if GlobalFlowerPot.flower_state == 1 or GlobalFlowerPot.flower_state == 2:
		$Flower1.show()
	if GlobalFlowerPot.flower_state == 3:
		$Flower3.show()
	if GlobalFlowerPot.flower_state == 4:
		$Flower4.show()
