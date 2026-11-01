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
	DialogueManager.queue_dialogue("maria", "never in the same place twice...")
	DialogueManager.queue_dialogue("maria", "i should have known this by now.")
	DialogueManager.queue_dialogue("maria", "i'm just wasting time staying here...")
	DialogueManager.queue_dialogue("maria", "i need to go find sylvan.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/livingroomc.tscn")
