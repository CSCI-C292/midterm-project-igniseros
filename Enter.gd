extends Button

export (Resource) var LevelData
export (NodePath) var label
export(Resource) var level_music
export(Resource) var button_sound

func _ready():
	connect("pressed",self,"_on_Play_pressed")

func _on_Play_pressed():
	var leveldat := LevelData as LevelResource
	LevelManager.change_scene(leveldat.Levels[int(get_node(label).text) -1].instance())
	Music.set_song_list(level_music)
	Music.play_effect(button_sound, -10)
