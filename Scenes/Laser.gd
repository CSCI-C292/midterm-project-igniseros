extends Node2D

export var offset = 0;

func _ready():
	$AnimatedSprite.play()
	$AnimatedSprite.frame = offset

func _process(delta):
	if($AnimatedSprite.frame == 0):
		$DeathArea/SHAPE.disabled = false
	else:
		$DeathArea/SHAPE.disabled = true
