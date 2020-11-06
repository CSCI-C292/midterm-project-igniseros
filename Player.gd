extends Area2D

class_name Player

export(NodePath) var spawn

func _ready():
	PlayerPos.set_pos(position)
	GameEvents.connect("Phased", self, "_on_phased")
	GameEvents.connect("Died", self, "_on_died")

func _on_phased(new_position : Vector2):
	position = new_position
	PlayerPos.set_pos(position)

func _on_died():
	GameEvents.emit_signal("Phased", get_node(spawn).position)
