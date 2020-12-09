extends Button

export(Resource) var button_sound

func _on_Clear_pressed():
	Saves.max_level = 1
	Saves.write_level()
	Music.play_effect(button_sound, -10)
