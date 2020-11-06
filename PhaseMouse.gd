extends KinematicBody2D

var in_death_area := false
var in_collide_area := false
var in_win_area := false

var player_position
export(NodePath) onready var RAY = get_node(RAY) as RayCast2D

class_name PhaseMouse

func _ready():
	GameEvents.connect("Mouse_Entered_Collide_Area", self, "_on_Mouse_Entered_Collide_Area")
	GameEvents.connect("Mouse_Exited_Collide_Area", self, "_on_Mouse_Exited_Collide_Area")
	
	GameEvents.connect("Mouse_Entered_Death_Area", self, "_on_Mouse_Entered_Death_Area")
	GameEvents.connect("Mouse_Exited_Death_Area", self, "_on_Mouse_Exited_Death_Area")
	
	GameEvents.connect("Mouse_Entered_Win_Area", self, "_on_Mouse_Entered_Win_Area")
	GameEvents.connect("Mouse_Exited_Win_Area", self, "_on_Mouse_Exited_Win_Area")
	phase()

func _physics_process(delta):
	$Ring.energy = 1 - (.5 * $PhaseTimer.time_left)
	$Light.energy = 1 - $PhaseTimer.time_left
	figure_phase_pos(delta)
	

func figure_phase_pos(delta):
	var move_to = get_global_mouse_position()
	if(player_position.distance_to(get_global_mouse_position()) >= RAY.cast_to.x):
		move_to = player_position + player_position.direction_to(get_global_mouse_position()) * RAY.cast_to.x
	
	if(in_collide_area):
		move_and_slide((move_to - position)/ delta)
	else:
		global_position = move_to

func _on_PhaseTimer_timeout():
	phase()

func phase():
	player_position = position
	GameEvents.emit_signal("Phased", position)

func _on_Mouse_Entered_Collide_Area():
	in_collide_area = true

func _on_Mouse_Exited_Collide_Area():
	in_collide_area = false

func _on_Mouse_Entered_Death_Area():
#	$Sprite2.modulate.r += .8
#	$Sprite2.modulate.a += .8
	in_death_area = true

func _on_Mouse_Exited_Death_Area():
#	$Sprite2.modulate.r-= .8
#	$Sprite2.modulate.a -= .8
	in_death_area = false

func _on_Mouse_Entered_Win_Area():
#	$Sprite2.modulate.g += .8
	in_win_area = true

func _on_Mouse_Exited_Win_Area():
#	$Sprite2.modulate.g -= .8
	in_win_area = false
