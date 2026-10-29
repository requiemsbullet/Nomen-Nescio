extends Node2D


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night two/scenes/mariaroom.tscn")
