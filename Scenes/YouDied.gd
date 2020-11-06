extends Node2D

var return_level

func _on_Timer_timeout():
	LevelManager.change_scene(load(return_level).instance())
