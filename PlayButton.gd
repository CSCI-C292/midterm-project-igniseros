extends Button

export(PackedScene) onready var level_1

func _ready():
	connect("pressed",self,"_on_Play_pressed")

func _on_Play_pressed():
	LevelManager.change_scene(level_1.instance())
