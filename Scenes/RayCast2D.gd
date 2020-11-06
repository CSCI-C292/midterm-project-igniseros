extends RayCast2D

var player_pos = Vector2(0,0)

func _ready():
	add_exception(get_parent())
	GameEvents.connect("Phased", self, "_on_Phased")

func _process(delta):
	look_at(player_pos)

func _on_Phased(pos):
	player_pos = pos
