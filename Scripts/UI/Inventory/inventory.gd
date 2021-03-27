extends Node


var _proto_slot = preload("res://Scenes/UI/Inventory/Slot.tscn")
var inventory_width

var selected_slot = null

func _ready():
	inventory_width = $Sprite.texture.get_size().x

func add_item(item):
	var slot = _proto_slot.instance()
	slot.set_item(item)
	$Slots.add_child(slot)
	_center_slots()

func remove_item(item):
	for slot in $Slots.get_children():
		if slot.item == item:
			$Slots.remove_child(slot)
	_center_slots()

func get_selected_item():
	return selected_slot.item if selected_slot != null else null

func set_selected(slot):
	selected_slot = slot
	for slot in $Slots.get_children():
		slot.update_selected_status()

func _slots_width():
	var width = 0
	for slot in $Slots.get_children():
		width += slot.width()
	return width

func _center_slots():
	var width = _slots_width()
	var x = 0
	for slot in $Slots.get_children():
		slot.position.x = x
		x += slot.width()
	$Slots.position.x = (inventory_width - width) / 2 - inventory_width / 2
