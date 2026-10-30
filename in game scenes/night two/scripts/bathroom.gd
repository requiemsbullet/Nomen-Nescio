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
	DialogueManager.queue_dialogue("maria", "oh...")
	DialogueManager.queue_dialogue("maria", "i was kind of expecting sylvan to be here...")
	DialogueManager.queue_dialogue("maria", "i guess i should keep looking.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night two/scenes/livingroom.tscn")
