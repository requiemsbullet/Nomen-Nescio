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
	DialogueManager.queue_dialogue("maria", "it's nothing new. i've had this dream many times before.")
	DialogueManager.queue_dialogue("maria", "more times than i can remember, actually.")
	DialogueManager.queue_dialogue("maria", "for a while, i would count them. i would try to make sense of the differences... what changed and what would stay the same.")
	DialogueManager.queue_dialogue("maria", "i don't bother anymore. it's always the same place.")
	DialogueManager.queue_dialogue("maria", "the same house in the woods, no road leading to or from just a path ending not long from the doorway.")
	DialogueManager.queue_dialogue("maria", "and yet, every time, i know how find it.")
	DialogueManager.queue_dialogue("maria", "honestly, i used to think that meant something. like... maybe in some weird symbolic way it was home.")
	DialogueManager.queue_dialogue("maria", "i'm not sure, honestly. the house is never... consistent. sure, it's always in the same place but...")
	DialogueManager.queue_dialogue("maria", "sometimes the trees are closer- or the windows are in the wrong places.")
	DialogueManager.queue_dialogue("maria", "i remember once there was even a second chimney.")
	DialogueManager.queue_dialogue("maria", "just enough to make it feel unfamiliar again.")
	DialogueManager.queue_dialogue("maria", "it became expected, i knew when i reached the house i was where i was meant to be.")
	DialogueManager.queue_dialogue("maria", "though, recently i'm not so sure. i've started feeling as if i've shown up somewhere i'm not meant to be.")
	DialogueManager.queue_dialogue("maria", "and... there's something else too.")
	DialogueManager.queue_dialogue("maria", "i can't really explain it. it's mostly a feeling.")
	DialogueManager.queue_dialogue("maria", "like the moment that you realise you're not alone in a room even though you've watched the door and you haven't hear anyone else come in.")
	DialogueManager.queue_dialogue("maria", "like maybe something has been waiting for me.")
	DialogueManager.queue_dialogue("maria", "i no longer think i'm the only one here.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/cabindoor.tscn")
