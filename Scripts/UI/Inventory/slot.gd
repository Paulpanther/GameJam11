extends Node


var selected = false
var item = null

var inventory

func _ready():
	inventory = $"../../"
	_update_selected()

func width():
	return $MouseListener.shape.extents.x * 2

func set_item(new_item):
	item = new_item
	if item != null:
		var image = Image.new()
		image.load(item.sprite)
		var texture = ImageTexture.new()
		texture.create_from_image(image, 0)
		$Item.show()
		$Item.texture = texture
	else:
		$Item.hide()
	update_detail()

func on_slot_clicked(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if item != null:
			selected = !selected
			inventory.set_selected(self)

func _update_selected():
	if selected:
		$Selected.show()
		$Deselected.hide()
	else:
		$Selected.hide()
		$Deselected.show()

func update_selected_status():
	if inventory.selected_slot == self:
		selected = true
	else:
		selected = false
	_update_selected()

func update_detail():
	if item != null and item.detail != null:
		$Detail.show()
	else:
		$Detail.hide()

func on_slot_hover_enter():
	if item != null:
		pass
		#$"..".show_text(item.text)

func on_slot_hover_exit():
	#$"..".remove_text()
	pass


func on_detail_clicked(viewport, event, shape_idx):
	if item != null and item.detail != null and (event is InputEventMouseButton && event.pressed):
		$"../../../ItemDetail".show_for_item(item)
