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
		$HookKey.visible = false
	else:
		$MaskPuzzle.texture = mask_puzzle_solved
		
		if !SolvedPuzzleStates.hook_key_picked_up:
			$HookKey.visible = true
		else:
			$HookKey.visible = false
