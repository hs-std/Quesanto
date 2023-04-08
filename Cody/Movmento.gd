extends Panel
@onready var i1 = get_node("TextureRect") 
@onready var i2 = get_node("TextureRect2")
var m = 0
@export (float) var vel = 0.1

func _ready():
	$AnimationPlayer.play("mov")

#func _process(delta):
##	yield(get_tree().create_timer(0.1), "timeout")
#	i1.material.set("shader_param/motion", Vector2(0,m + vel))
#	i2.material.set("shader_param/motion", Vector2(0,-m + vel))
