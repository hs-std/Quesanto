extends Control



func _on_VideoPlayer_finished():
	var _d = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
	self.queue_free()
