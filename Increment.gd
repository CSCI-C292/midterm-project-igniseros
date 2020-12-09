extends Button


export (NodePath) var label
export (Resource) var LevelData
export var amount := 1
export(Resource) var button_sound

func _ready():
	connect("pressed",self, "_on_pressed")

func _on_pressed():
	Music.play_effect(button_sound, -10)
	var amm = amount
	var labee := get_node(label) as Label
	var leveldat := LevelData as LevelResource
	var nint = int(labee.text)
	if(nint != 1) or (amm > 0):
		if(nint+amm > Saves.max_level):
			amm = 0
		labee.text = str(nint + amm)
		if((nint+amm) / 10 < 1): labee.text = "0" + labee.text
	else:
		labee.text = "01"
