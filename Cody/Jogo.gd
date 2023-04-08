extends Node2D
var cont = Globals.tempo
var ponto = 0
var non = 0
var x
var r = 0 
var h = 1
var w = 0
var lmte = 0  
var m
@onready var stn = get_node("Nome")
@onready var ig = get_node("img")
@onready var dc = get_node("Dica")
@onready var certo = GameAudio.get_node("Efeitos/Certo")
@onready var errado = GameAudio.get_node("Efeitos/Errado")
@onready var alerta = GameAudio.get_node("Efeitos/Alerta")
@onready var timer = get_node("cronometro")
#export (Resource) var data_base
var data_base
signal acertou
signal errou
signal msp
signal no
signal stt
signal lmt
var c = ""
var f = 1
var g
var visu : bool = true
var controle_ponto : bool = true



# Sorteio dos Santos
func aletframe():
	if h == 1:
		if $fun.frame == 1:
			randomize()
			var noo = Globals.ra[randi() % Globals.ra.size()]
			non = data_base.santos[noo]
			ig.set_texture(non.imagem)
			stn.text = (non.nome)
			dc.text = (non.dica)
			Globals.ra.erase(noo)
			
#			data_base.santos.erase(non)
			emit_signal ("stt")
	if Globals.ra.size() == 0:
		Globals.base_name = ""
		
# ComeÃ§a o tempo e faz o sorteio da 1Âª imagem
func _ready():
	data_base = Globals.base
	$Cor.visible = false
	visu = true
	timer.start()
	Globals.efemenu = true #Autoriza os sons de efeito de tocar fora da tela de jogo
	m = 1
	alerta.play()
	$Tem.text = String (cont)
	$cronometro.start()
	pass 
# Adiciona Santos a lista de erros
func frameerrado():
	if w == 1:
		if $fun.frame == 1:
			c = c + "[color=#fe9c9c]â€¢ " + g + "[/color]\n"
			errado.play()
			emit_signal ("no")
		if Globals.ra.size() == 0:
			emit_signal("lmt")
# Sensor do acelerometro, muda a tela de acordo com a posiÃ§Ã£o, chama a funÃ§Ã£o dos pontos e da lista de erros
func _process(delta):
	var _p = delta
	if(Globals.efemenu == true):
		if int (Input.get_accelerometer().z)<-8:
			if controle_ponto:
				controle_ponto = false
				if m != 0:
					$fun.frame = 0
					visu = false
					emit_signal ("acertou")
		elif int (Input.get_accelerometer().z)>7:
			if controle_ponto:
				controle_ponto = false
				if m != 0:
					$fun.frame = 2
					visu = false
					emit_signal ("errou")
		else:
			if int (Input.get_accelerometer().z)>-5:
				if int (Input.get_accelerometer().z)<5:
					$fun.frame = 1	
					visu = true
					g = stn.text
					pontoscont()
					frameerrado()
					aletframe()
					controle_ponto = true
					
	if visu == false:
		$img.visible = false
		$Tem.visible = false
		$pon.visible = false
		stn.visible = false
		dc.visible = false
	else:
		$img.visible = true
		$Tem.visible = true
		$pon.visible = true
		stn.visible = true
		dc.visible = true
	pass
# Atualiza o cronometro na tela e chama a tela de resultado quando o tempo encerra
func _on_cronometro_timeout():
	cont = cont - 1
	$Tem.text = String (cont)
	if cont == 0:
		c = c + "[color=#fe9c9c]â€¢ " + g + "[/color]\n"
		results()
	if cont != 0:
		if lmte == 1:
			results()
	pass 
# Chama a tela de resultado
func results():
	$Cor.visible = true
	$img.texture = preload("res://Sprites/Santos/none.png")
	$Tem.text = ""
	$pon.text = ""
	stn.text = ""
	dc.text = ""
	m = 0
	alerta.play()
	$Resultado/Panel/PTS.text = "VocÃª fez " + String (ponto) + " Pontos"
	$Resultado/Panel/RE.text = String (c)
	$Resultado.move(Vector2(0,1144))
	$cronometro.stop()
	lmte = 0
	pass
# Conta os pontos e atualiza a lista de acertos
func pontoscont():
	if r == 1:
		if $fun.frame == 1:
			emit_signal ("msp")
			ponto += 10
			$pon.text = String ("Pontos: ") + String (ponto)
			c = c + "[color=#9dff9b]â€¢ í ½í»‡í ½í»‡" + g + "[/color]\n" #stn.text
			certo.play()
		if Globals.ra.size() == 0:
			emit_signal("lmt")
# Sinal emitido quando hÃ¡ acerto, var r controla os pontos, var h a troca de imagem
func _on_Node2D_acertou():
	r = 1
	h = 1
	pass 
# Sinal emitido quando hÃ¡ erro, var w controla a lista de erros, var h a troca de imagem
func _on_Node2D_errou():
	h = 1
	w = 1
	pass 
# Sinal emitido quando o ponto Ã© adicionado, define var r para 0 para os pontos contarem sÃ³ uma vez
func _on_Node2D_msp():
	r = 0
	pass 
# Sinal emitido quando muda a imagem do santo, define a variavel para 0 para a troca de imagem ser sÃ³ uma vez
func _on_Node2D_stt():
	h = 0
	pass
# Sinal emitido quando o nome de um santo Ã© adicionado na lista de erros
func _on_Node2D_no():
	w = 0
	pass 
#Usa o botÃ£o de voltar para o menu
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		GameAudio.som_do_botao()
		timer.stop()
		x = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
		queue_free()
# Sinal emitido queando todos os santos jÃ¡ aparesceram na tela, chama a tela 
func _on_Node2D_lmt():
	lmte = 1
	pass 


#SÃ³ para teste
#func _on_Voltar_press():
#	GameAudio.som_do_botao()
#	timer.stop()
#	x = get_tree().change_scene("res://Scenes/Control.tscn")
#	queue_free()
#	pass # Replace with function body.
