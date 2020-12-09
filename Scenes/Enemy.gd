extends KinematicBody2D

export var speed := 100.0

func _ready():
	GameEvents.connect("Died", self, "_on_Player_Died")

func _physics_process(delta):
	if($EnemyRay.get_collider() is Player):
		move_and_slide((global_position - \
			$EnemyRay.get_collider().global_position).normalized() * -speed)
		if( not $FlyingAudio.playing) : $FlyingAudio.play()
	else:
		$FlyingAudio.stop()

func _on_Player_Died():
	position = Vector2(0,0)
