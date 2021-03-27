extends Node

func _on_GFCTop_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		SceneStack.switch_scene("res://Scenes/Room1/GrandfatherClockTop.tscn")

func on_detail_return():
	get_node("GrandfatherClock").on_detail_return()
