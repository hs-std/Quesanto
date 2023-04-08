extends VBoxContainer
@onready var img = get_node("HBoxContainer/TextureRect")
@onready var nm = get_node("HBoxContainer/VBoxContainer/nome")
@onready var dc = get_node("HBoxContainer/VBoxContainer/dica")


func dados(nome,dica,imagem):
	nm.text = nome
	dc.text = dica
	img.texture= imagem
