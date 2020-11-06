extends Area2D

class_name CollideArea

func _on_CollideArea_area_entered(area):
	if(area is PhaseArea) : GameEvents.emit_signal("Mouse_Entered_Collide_Area")


func _on_CollideArea_area_exited(area):
	if(area is PhaseArea) : GameEvents.emit_signal("Mouse_Exited_Collide_Area")

#
#func _on_CollideArea_body_entered(body):
#	if(body is PhaseMouse) : GameEvents.emit_signal("Mouse_Entered_Collide_Area")
#
#
#func _on_CollideArea_body_exited(body):
#	if(body is PhaseMouse) : GameEvents.emit_signal("Mouse_Exited_Collide_Area")
