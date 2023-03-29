extends Node
onready var som_botao : AudioStreamPlayer = get_node("Efeitos/som_botao")


func som_do_botao():
	som_botao.play()
