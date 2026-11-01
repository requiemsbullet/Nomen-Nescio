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
	DialogueManager.queue_dialogue("maria", "hm...")
	DialogueManager.queue_dialogue("maria", "i really need to stop expecting her to be in the same place twice...")
	DialogueManager.queue_dialogue("maria", "i thought i'd feel less afraid coming back. like maybe i would feel some sense of closure.")
	DialogueManager.queue_dialogue("maria", "but... it's weird. i don't feel any closure just more confusion...")
	DialogueManager.queue_dialogue("maria", "she isn't here. i guess i should be relieved.")
	DialogueManager.queue_dialogue("maria", "i wonder if she is waiting for me elsewhere.")

func _on_dialogue_finished() -> void:
	await fade.fade(1.0, 0.5).finished
	get_tree().change_scene_to_file("res://in game scenes/night three/scenes/livingroomc.tscn")
