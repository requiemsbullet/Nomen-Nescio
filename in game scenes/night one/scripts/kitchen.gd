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
	DialogueManager.queue_dialogue("maria", "i don't think i've ever found anything useful in here.")
	DialogueManager.queue_dialogue("maria", "it's strange, everything seems as if someone was here not long ago... but no sign of who")
	DialogueManager.queue_dialogue("maria", "i guess thats just the nature of this place....")
	DialogueManager.queue_dialogue("maria", "it seems as if there is nothing useful for me to find in the kitchen.")
	DialogueManager.queue_dialogue("maria", "i've spent enough time here.")
	
func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 2.0).finished
	get_tree().change_scene_to_file("res://in game scenes/night one/scenes/clivingroomc.tscn")
