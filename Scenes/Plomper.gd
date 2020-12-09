extends KinematicBody2D

export var speed := 150
var is_exploding := false
var is_resting := false

func _physics_process(delta):
	if($EnemyRay.get_collider() is Player) and not is_exploding:
		if(not $WalkSound.playing): $WalkSound.play()
		move_and_slide((global_position - \
			$EnemyRay.get_collider().global_position).normalized() * -speed)
	else:
		$WalkSound.stop()


func _on_PlayerFinderArea_area_entered(area):
	if(area is Player):
		explode()


func explode():
	is_exploding = true
	$DeathArea.visible = true
	$DeathArea/WarningLight.energy = 1
	$ChargeSound.play()
	$Fuse.start()
	


func _on_Fuse_timeout():
	$DeathArea/CollisionShape2D.disabled = false
	$DeathArea/WarningLight.energy = 10
	$DeathArea/FlashLight.energy = 1
	$DischargeSound.play()
	$Flash.start()


func _on_Flash_timeout():
	$DeathArea.visible = false
	$DeathArea/CollisionShape2D.disabled = true
	$DeathArea/WarningLight.energy = 1
	$DeathArea/FlashLight.energy = 0
	$Rest.start()


func _on_Rest_timeout():
	is_exploding = false
	$DeathArea/WarningLight.energy = 0
