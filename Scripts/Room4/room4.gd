extends Node2D

var mask_puzzle_solved = preload("res://Sprites/Room4/Masks/masks_solved.png")
var mask_puzzle_unsolved = preload("res://Sprites/Room4/Masks/masks_unsolved.png")

func _ready():
	update_mask_puzzle()
	
func on_detail_return():
	update_mask_puzzle()

func update_mask_puzzle():
	if !SolvedPuzzleStates.mask_puzzle_solved:
		$MaskPuzzle.texture = mask_puzzle_unsolved
	else:
		$MaskPuzzle.texture = mask_puzzle_solved
