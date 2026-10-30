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
	DialogueManager.queue_dialogue("maria", "hm... i'm not sure what to think...")
	DialogueManager.queue_dialogue("maria", "i feel like... this may be weird to say but.")
	DialogueManager.queue_dialogue("maria", "i'm almost looking forward to returning to the cabin tonight.")
	DialogueManager.queue_dialogue("maria", "not in a way of comfort- not as in its something i'm running too.")
	DialogueManager.queue_dialogue("maria", "more... reaching for a sense of closure. i need to understand.")
	DialogueManager.queue_dialogue("maria", "why all of the riddles? why does it keep changing?")
	DialogueManager.queue_dialogue("maria", "and most importantly, who is sylvan?")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night two/scenes/cabindoor.tscn")
