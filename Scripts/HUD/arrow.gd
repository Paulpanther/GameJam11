extends Node


export (bool) var left = true

func on_click(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		RoomHandler.change_room(left)
