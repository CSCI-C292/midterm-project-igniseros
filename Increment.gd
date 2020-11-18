extends Button


export (NodePath) var label
export (Resource) var LevelData
export var amount := 1

func _ready():
	connect("pressed",self, "_on_pressed")

func _on_pressed():
	var amm = amount
	var labee := get_node(label) as Label
	var leveldat := LevelData as LevelResource
	var nint = int(labee.text)
	if(nint != 1) or (amm > 0):
		if(nint+amm > leveldat.Levels.size()):
			amm = 0
		labee.text = str(nint + amm)
		if((nint+amm) / 10 < 1): labee.text = "0" + labee.text
	else:
		labee.text = "01"
