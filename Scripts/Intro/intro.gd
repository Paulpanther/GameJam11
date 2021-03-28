extends Node

export (float) var text_speed = 60.0
export (float) var text_end = -1000
export (float) var text_real_end = -1700
export (float) var modulate_speed = 400.0
export (float) var modulate_inv_speed = 200.0
export (float) var scale_speed = 1.5

var move = false

func _ready():
	$Audio.play()
	$House.modulate.a = 0.0
	$Inventory.modulate.a = 0.0
	$Inventory.add_item_silent(Items.door_key)
	$House/DoorOpen.hide()

func _process(delta):
	$Text.rect_position.y -= text_speed * delta
	if $Text.rect_position.y < text_end:
		$House.modulate.a = clamp((text_end - $Text.rect_position.y) / modulate_speed, 0, 1)
	if $Text.rect_position.y < text_real_end:
		$Inventory.modulate.a = clamp((text_end - $Text.rect_position.y) / modulate_inv_speed, 0, 1)
	
	if move:
		$House.scale += Vector2(scale_speed * delta, scale_speed * delta)
	if $House.scale.x > 15:
		call_deferred("_remove_deferred")

func _remove_deferred():
	get_tree().change_scene("res://Scenes/Main.tscn")


func on_door_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if $Inventory.get_selected_item() == Items.door_key:
			$Inventory.remove_item(Items.door_key)
			$House/DoorClosed.hide()
			$House/DoorOpen.show()
			$Inventory.hide()
			move = true
