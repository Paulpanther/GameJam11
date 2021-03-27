extends Node


var inventory

func _ready():
	inventory = get_tree().get_root().get_node("Main/Inventory")
