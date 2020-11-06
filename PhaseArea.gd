extends Area2D


class_name PhaseArea

func _process(delta):
	if($Ray.player_position.distance_to(get_global_mouse_position()) >= $Ray.cast_to.x):
		position = $Ray.player_position + $Ray.player_position.direction_to(get_global_mouse_position()) \
		 * $Ray.cast_to.x
	else: 
		position = get_global_mouse_position()
