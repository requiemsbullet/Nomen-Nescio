extends Node2D

func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass


func _on_label_1_pressed() -> void:
	DialogueManager.story_variables["bell"] = true
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/choices/brchoice3.tscn")


func _on_label_2_pressed() -> void:
	DialogueManager.story_variables["needle"] = true
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/choices/brchoice2.tscn")


func _on_label_3_pressed() -> void:
	DialogueManager.story_variables["bottle"] = true
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/choices/brchoice1.tscn")
