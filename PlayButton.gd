extends Button

export (Resource) var LevelData
export(Resource) var level_music
export(Resource) var button_sound

func _ready():
	connect("pressed",self,"_on_Play_pressed")

func _on_Play_pressed():
	LevelManager.change_scene(LevelData.Levels[Saves.max_level - 1].instance())
	Music.set_song_list(level_music)
	Music.play_effect(button_sound, -10)
