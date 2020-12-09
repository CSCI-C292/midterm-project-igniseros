extends Node2D

export var offset = 0;

func _ready():
	$AnimatedSprite.play()
	$AnimatedSprite.frame = offset

func _process(delta):
	if($AnimatedSprite.frame == 0):
		$DeathArea/SHAPE.disabled = false
		if($LaserPlayer != null and $LaserPlayer.playing == false):
			$LaserPlayer.play()
	else:
		$DeathArea/SHAPE.disabled = true
		if($LaserPlayer != null):
			$LaserPlayer.stop()
