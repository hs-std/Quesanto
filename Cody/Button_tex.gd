@tool
extends Panel
@onready var button : TextureButton = get_node("tex_button")
@export (Texture2D) var normal
@export (Texture2D) var press
@export (Texture2D) var hovered
signal press


func _process(delta):
	var _o = delta
	if normal or press or hovered:
		if Engine.is_editor_hint():
			button.texture_normal = normal
			button.texture_pressed = press
			button.texture_hover = hovered
		else:
			button.texture_normal = normal
			button.texture_pressed = press
			button.texture_hover = hovered


func _on_tex_button_pressed():
	emit_signal("press")
