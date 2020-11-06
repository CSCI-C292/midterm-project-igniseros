extends RayCast2D

var player_position := Vector2(0,0)

func _ready():
	GameEvents.connect("Phased", self, "_on_Phased")

func _process(delta):
	player_position = PlayerPos.get_pos()
	global_position = player_position
	look_at(get_parent().position)


func _on_Phased(pos):
	player_position = PlayerPos.get_pos()
