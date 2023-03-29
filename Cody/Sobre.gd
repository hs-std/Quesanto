extends Control

var v

func _ready():
	Globals.efemenu = false #Impede os sons de efeito de tocar fora da tela de jogo
	pass
# Botão de voltar
func _on_Voltar_pressed():
	GameAudio.som_do_botao()
	v = get_tree().change_scene("res://Scenes/Control.tscn")
	queue_free()
# botão de voltar
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		GameAudio.som_do_botao()
		var _a = get_tree().change_scene("res://Scenes/Control.tscn")
		queue_free()
		


func _on_Instagram_pressed():
	GameAudio.som_do_botao()
	var _a = OS.shell_open("https://www.instagram.com/hs.std/")
	pass 


func _on_Site_pressed():
	GameAudio.som_do_botao()
	var _a = OS.shell_open("https://www.hs.dev.br/")
	pass 
