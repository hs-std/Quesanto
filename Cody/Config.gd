extends Node2D

func move(target):
	var move_tween = get_node("Panel/Tween")
	move_tween.interpolate_property(self, "position", position, target, 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	move_tween.start()
	pass
