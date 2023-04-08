extends Control
@export (Resource) var base_de_dados
@onready var node = preload("res://Scenes/Lista.tscn")
@onready var pai = get_node("MarginContainer/HSplitContainer/VBoxContainer")


func _ready():
	for i in base_de_dados.santos:
		var _e = node.instantiate()
		pai.add_child(_e)
		_e.dados(i.nome,i.dica,i.imagem) 
# botão de voltar
func _on_Voltar_pressed():
	GameAudio.som_do_botao()
	var _v = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
	queue_free()
	pass 
# botão de voltar
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		GameAudio.som_do_botao()
		var _i = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
		queue_free()
