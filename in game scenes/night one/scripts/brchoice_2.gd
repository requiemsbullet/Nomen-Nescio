extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i will take the match. i'm sure it will get the job done.")
	DialogueManager.queue_dialogue("???", "will it?")
	DialogueManager.queue_dialogue("maria", "it makes light, that's what matters.")
	DialogueManager.queue_dialogue("???", "yes, for a little while.")
	DialogueManager.queue_dialogue("maria", "a little while is better than nothing.")
	DialogueManager.queue_dialogue("???", "sometimes.")
	DialogueManager.queue_dialogue("maria", "you make everything sound hopeless...")
	DialogueManager.queue_dialogue("???", "no. only temporary things.")
	DialogueManager.queue_dialogue("maria", "and what isn't temporary?")
	DialogueManager.queue_dialogue("???", "you tell me. you've been here longer than you can remmeber.")
	DialogueManager.queue_dialogue("???", "...")
	DialogueManager.queue_dialogue("???", "oh, maria. i must remind you.")
	DialogueManager.queue_dialogue("???", "be careful when you strike the match.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/mariaroom2.tscn")
