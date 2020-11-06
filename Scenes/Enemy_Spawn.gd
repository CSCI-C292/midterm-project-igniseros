extends Node2D

export(PackedScene) var enemy

func _ready():
	enemy = enemy as PackedScene
	var e_boy = enemy.instance()
	add_child(e_boy)
