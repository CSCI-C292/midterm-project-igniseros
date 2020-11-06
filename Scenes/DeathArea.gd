extends Area2D

class_name DeathArea

export(PackedScene) var death_scene

func _on_DeathArea_area_entered(area):
	if(area is Player):
		GameEvents.emit_signal("Died", death_scene)
	if(area is PhaseArea) : GameEvents.emit_signal("Mouse_Entered_Death_Area")

func _on_DeathArea_area_exited(area):
	if(area is PhaseArea) : GameEvents.emit_signal("Mouse_Exited_Death_Area")




