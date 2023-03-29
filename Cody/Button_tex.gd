tool
extends Panel
onready var button : TextureButton = get_node("tex_button")
export (Texture) var normal
export (Texture) var press
export (Texture) var hovered
signal press


func _process(delta):
	var _o = delta
	if normal or press or hovered:
		if Engine.editor_hint:
			button.texture_normal = normal
			button.texture_pressed = press
			button.texture_hover = hovered
		else:
			button.texture_normal = normal
			button.texture_pressed = press
			button.texture_hover = hovered


func _on_tex_button_pressed():
	emit_signal("press")
