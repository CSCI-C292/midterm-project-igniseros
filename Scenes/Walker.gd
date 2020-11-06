extends KinematicBody2D

export var speed := 1.0

var lock_angle := 0.0
var starting_pos : Vector2

var is_locked := false
var is_sprinting := false

func _physics_process(delta):
	if(!is_locked):
		if(not $EnemyRay.get_collider() is Player):
			$ColorRect.visible = false
		else:
			print($EnemyRay.get_collider())
			$ColorRect.visible = true
			is_locked = true
			lock_angle = $EnemyRay.rotation
			$SprintTimer.start()
	else:
		$ColorRect.set_rotation(lock_angle)
	
	if(is_sprinting):
		move_and_collide(speed * Vector2(cos(lock_angle), sin(lock_angle)))


func _on_SprintTimer_timeout():
	starting_pos = position
	is_sprinting = true
	$ColorRect.visible = false
	$ResetTimer.start()


func _on_ResetTimer_timeout():
	is_locked = false
	is_sprinting = false
