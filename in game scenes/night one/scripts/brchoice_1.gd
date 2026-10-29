extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i will take the string. it should be useful.")
	DialogueManager.queue_dialogue("???", "what for?")
	DialogueManager.queue_dialogue("maria", "finding my way back - if i decide to leave, to explore, i could leave a trail.")
	DialogueManager.queue_dialogue("???", "and if the trail leads you somewhere you no longer wish to be at?")
	DialogueManager.queue_dialogue("maria", "the i'll turn around.")
	DialogueManager.queue_dialogue("???", "of course.")
	DialogueManager.queue_dialogue("???", "assuming you know which end to follow.")
	DialogueManager.queue_dialogue("maria", "you're saying i shouldn't take it?")
	DialogueManager.queue_dialogue("???", "i'm saying you know what string is for.")
	DialogueManager.queue_dialogue("???", "just don't mistake returning for escaping.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/mariaroom2.tscn")
