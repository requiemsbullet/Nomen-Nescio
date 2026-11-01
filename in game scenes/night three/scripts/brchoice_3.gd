extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "an empty bottle...")
	DialogueManager.queue_dialogue("sylvan", "a place for something to remain.")
	DialogueManager.queue_dialogue("maria", "you said the person caught the sound.")
	DialogueManager.queue_dialogue("sylvan", "they gave it somewhere to go.")
	DialogueManager.queue_dialogue("maria", "same different")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "what am i meant to put inside of it?")
	DialogueManager.queue_dialogue("sylvan", "you will find out when the time comes.")
	DialogueManager.queue_dialogue("sylvan", "keep it close, maria.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/placeholderending.tscn")
