extends Node


var inventory
var message

func init():
	inventory = get_tree().get_root().get_node("Main/Inventory")
	message = get_tree().get_root().get_node("Main/Message")
