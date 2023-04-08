extends Control
@onready var grid = get_node("MarginContainer/HSplitContainer/CenterContainer/GridContainer")


func _ready():
	for p in grid.get_children():
		p.connect("data", Callable(self, "on_base_selec"))


func on_base_selec(base_de_dados,texto): #Som tá la no node
	if Globals.base_name != texto:
		Globals.base_name = texto
		Globals.base = base_de_dados
		for s in base_de_dados.santos:
			Globals.ra.append(base_de_dados.santos.find(s))
#	var _e = get_tree().change_scene("res://Scenes/Jogo.tscn") #Somente para teste
	var _e = get_tree().change_scene_to_file("res://Scenes/Conol.tscn")
	queue_free()
	pass
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
		var _e = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
		queue_free()

