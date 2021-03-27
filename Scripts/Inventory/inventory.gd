extends Node


var _proto_slot = preload("res://Scenes/Inventory/Slot.tscn")
var inventory_width

func _ready():
	inventory_width = $Background.texture.get_size().width

func add_item(item):
	var slot = _proto_slot.instance()
	slot.set_item = item
	slot.position.x = _slots_width()
	$Slots.add_child(slot)
	_center_slots()

func _slots_width():
	var width = 0
	for slot in $Slots.get_children():
		width += slot.texture.get_size().width
	return width

func _center_slots():
	var width = _slots_width()
	$Slots.position.x = (inventory_width - width) / 2
