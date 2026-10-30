extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i guess the mirror could be useful...")
	DialogueManager.queue_dialogue("sylvan", "to... see yourself?")
	DialogueManager.queue_dialogue("maria", "to see around me. to see what is hidden.")
	DialogueManager.queue_dialogue("sylvan", "and if you do find something, what will you do when you see it?")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().change_scene_to_file("res://in game scenes/night two/scenes/choices/lychoicemenu.tscn")
