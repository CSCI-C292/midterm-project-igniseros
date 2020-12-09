extends Node

export(int) var Level

func _ready():
	LevelManager.current_level = self
	if(Level != -1):
		Saves.save_level(Level)
		get_tree().paused = true

func _input(event):
	if(Input.is_action_pressed("ui_cancel")):
		LevelManager.change_scene(load("res://Menu.tscn").instance())
