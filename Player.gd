extends Area2D

class_name Player

func _ready():
	GameEvents.connect("Phased", self, "_on_phased")

func _on_phased(new_position : Vector2):
	position = new_position
