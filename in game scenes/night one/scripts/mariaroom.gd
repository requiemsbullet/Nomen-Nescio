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
	DialogueManager.queue_dialogue("maria", "i should really start going to bed earlier.")
	DialogueManager.queue_dialogue("maria", "it's always the same. i tell myself i'll sleep at a reasonable hour and then lay here for ages")
	DialogueManager.queue_dialogue("maria", "or too many things.")
	DialogueManager.queue_dialogue("maria", "i guess it doesn't really matter.")
	DialogueManager.queue_dialogue("maria", "i'll fall asleep eventually, i always do.")
	DialogueManager.queue_dialogue("maria", "and then i will have that dream again.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/cabin_outer.tscn")
