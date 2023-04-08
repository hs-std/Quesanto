extends Control
var lbl = 5
var j
@onready var tempo = GameAudio.get_node("Efeitos/Tempo")

func _ready():
	Globals.efemenu = false #Impede os sons de efeito de tocar fora da tela de jogo
	$Timer.start()
	pass
# Posicione o celular na testa
func _process(delta):
	var _e = delta
	if int (Input.get_accelerometer().y)>= -10 and int(Input.get_accelerometer().y) < -6:
		if int (Input.get_accelerometer().x)<=3 and int (Input.get_accelerometer().x)>=-3:
			$Label2.visible = true
			$contador.visible = true
			$Label.visible = false
	else:
		$Label2.visible = false
		$contador.visible = false
		$Label.visible = true
	pass
# Cronometro
func _on_Timer_timeout():
	if $contador.visible == true:
		lbl = lbl - 1
		$contador.text = String (lbl)
		tempo.play()
	else:
		lbl = 5
		$contador.text = String (lbl)
		tempo.stop()
	if lbl == 0:
		if $contador.visible == true:
			$Timer.stop()
			Globals.go_to_scene("res://Scenes/Jogo.tscn")
			queue_free()
	pass 
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		GameAudio.som_do_botao()
		var _u = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
		queue_free()

func _on_Voltar_pressed():
	GameAudio.som_do_botao()
	var _u = get_tree().change_scene_to_file("res://Scenes/Control.tscn")
	queue_free()
