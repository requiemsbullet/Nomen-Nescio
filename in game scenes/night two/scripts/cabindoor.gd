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
	DialogueManager.queue_dialogue("maria", "i'm here already...")
	DialogueManager.queue_dialogue("maria", "i was supposed to walk every other time.")
	DialogueManager.queue_dialogue("maria", "i remember the half path, the trees, the fence near the bend - i remember walking all the way here every other time.")
	DialogueManager.queue_dialogue("maria", "the dream started me here this time. it wanted me here.")
	DialogueManager.queue_dialogue("maria", "i'm sure that's meant to mean something...")
	DialogueManager.queue_dialogue("maria", "... i suppose i will find out.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/cabindoor.tscn")
