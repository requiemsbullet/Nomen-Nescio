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
	DialogueManager.queue_dialogue("maria", "... i'm back.")
	DialogueManager.queue_dialogue("maria", "i don't think i find it really surprising anymore.")
	DialogueManager.queue_dialogue("maria", "i thought it might look different this time...")
	DialogueManager.queue_dialogue("maria", "but... it's the same. the same fireplace, same chair, same doors.")
	DialogueManager.queue_dialogue("maria", "the house must have settled.")
	DialogueManager.queue_dialogue("maria", "or it became used to my presence.")

func _on_dialogue_finished() -> void:
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/livingroomc.tscn")
