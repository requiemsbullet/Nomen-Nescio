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
	DialogueManager.queue_dialogue("maria", "same as last time... no sylvan.")
	DialogueManager.queue_dialogue("maria", "i want this to be over with already...")
	DialogueManager.queue_dialogue("maria", "i just want to find her and be done with it all i just... i can't take much more of this.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night four/scenes/livingroom.tscn")
