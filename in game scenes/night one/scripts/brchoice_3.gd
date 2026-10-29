extends Node2D
@onready var fade: CanvasLayer = $fade

func _ready() -> void:
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

	fade.show()
	fade.get_node("ColorRect").color = Color.BLACK
	fade.get_node("ColorRect").color.a = 0.0

	start_room_dialogue()
func start_room_dialogue() -> void:
	DialogueManager.queue_dialogue("maria", "i will take the candle.")
	DialogueManager.queue_dialogue("???", "a little light.")
	DialogueManager.queue_dialogue("maria", "you're making it sound insignificant.")
	DialogueManager.queue_dialogue("???", "it is little. that doesn't make it insignificant.")
	DialogueManager.queue_dialogue("maria", "will it help me find my way out?")
	DialogueManager.queue_dialogue("???", "hm. it will help you see where you are.")
	DialogueManager.queue_dialogue("maria", "that's not the same thing...")
	DialogueManager.queue_dialogue("???", "you're right. it's not.")
	DialogueManager.queue_dialogue("???", "keep it close, maria.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().call_deferred("change_scene_to_file", "res://in game scenes/night one/scenes/mariaroom2.tscn")
