extends Node2D


func _ready():
	hide()

func show_for_item(item):
	$Sprite.texture = load(item.detail)
	show()

func on_close():
	hide()
