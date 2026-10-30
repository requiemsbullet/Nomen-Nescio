extends Node2D
@onready var fade: CanvasLayer = $fade
@onready var menu_music: AudioStreamPlayer = $AudioStreamPlayer

func _process(_delta: float) -> void:
	pass


func _on_play_pressed():
	await fade.fade(1.0, 0.5).finished
	menu_music.stop()
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/opening.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/utility/settings.tscn")


func _on_information_pressed():
	get_tree().change_scene_to_file("res://scenes/utility/infomenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
