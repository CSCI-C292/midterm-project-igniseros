extends AudioStreamPlayer

var song_index : int = 0
var song_list : MusicHolder

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	connect("finished", self, "_on_Audio_Finished")

func set_song_list(holder : MusicHolder, nindex = 0):
	song_index = nindex
	song_list = holder
	stream = song_list.music[song_index]
	stream.loop_mode = 0
	play()

func _on_Audio_Finished():
	song_index = (song_index + 1) 
	song_index = song_index % (song_list.music.size())
	
	stream = song_list.music[song_index]
	stream.loop_mode = 0
	play()

func play_effect(effect_stream : AudioStream, volume = 0):
	var baby_stream = AudioStreamPlayer.new()
	baby_stream.set_script(load("res://dieafterdone.gd"))
	effect_stream.loop_mode = 0
	baby_stream.stream = effect_stream
	baby_stream.volume_db = volume
	baby_stream.play()
	add_child(baby_stream)
