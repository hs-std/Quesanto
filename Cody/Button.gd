@tool
extends Button
@onready var lab : Label = get_node("Label")
@onready var cor = get_node("cor")
@onready var tex : String

	
#func _ready():
#	lab.text = self.text
	

func _process(delta):
	var _o = delta
	if Engine.is_editor_hint():
		if self.text.length() > 0:
			lab.text = self.text
	else:
		if self.text.length() > 0:
			lab.text = self.text



func _on_Button_mouse_entered():
	lab.modulate = Color("#8b8b8b")


func _on_Button_mouse_exited():
	lab.modulate = Color("#ffffff")


func _on_Button_pressed():
	cor.modulate = Color("#8b8b8b")
	lab.modulate = Color("#8b8b8b")

