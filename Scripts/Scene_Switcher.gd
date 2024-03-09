extends Area2D


@export_file("*.tscn") var path = ""

func _on_player_entered(body):
	get_tree().change_scene_to_file(path)
