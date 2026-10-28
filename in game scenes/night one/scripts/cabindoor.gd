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
	DialogueManager.queue_dialogue("maria", "i could leave. i think about it every time.")
	DialogueManager.queue_dialogue("maria", "i could just turn away, walk into the woods and keep walking until i find something new.")
	DialogueManager.queue_dialogue("maria", "but, even knowing this, i've never tried.")
	DialogueManager.queue_dialogue("maria", "i'm not sure what would scare me more... being able to leave, having to face something new, or being stuck here.")
	DialogueManager.queue_dialogue("maria", "not knowing is much more comforting.")
	DialogueManager.queue_dialogue("maria", "just as i always fall asleep, i will always wake up no matter what i find.")
	DialogueManager.queue_dialogue("maria", "i always have, i always will. it's human nature.")
	DialogueManager.queue_dialogue("maria", "so why does it feel so different this time?")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/clivingroom.tscn")
