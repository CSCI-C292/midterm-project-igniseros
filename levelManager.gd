extends Node

var current_level : Node

func _ready():
	GameEvents.connect("Died",self,"_on_player_died")
	GameEvents.connect("Won",self,"_on_player_won")


func _on_player_died(death_scene : PackedScene):
	var dscene = death_scene.instance()
	dscene.return_level = current_level.filename
	change_scene(dscene)

func _on_player_won(win_scene: PackedScene):
	var wscene = win_scene.instance()
	change_scene(wscene)


func change_scene(scene : Node):
	call_deferred("change_scene_helper", scene)

func change_scene_helper(scene : Node):
	current_level.queue_free()
	get_tree().root.add_child(scene)
	current_level = scene
