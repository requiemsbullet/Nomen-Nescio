extends Node2D

func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass


func _on_label_3_pressed() -> void:
	DialogueManager.story_variables["candle"] = true
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/choices/brchoice3.tscn")


func _on_label_2_pressed() -> void:
	DialogueManager.story_variables["match"] = true
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/choices/brchoice2.tscn")


func _on_label_1_pressed() -> void:
	DialogueManager.story_variables["string"] = true
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/choices/brchoice1.tscn")
