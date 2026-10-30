extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 1.0

	await get_tree().process_frame
	await fade.fade(0.0, 0.5).finished

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i've started to wonder...")
	DialogueManager.queue_dialogue("maria", "is this room meant to be mine?")
	DialogueManager.queue_dialogue("maria", "well... thats a stupid question.")
	DialogueManager.queue_dialogue("maria", "this is not inherently my home, none of this belongs to me.")
	DialogueManager.queue_dialogue("maria", "but, it is within my dream... hm.")
	DialogueManager.queue_dialogue("maria", "sylvan isn't here... i've seen enough. i need to find her.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night two/scenes/livingroom.tscn")
