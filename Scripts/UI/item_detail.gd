extends Node2D


func _ready():
	hide()

func show_for_item(item):
	var img = Image.new()
	img.load(item.detail)
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	$Sprite.texture = tex
	show()

func on_close():
	hide()
