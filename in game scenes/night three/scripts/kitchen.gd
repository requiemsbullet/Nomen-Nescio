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
	DialogueManager.queue_dialogue("maria", "hm... i don't think i've ever paid much attention to this room.")
	DialogueManager.queue_dialogue("maria", "it's funny. i can remember the smallest details of this house but...")
	DialogueManager.queue_dialogue("maria", "i can't remember ever seeing this house prior to the dreams.")
	DialogueManager.queue_dialogue("maria", "...")
	DialogueManager.queue_dialogue("maria", "i should find sylvan.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/livingroomc.tscn")
