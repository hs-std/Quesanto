extends Node

onready var load_scene = preload("res://Scenes/Load.tscn")

var data

var musi = true

var efe = true

var notify = true

var efemenu

var tempo = 0

var save_path = "user://save.dat"

var file = File.new()

var ra : Array

var base

var base_name

export var max_load_time = 600000

func _ready():
	if file.file_exists(save_path):
		file.open(save_path, File.READ)
		var _data = parse_json(file.get_as_text() )
		file.close()
		if _data.size() < 4: 
			save_game()
		else:
			load_game()
	else:
		save_game()
		yield()
		load_game()
	if musi == true:
		AudioServer.set_bus_mute(1, true)
	if efe == true:
		AudioServer.set_bus_mute(2, true)


func goto_scene(_path, current_scene):
	var loader = ResourceLoader.load_interactive(_path)
	
	if loader == null:
		print("Resource loader unable to load the resource at path")
		return
	
	var loading_bar = load("res://Scenes/LoadingBar.tscn").instance()
	
	get_tree().get_root().call_deferred('add_child',loading_bar)
	
	var t = OS.get_ticks_msec()
	
	while OS.get_ticks_msec() - t < max_load_time:
		var err = loader.poll()
		if err == ERR_FILE_EOF:
			#Loading Complete
			var resource = loader.get_resource()
			get_tree().get_root().call_deferred('add_child',resource.instance())
			current_scene.queue_free()
			loading_bar.queue_free()
			break
		elif err == OK:
			#Still loading
			var progress = float(loader.get_stage())/loader.get_stage_count()
			loading_bar.value = progress * 100
			print(progress)
		else:
			print("Error while loading file")
			break
		yield(get_tree(),"idle_frame")
		
func go_to_scene(_path):
	data = _path
	var _o = get_tree().change_scene("res://Scenes/Load.tscn")

func save_game(): # Note: you can call this function with an Area node to make a checkpoint
	file.open(save_path, File.WRITE)
	
	# Edit this line with what you want to save:
	file.store_line(to_json({"Efeitos" : efe, "Musica" : musi, "Tempo": tempo, "Aviso":notify}))
	file.close()

	
	
func load_game():
	file.open(save_path, File.READ)
	var _data = parse_json(file.get_as_text() )
	file.close()

	# Edit the lines bellow with what you want to load:
	efe = _data["Efeitos"]
	musi = _data["Musica"]
	tempo = _data["Tempo"]
	notify = _data["Aviso"]

	return _data
