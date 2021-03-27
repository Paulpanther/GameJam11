extends Node


var _proto_slot = preload("res://Scenes/Inventory/Slot.tscn")
var inventory_width

func _ready():
	inventory_width = $Sprite.texture.get_size().x
	add_item(Items.item1)
	add_item(Items.item1)

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
