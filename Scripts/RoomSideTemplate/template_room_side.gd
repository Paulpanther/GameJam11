extends Node


func on_disk_clicked(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		SceneStack.switch_scene("res://Scenes/Room3/CatMouse.tscn")
