extends Node


var selected = false
var item = null

func _ready():
	$Item.hide()
	_update_selected()

func set_item(new_item):
	item = new_item
	if item != null:
		$Item.texture = item.sprite
		$Item.show()
	else:
		$Item.hide()

func on_slot_clicked(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if item != null:
			selected = !selected
			_update_selected()

func _update_selected():
	if selected:
		$Selected.show()
		$Deselected.hide()
	else:
		$Selected.hide()
		$Deselected.show()

func on_slot_hover_enter():
	if item != null:
		$"..".show_text(item.text)

func on_slot_hover_exit():
	$"..".remove_text()
