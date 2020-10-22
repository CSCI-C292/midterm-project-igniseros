extends Label

func _ready():
	GameEvents.connect("Died", self, "_on_player_died")
	GameEvents.connect("Won",self,"_on_player_won")

func _on_player_died():
	text = "dead"

func _on_player_won():
	text = "won"
