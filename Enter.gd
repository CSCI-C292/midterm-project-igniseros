extends Button

export (Resource) var LevelData
export (NodePath) var label

func _ready():
	connect("pressed",self,"_on_Play_pressed")

func _on_Play_pressed():
	var leveldat := LevelData as LevelResource
	LevelManager.change_scene(leveldat.Levels[int(get_node(label).text) -1].instance())
