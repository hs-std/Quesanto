extends Control
var c
var s
var p
var an = 6
var e
var x = RandomNumberGenerator.new()
onready var song = get_node("Config/Panel/Song/tex_button")
onready var efx = get_node("Config/Panel/Som/tex_button") 
onready var sp = get_node("Sprite/AnimationPlayer")
onready var musi = GameAudio.get_node("Musica/Musica")
onready var ss = get_node("Config/Panel/60")
onready var nv = get_node("Config/Panel/90")
onready var tr = get_node("Config/Panel/30")
var so = preload("res://Sprites/Song_on.png")
var sof = preload("res://Sprites/Song_off.png")
var eo =  preload("res://Sprites/Som_on.png")
var eof =  preload("res://Sprites/Som_off.png")


func _ready():
#	Globals.ra = []	#Não sei por que coloquei isso, mas me causou um bug
#	notify()
	if Globals.tempo == 0 or Globals.tempo == 30:
		Globals.tempo = 60
	if Globals.tempo == 60:
		tr.pressed = true
	elif Globals.tempo == 90:
		ss.pressed = true
	else:
		nv.pressed = true
	Globals.efemenu = false #Impede os sons de efeito de tocar fora da tela de jogo
	if(Globals.musi == true):
		song.set_normal_texture(so)
		AudioServer.set_bus_mute(1, false)
	else:
		song.set_normal_texture(sof)
		AudioServer.set_bus_mute(1, true)
	if(Globals.efe == true):
		efx.set_normal_texture(eo)
		AudioServer.set_bus_mute(2, false)
	else:
		efx.set_normal_texture(eof)
		AudioServer.set_bus_mute(2, true)
	if(musi.playing == false):
		musi.play()
	sp.play("0")
	yield(sp, "animation_finished")
	sp.play("1")  
	yield(sp, "animation_finished")
	sp.play("0") 
	yield(sp, "animation_finished")
	sp.play("2")  
	yield(sp, "animation_finished")
	sp.play("0") 
	yield(sp, "animation_finished")
	sp.play("3")  
	yield(sp, "animation_finished")
	sp.play("0") 
	pass
# Botão de sair
func _on_Sair_pressed():
	GameAudio.som_do_botao()
	get_tree().quit()
	pass 
# Botão de jogar
func _on_Jogar_pressed():
	GameAudio.som_do_botao()
	Globals.go_to_scene("res://Scenes/selecao.tscn")
	queue_free()
	pass 
# Botão de voltar
func _Vol_pressed():
	GameAudio.som_do_botao()
	s = get_tree().change_scene("res://Scenes/Sobre.tscn")
	pass 
	
func _on_Song_pressed():
	GameAudio.som_do_botao()
	if Globals.musi == true:
		AudioServer.set_bus_mute(1, true)
		song.set_normal_texture(sof)
		song.set_pressed_texture(so)
		Globals.musi = false
	else:
		AudioServer.set_bus_mute(1, false)
		song.set_normal_texture(so)
		song.set_pressed_texture(sof)
		Globals.musi = true
	Globals.save_game()
	pass 

func _on_som_pressed():
	GameAudio.som_do_botao()
	if Globals.efe == true:
		AudioServer.set_bus_mute(2, true)
		efx.set_normal_texture(eof)
		efx.set_pressed_texture(eo)
		Globals.efe = false
	else:
		AudioServer.set_bus_mute(2, false)
		efx.set_normal_texture(eo)
		efx.set_pressed_texture(eof)
		Globals.efe = true
	Globals.save_game()
	pass 
	
func a_spt(): #Sorteia as animações
	if an == 0:
		sp.play("0")
		yield(sp, "animation_finished")
		sp.play("1")  
		yield(sp, "animation_finished")
		sp.play("0") 
		yield(sp, "animation_finished")
		sp.play("2")  
		yield(sp, "animation_finished")
		sp.play("0") 
		yield(sp, "animation_finished")
		sp.play("3")  
		yield(sp, "animation_finished")
		sp.play("0") 
		an = 6
	pass



func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		GameAudio.som_do_botao()
		get_tree().quit()


func _on_Config_b_pressed():
	GameAudio.som_do_botao()
	$Config.move(Vector2(0,944))
	$Cor.visible = true
	pass 


func _on_Fechar_pressed():
	GameAudio.som_do_botao()
	Globals.load_game()
	$Config.move(Vector2(0,0))
	$Cor.visible = false
	pass 


func _on_30_pressed():
	GameAudio.som_do_botao()
	Globals.tempo = 60
	ss.pressed = false
	nv.pressed = false
	Globals.save_game()


func _on_60_pressed():
	GameAudio.som_do_botao()
	Globals.tempo = 90
	tr.pressed = false
	nv.pressed = false
	Globals.save_game()


func _on_90_pressed():
	GameAudio.som_do_botao()
	Globals.tempo = 120
	ss.pressed = false
	tr.pressed = false
	Globals.save_game()


func _on_Timer_timeout():
	an = an - 1
	a_spt()



func _on_Info_press():
	GameAudio.som_do_botao()
	Globals.go_to_scene("res://Scenes/todos_santos.tscn")
	queue_free()

func notify():
	if Globals.notify == true:
		$Cor.visible = true
		get_node("aviso").show()

		
	


func _on_Fechar_aviso_press():
	$Cor.visible = false
	get_node("aviso").hide()
	Globals.notify = false
	Globals.save_game()
