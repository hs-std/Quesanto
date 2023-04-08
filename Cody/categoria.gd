extends CenterContainer

@export (Resource) var base_de_dados
@export (String) var texto
signal data


func _ready():
	$Button/Label.text = texto
	



func _on_Button_pressed():
	GameAudio.som_do_botao()
	emit_signal("data", base_de_dados,texto)
	pass 
