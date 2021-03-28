extends Node


export (bool) var interactable = false



func _update_image():
	$Flower1.hide()
	$Flower2.hide()
	$Flower3.hide()
	if GlobalFlowerPot.flower_state == 1:
		$Flower1.show()
	if GlobalFlowerPot.flower_state == 2:
		$Flower2.show()
	if GlobalFlowerPot.flower_state == 3:
		$Flower3.show()
