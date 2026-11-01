extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "the needle.")
	DialogueManager.queue_dialogue("maria", "there is something making the sound... causing this.")
	DialogueManager.queue_dialogue("maria", "maybe i will be able to find it.")
	DialogueManager.queue_dialogue("sylvan", "and what wil you do when you find it?")
	DialogueManager.queue_dialogue("maria", "i don't... know. stop it, i guess?")
	DialogueManager.queue_dialogue("sylvan", "you can not wound everything that hurts you.")
	DialogueManager.queue_dialogue("maria", "no, but i can try.")
	DialogueManager.queue_dialogue("sylvan", "yes, you can.")
	DialogueManager.queue_dialogue("sylvan", "just remember that searching for a wound is not the same as healing nor finding its cause.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/placeholderending.tscn")
