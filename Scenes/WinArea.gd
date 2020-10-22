extends Area2D

class_name WinArea


func _on_WinArea_area_entered(area):
	if(area is Player):
		print("win")
		GameEvents.emit_signal("Won")
