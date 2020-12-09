extends Area2D

export(bool) var fade_on_exit = true

func _ready():
	$Label.modulate.a = 0


func _on_TextZone_area_entered(area):
	if(area is Player and $AnimationPlayer.current_animation_position == 0):
		$AnimationPlayer.play("Appear")


func _on_TextZone_area_exited(area):
	if(area is Player and fade_on_exit):
		$AnimationPlayer.play_backwards("Appear")
