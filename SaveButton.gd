extends Control

export(Array,NodePath) var buttons

func _ready():
	Saves.read_last_save()
	update_saves()

func update_saves():
	for i in range(buttons.size()):
		var button : Button = get_node(buttons[i])
		if(i != Saves.selected_save):
			button.modulate.a = .5
		else:
			button.modulate.a = 1
			Saves.read_level()

func _on_Save1_pressed():
	Saves.selected_save = 0
	Saves.write_last_save()
	update_saves()


func _on_Save2_pressed():
	Saves.selected_save = 1
	Saves.write_last_save()
	update_saves()


func _on_Save3_pressed():
	Saves.selected_save = 2
	Saves.write_last_save()
	update_saves()
