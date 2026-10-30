extends Node2D

func _ready() -> void:
	pass # Replace with function body.


func _on_label_1_pressed() -> void:
	DialogueManager.story_variables["key"] = true
	get_tree().change_scene_to_file("res://in game scenes/night two/scenes/choices/lychoice1.tscn")


func _on_label_2_pressed() -> void:
	DialogueManager.story_variables["mirror"] = true
	get_tree().change_scene_to_file("res://in game scenes/night two/scenes/choices/lychoice2.tscn")


func _on_label_3_pressed() -> void:
	DialogueManager.story_variables["photograph"] = true
	get_tree().change_scene_to_file("res://in game scenes/night two/scenes/choices/lychoice3.tscn")
