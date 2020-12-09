extends Node

var max_level : int = 1
var selected_save : int = 0;

func _ready():
	check_files_exist()

func save_level(level):
	check_files_exist()
	max_level = max(level, max_level)
	write_level()
	
func read_level():
	check_files_exist()
	var save_game = File.new()
	save_game.open("user://save_game"+ str(selected_save) +".save", File.READ)
	max_level = parse_json(save_game.get_line())["level"]
	save_game.close()

func write_level():
	var save_dict = {"level" : max_level}
	var save_game = File.new()
	save_game.open("user://save_game"+ str(selected_save) +".save", File.WRITE)
	save_game.store_line(to_json(save_dict))
	save_game.close()

func check_files_exist():
	var save_game = File.new()
	var temp_selected_save = selected_save
	for i in range(3):
		selected_save = i
		if(not save_game.file_exists("user://save_game"+ str(selected_save) +".save")):
			print("Creating : " + "user://save_game"+ str(selected_save) +".save")
			write_level()
	if(not save_game.file_exists("user://last_save.save")):
		print("Creating : " + "user://last_save.save")
		save_game.open("user://last_save.save", File.WRITE)
		save_game.store_line(str(selected_save))
	selected_save = temp_selected_save;
	save_game.close()

func read_last_save():
	var save_game = File.new()
	save_game.open("user://last_save.save", File.READ)
	selected_save = int(save_game.get_line())
	save_game.close()

func write_last_save():
	var save_game = File.new()
	save_game.open("user://last_save.save", File.WRITE)
	save_game.store_line(str(selected_save))
	save_game.close()
