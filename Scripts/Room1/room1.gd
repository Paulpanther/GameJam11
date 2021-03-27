extends Node




func _on_GFCTop_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		SceneStack.switch_scene("res://Scenes/GrandfatherClockTop.tscn")

