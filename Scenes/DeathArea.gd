extends Area2D

class_name DeathArea

func _on_DeathArea_area_entered(area):
	if(area is Player):
		print("dead")
		GameEvents.emit_signal("Died")
