extends Node2D

func _ready() -> void:
	pass

func _on_label_1_pressed() -> void:
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/bedroom.tscn")


func _on_label_2_pressed() -> void:
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/laundry.tscn")


func _on_label_3_pressed() -> void:
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/kitchen.tscn")
