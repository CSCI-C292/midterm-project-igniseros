extends Area2D

var in_death_area := false

func _input(event):
	if(event is InputEventMouse):
		var mouse_event := event as InputEventMouse
		position = mouse_event.position


func _on_PhaseTimer_timeout():
	GameEvents.emit_signal("Phased", position)


func _on_PhaseMouse_area_entered(body):
	if(body is DeathArea) : in_death_area = true


func _on_PhaseMouse_area_exited(body):
	if(body is DeathArea) : in_death_area = true

