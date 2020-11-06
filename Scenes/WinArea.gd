extends Area2D

class_name WinArea

export(PackedScene) var next_level

func _on_WinArea_area_entered(area):
	if(area is Player):
		GameEvents.emit_signal("Won", next_level)
	if(area is PhaseArea) : GameEvents.emit_signal("Mouse_Entered_Win_Area")


func _on_WinArea_area_exited(area):
	if(area is PhaseArea) : GameEvents.emit_signal("Mouse_Exited_Win_Area")
