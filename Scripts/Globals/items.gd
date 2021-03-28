extends Node

var _proto_item = preload("res://Scripts/item.gd")

var poem_paper = _proto_item.new("res://Sprites/Items/paper.png", "Folded Paper", "You found a folded piece of paper", "res://Sprites/Items/poem.png")
var hook_shaped_key = _proto_item.new("res://Sprites/Items/hook_shaped_key.png", "Hook shaped Key", "A hook-shaped key fall from the wall", null)
var seeds = _proto_item.new("res://Sprites/Items/seeds_small.png", "Seeds", "You open the drawer and find a pack of labeled seeds", "res://Sprites/Items/seeds.png")
var can = _proto_item.new("res://Sprites/Items/can.png", "Watering can", "In the closet is a filled watering can", null)
