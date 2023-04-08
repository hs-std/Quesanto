extends Control
var x

func _ready():
	Globals.goto_scene(Globals.data, self)


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		x = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
		
