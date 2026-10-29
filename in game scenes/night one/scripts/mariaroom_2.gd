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
	DialogueManager.queue_dialogue("maria", "i'm in my room again... i'm home.")
	DialogueManager.queue_dialogue("maria", "not that it should come as much surprise.")
	DialogueManager.queue_dialogue("maria", "just another dream...")
	DialogueManager.queue_dialogue("maria", "though, i can't get it out of my head.")
	DialogueManager.queue_dialogue("maria", "the house - the woods - that woman...")
	DialogueManager.queue_dialogue("maria", "i feel as if i know her on some deep personal level but... i've never met her before.")
	DialogueManager.queue_dialogue("maria", "sylvan.")
	DialogueManager.queue_dialogue("maria", "i should have asked her more questions...")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "no- i did. she just never gave me any proper answers...")
	DialogueManager.queue_dialogue("maria", "just those weird riddles.")
	DialogueManager.queue_dialogue("maria", "a candle, a string, a match...")
	DialogueManager.queue_dialogue("maria", "i don't know if i chose the right one.")
	DialogueManager.queue_dialogue("maria", "it doesn't matter though. it was just a dream.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night two/scenes/opening.tscn")
