extends Node

func _ready():
	SceneStack.switch_scene("res://Scenes/Room3/CatMouse.tscn")

func on_detail_return():
	$TableAndFlower.on_detail_return()
