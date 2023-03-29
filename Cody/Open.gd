extends Control



func _on_VideoPlayer_finished():
	var _d = get_tree().change_scene("res://Scenes/Control.tscn")
	self.queue_free()
