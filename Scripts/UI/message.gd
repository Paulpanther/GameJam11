extends Node2D

func _ready():
	hide()

func show_text(text):
	show()
	$Label.bbcode_text = "[center]" + text + "[/center]"

func on_close():
	hide()
