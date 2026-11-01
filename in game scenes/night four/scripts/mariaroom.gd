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
	DialogueManager.queue_dialogue("maria", "three nights.")
	DialogueManager.queue_dialogue("maria", "three nights of that house... three nights of her.")
	DialogueManager.queue_dialogue("maria", "i'm not scared per say but...")
	DialogueManager.queue_dialogue("maria", "it still doesn't feel right. a large part of me doesn't want this to become normal")
	DialogueManager.queue_dialogue("maria", "the longer this goes on the less it feels like a dream.")
	DialogueManager.queue_dialogue("maria", "it feels too real... almost like when i go to bed i don't dream, instead i move to a new world that is waiting for me each time.")
	DialogueManager.queue_dialogue("maria", "everytime i have come back with more questions than i entered with.")
	DialogueManager.queue_dialogue("maria", "and the worst part is i can't tell if she is helping me or if i am just doing exactly what she wants me to...")
	DialogueManager.queue_dialogue("maria", "i don't want to go back.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "but, i know i have no choice... once i close my eyes i will be there again.")
	DialogueManager.queue_dialogue("maria", "i know i said this before but... just one more night. one more and i will get an answer. it can't be this limbo forever.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night four/scenes/livingroom.tscn")
