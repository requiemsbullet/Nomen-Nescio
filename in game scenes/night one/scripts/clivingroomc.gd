extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass


func _on_label_1_pressed() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/kitchen.tscn")


func _on_label_2_pressed() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/bathroom.tscn")


func _on_label_3_pressed() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/bedroom.tscn")
