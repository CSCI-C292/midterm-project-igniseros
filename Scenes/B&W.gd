extends ColorRect


func _ready():
	GameEvents.connect("Unpaused", self, "_on_unpaused")


func _on_unpaused():
	visible = false
