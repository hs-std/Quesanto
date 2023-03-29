extends Node2D


func _ready():
	pass 
	# animação de movimento
func move(target):
	var move_tween = get_node("Panel/Tween")
	move_tween.interpolate_property(self, "position", position, target, Tween.TRANS_QUINT, Tween.EASE_OUT_IN)
	move_tween.start()
	pass
# Vai para o menu
func _on_Menu_pressed():
	var m = get_tree().change_scene("res://Scenes/Control.tscn")
#	Globals.ra = []	
	queue_free()
	pass 
# Joga novamente
func _on_Jogar_pressed():
	if Globals.ra.size() == 0:
		Globals.go_to_scene("res://Scenes/selecao.tscn")
		Globals.ra = []	
	else:
		var j = get_tree().change_scene("res://Scenes/Conol.tscn")
	get_parent().queue_free()
	pass 
