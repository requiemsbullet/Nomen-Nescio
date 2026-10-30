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
func start_room_dialogue() ->void:
	DialogueManager.queue_dialogue("maria", "i used to forget everything by morning.")
	DialogueManager.queue_dialogue("maria", "it happened again. two nights in a row.")
	DialogueManager.queue_dialogue("maria", "i remember everything.")
	DialogueManager.queue_dialogue("maria", "the story.. the rooms.")
	DialogueManager.queue_dialogue("maria", "sylvan...")
	DialogueManager.queue_dialogue("maria", "she is starting to feel too real...")
	DialogueManager.queue_dialogue("maria", "i've started to convince myself that if i can remember enough i will start to understand what this place wants from me")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "maybe i should just stop trying.")
	DialogueManager.queue_dialogue("maria", "just one more night.")
	DialogueManager.queue_dialogue("maria", "one more night and maybe... maybe i will start to understand it.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/livingroom")
