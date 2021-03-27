extends Node




func on_clicked(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		SceneStack.exit_scene()
